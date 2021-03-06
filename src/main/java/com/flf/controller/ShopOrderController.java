package com.flf.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.base.util.HttpUtil;
import com.flf.entity.ShopOrder;
import com.flf.service.ShopCommodityService;
import com.flf.service.ShopOrderDetailsService;
import com.flf.service.ShopOrderService;
import com.flf.util.DateUtil;
import com.flf.util.ExcelUtil;
import com.flf.util.JSONUtils;

/**
 * 
 * <br>
 * <b>功能：</b>ShopOrderController<br>
 * <br>
 */
@Controller
@RequestMapping(value = "/shopOrder")
public class ShopOrderController {

	private final static Logger log = Logger.getLogger(ShopOrderController.class);
	@Autowired(required = false)
	private ShopOrderService shopOrderService;

	@Autowired(required = false)
	private ShopOrderDetailsService shopOrderDetailsService;

	@Autowired(required = false)
	private ShopCommodityService shopCommodityService;

	/**
	 * 后台查询订单列表
	 *
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(HttpSession session, ShopOrder orderVo) {
		ModelAndView mv = new ModelAndView();
		try {
			List<Map<String, Object>> orderList = shopOrderService.listAllOrder(orderVo);
			mv.addObject("orderList", orderList);
			mv.addObject("order", orderVo);

			mv.setViewName("orderlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/supplier")
	public ModelAndView supplier(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("supplierList");
		return mv;
	}
	
	/**
	 * 订单详情
	 *
	 * @param orderId
	 */
	@RequestMapping(value = "/orderDetail")
	public ModelAndView orderDetail(@RequestParam int orderId, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 获取订单信息
		Map<String, Object> orderMap = shopOrderService.getOrderInfoById(orderId);

		// 获取订单详情信息
		List<Map<String, Object>> detailsList = shopOrderDetailsService.listAllOrderDetails(orderId);

		mv.addObject("orderMap", orderMap);
		mv.addObject("detailsList", detailsList);
		mv.setViewName("order_details");
		return mv;
	}

	/**
	 * 跳转到修改物流公司
	 *
	 * @param orderId
	 */
	@RequestMapping(value = "/toUpdateExpress")
	public ModelAndView toUpdateExpress(@RequestParam int orderId, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 获取订单信息
		Map<String, Object> orderMap = shopOrderService.getOrderInfoById(orderId);

		mv.addObject("orderMap", orderMap);
		mv.setViewName("orderExpress");
		return mv;
	}

	/**
	 * 已发货填写物流单号，扣减库存，生成配送时间
	 */
	@RequestMapping(value = "/saveExpress")
	public void saveExpress(ShopOrder orderVo, HttpServletResponse response) {

		//boolean inventoryIsEnough;
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			log.info("已发货填写物流单号，生成配送时间");
			orderVo.setDeliveryTime(DateUtil.datetime2Str(new Date()));
			int resultId = shopOrderService.updateExpress(orderVo);
			if (resultId > 0) {
				jsonMap.put("error", "0");
				jsonMap.put("msg", "成功");
			} else {
				jsonMap.put("error", "0");
				jsonMap.put("msg", "为空");
			}
				
			/*} catch (ArithmeticException e) {
			// 此异常为商品库存不足时主动抛出
			// 下架商品的操作需要在此处完成，因为service中抛异常时所有操作都会回滚
			String[] messages = e.getMessage().split(";");
			log.info("订单" + orderVo.getOrderId() + "抛异常： " + messages[0]);
			if (messages.length > 1) {
				log.info("库存不足，下架" + messages[1]);
				// shopCommodityService.updateSoldOut(Integer.parseInt(messages[1]));
			}
			jsonMap.put("error", "5");
			jsonMap.put("msg", messages[0]);*/
		} catch (Exception e) {
			jsonMap.put("error", "1");
			jsonMap.put("msg", "未知异常");
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
	 * 货品验收
	 *
	 * @param orderId
	 */
	@RequestMapping(value = "/checkOrder")
	public void updateCheckOrder(@RequestParam Integer orderId, Integer status, HttpServletResponse httpServletResponse) {
		try {
			ShopOrder order = new ShopOrder();
			order.setOrderId(orderId);
			order.setOrderStatus(status);
			shopOrderService.updateCheckOrder(order);
			JSONUtils.printStr("1", httpServletResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出excel
	 */

	@RequestMapping(value = "/excel")
	public void exportWithdrawals(HttpServletRequest request, HttpServletResponse response) {
		try {
			XSSFWorkbook wb = shopOrderService.exportOrders();
			String filename = HttpUtil.encodeFilename(request, "订单列表");
			ExcelUtil.output(response, filename, wb);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	

}
