package com.flf.controller.app;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.base.criteria.Criteria;
import com.flf.entity.ShopRecharge;
import com.flf.entity.ShopTradingHistory;
import com.flf.entity.ShopUser;
import com.flf.entity.ShopWithdrawals;
import com.flf.service.ShopAccountService;
import com.flf.service.ShopOrderService;
import com.flf.service.ShopRechargeService;
import com.flf.service.ShopTradingHistoryService;
import com.flf.service.ShopUserService;
import com.flf.service.ShopWithdrawalsService;
import com.flf.util.DateUtil;
import com.flf.util.JSONUtils;
import com.weixin.PayUtil;

/**
 * 
 * <br>
 * <b>功能：</b>ShopWithdrawalsController<br>
 * <br>
 */
@Controller
@RequestMapping(value = "/withdrawApp")
public class ShopWithdrawalsAppController {

	private final static Logger log = Logger.getLogger(ShopWithdrawalsAppController.class);
	@Autowired(required = false)
	private ShopWithdrawalsService shopWithdrawalsService;

	@Autowired(required = false)
	private ShopUserService shopUserService;

	@Autowired(required = false)
	private ShopTradingHistoryService shopTradingHistoryService;

	@Autowired(required = false)
	private ShopOrderService shopOrderService;
	
	@Autowired(required = false)
	private ShopAccountService shopAccountService;
	
	@Autowired(required = false)
	private ShopRechargeService shopRechargeService;

	/**
	 * 申请退押金
	 * 
	 * @param userId
	 * @param sign
	 * @param response
	 */
	@RequestMapping(value = "/saveWithdrawal")
	public void saveWithdrawal(@RequestParam int userId, HttpServletResponse response) {
		log.info("用户申请退押金接口-->userId:" + userId);
		Map<String, Object> jsonMap = new HashMap<>();
		try {
			ShopUser user = shopUserService.queryById(userId);
			if (null != user && user.getDeposit().doubleValue() > 0) {
				if(user.getReductionDays() == 0 || user.getReductionDays() == null) {
					ShopWithdrawals withdrawals = new ShopWithdrawals();
					withdrawals.setUserId(userId);
					withdrawals.setWclass(0);
					withdrawals.setCreateTime(DateUtil.datetime2Str(new Date()));
					withdrawals.setIsConfirm(0); // 财务是否确认（1是0否）
					withdrawals.setStatus(0); // 是否成功（1是0否）
					withdrawals.setMoney(user.getDeposit());
					int count = shopWithdrawalsService.add(withdrawals);
					
					
					
					if (count > 0) {
						// 更新用户金额为0
						shopUserService.updateUserMoney(user.getId());
	
						// 增加用户流水
						ShopTradingHistory trading = new ShopTradingHistory();
						trading.setTradingContent("退押金中：" + withdrawals.getMoney());
						trading.setCreateTime(DateUtil.dateToString(new Date()));
						trading.setMoney(withdrawals.getMoney());
						trading.setTradingStatus(1);
						trading.setUserId(withdrawals.getUserId());
						trading.setType(0);// 减少
						shopTradingHistoryService.saveTradeRecord(trading);
	
						jsonMap.put("error", "0");
						jsonMap.put("msg", "成功");
					} else {
						jsonMap.put("msg", "失败");
					}
					jsonMap.put("user", shopUserService.queryById(userId));
				}else {
					jsonMap.put("error", "1");
					jsonMap.put("msg", "月卡未到期暂不能退押金");
				}
			} else {
				jsonMap.put("error", "1");
				jsonMap.put("msg", "暂无押金");
			}
		} catch (Exception e) {
			jsonMap.put("error", "1");
			jsonMap.put("msg", "未知异常");
			log.error(e);
			e.printStackTrace();
		} finally {
			try {
				JSONUtils.printObject(jsonMap, response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/*
	 * 返现提取
	 */
	@RequestMapping(value = "/saveBalanceWithdrawal")
	public void saveBalanceWithdrawal(@RequestParam int userId, HttpServletResponse response) {
		log.info("用户申请返现接口-->userId:" + userId);
		Map<String, Object> jsonMap = new HashMap<>();
		try {
			ShopUser user = shopUserService.queryById(userId);
			if (null != user && user.getBalance().doubleValue() >= 200) {
				ShopWithdrawals withdrawals = new ShopWithdrawals();
				withdrawals.setUserId(userId);
				withdrawals.setWclass(1);
				withdrawals.setCreateTime(DateUtil.datetime2Str(new Date()));
				withdrawals.setIsConfirm(0); // 财务是否确认（1是0否）
				withdrawals.setStatus(0); // 是否成功（1是0否）
				withdrawals.setMoney(new BigDecimal(200));
				int count = shopWithdrawalsService.add(withdrawals);

				if (count > 0) {
					// 更新用户金额减少200
					shopAccountService.updateUserBalance(userId);

					// 增加用户流水
					ShopTradingHistory trading = new ShopTradingHistory();
					trading.setTradingContent("提现中：" + withdrawals.getMoney());
					trading.setCreateTime(DateUtil.dateToString(new Date()));
					trading.setMoney(withdrawals.getMoney());
					trading.setTradingStatus(1);
					trading.setUserId(withdrawals.getUserId());
					trading.setType(0);// 减少
					shopTradingHistoryService.saveTradeRecord(trading);

					jsonMap.put("error", "0");
					jsonMap.put("msg", "成功");
				} else {
					jsonMap.put("msg", "失败");
				}
				jsonMap.put("user", shopUserService.queryById(userId));

			} else {
				jsonMap.put("error", "1");
				jsonMap.put("msg", "返现金额低于200不能提现");
			}
		} catch (Exception e) {
			jsonMap.put("error", "1");
			jsonMap.put("msg", "未知异常");
			log.error(e);
			e.printStackTrace();
		} finally {
			try {
				JSONUtils.printObject(jsonMap, response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 根据用户id判断是否有佩戴中订单
	 * 
	 * @param user
	 * @return
	 * @throws Exception
	 */
	private boolean undoneOrdersCheck(ShopUser user) throws Exception {
		Criteria criteria = new Criteria();
		Map<String, Object> condition = new HashMap<>();
		condition.put("userId", user.getId());
		condition.put("status", 3);
		criteria.setCondition(condition);

		int undoneOrderCount = shopOrderService.queryByCount(criteria);

		return undoneOrderCount > 0;
	}

}
