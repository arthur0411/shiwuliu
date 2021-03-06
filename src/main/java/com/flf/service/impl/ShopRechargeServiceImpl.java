package com.flf.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseServiceImpl;
import com.flf.entity.ShopRecharge;
import com.flf.entity.ShopRechargeVo;
import com.flf.entity.ShopTradingHistory;
import com.flf.entity.ShopUser;
import com.flf.mapper.ShopRechargeMapper;
import com.flf.mapper.ShopTradingHistoryMapper;
import com.flf.mapper.ShopUserMapper;
import com.flf.service.ShopRechargeService;
import com.flf.util.DateUtil;

/**
 * 
 * <br>
 * <b>功能：</b>ShopRechargeService<br>
 */
@Service("shopRechargeService")
public class ShopRechargeServiceImpl extends BaseServiceImpl implements ShopRechargeService {
	private final static Logger log = Logger.getLogger(ShopRechargeServiceImpl.class);

	@Autowired
	private ShopRechargeMapper dao;

	@Autowired
	private ShopUserMapper userDao;

	@Autowired
	private ShopTradingHistoryMapper historyDao;

	@Override
	public ShopRechargeMapper getDao() {
		return dao;
	}

	@Override
	public ShopRecharge getByOutTradeNo(String out_trade_no) {
		return dao.getByOutTradeNo(out_trade_no);
	}

	@Override
	public int updateHajRecharge(String prepayId, String alipayTradeNo) {
		return dao.updateHajRecharge(prepayId, alipayTradeNo);
	}

	@Override
	public void updateUserRechargeRecord(String prepay_id, String rechargeFor, String alipayTradeNo) {
		Map<String, Object> rechargeMap = dao.getHajRechargeByPrepay_id(prepay_id);
		if (null != rechargeMap && rechargeFor.equals("0")) {
			int userId = Integer.parseInt(rechargeMap.get("userId").toString());
			BigDecimal rechargeMoney = new BigDecimal(rechargeMap.get("money").toString());

			ShopTradingHistory trading = new ShopTradingHistory();
			ShopUser user = new ShopUser();
			user.setId(userId);

			user.setBalance(rechargeMoney);
			trading.setTradingContent("充值增加余额：" + rechargeMoney);
			userDao.updateUserMoneyByRecharge(user);

			trading.setCreateTime(DateUtil.dateToString(new Date()));
			trading.setMoney(rechargeMoney);
			trading.setTradingStatus(1);
			trading.setUserId(userId);
			trading.setType(1);// 减少
			historyDao.add(trading);
		}
	}

	/**
	 * 押金
	 */
	@Override
	public void updateDeposit(String prepayId, String rechargeFor, String userVip) {
		Map<String, Object> rechargeMap = dao.getHajRechargeByPrepay_id(prepayId);
		if (null != rechargeMap && rechargeFor.equals("1")) {
			int userId = Integer.parseInt(rechargeMap.get("userId").toString());
			BigDecimal rechargeMoney = new BigDecimal(rechargeMap.get("money").toString());
			BigDecimal deposit = new BigDecimal(0);
			switch (rechargeMap.get("paymentTarget").toString()) {
			case "2":
				deposit = rechargeMoney.subtract(new BigDecimal(9.9));
				break;
			case "3":
				deposit = rechargeMoney.subtract(new BigDecimal(119));
				break;
			case "4":
				deposit = rechargeMoney.subtract(new BigDecimal(297));
				break;
			case "5":
				deposit = rechargeMoney.subtract(new BigDecimal(948));
				break;
			default:
				deposit = BigDecimal.ZERO ;
				break;
			}
			ShopTradingHistory trading = new ShopTradingHistory();
			ShopUser user = new ShopUser();
			user.setId(userId);

			user.setDeposit(deposit);
			user.setUserVip(Integer.parseInt(userVip));
			trading.setTradingContent("押金：" + rechargeMoney);
			userDao.updateUserDepositByRecharge(user);

			trading.setCreateTime(DateUtil.dateToString(new Date()));
			trading.setMoney(rechargeMoney);
			trading.setTradingStatus(1);
			trading.setUserId(userId);
			trading.setType(1);// 减少
			historyDao.add(trading);
		}
	}

	@Override
	public List<ShopRecharge> list(ShopRecharge vo) {
		return dao.listPage(vo);
	}

	@Override
	public Map<String, Object> queryTotalRecharge(ShopRechargeVo vo) {
		return dao.queryTotalRecharge(vo);
	}

	@Override
	public Map<String, Object> queryTotalRefund(ShopRechargeVo vo) {
		return dao.queryTotalRefund(vo);
	}

	@Override
	public List<ShopRecharge> queryRechargeListForRerund(ShopRechargeVo vo) {
		return dao.queryRechargeListForRerund(vo);
	}

	@Override
	public ShopRecharge findById(Object id) {
		return dao.findById(id);
	}

}
