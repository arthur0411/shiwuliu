package com.flf.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.ShopTradingHistory;
import com.flf.service.ShopTradingHistoryService;

/**
 * 
 * <br>
 * <b>功能：</b>ShopTradingHistoryController<br>
 * <br>
 */
@Controller
@RequestMapping(value = "/shopTradingHistory")
public class ShopTradingHistoryController {

	private final static Logger log = Logger.getLogger(ShopTradingHistoryController.class);
	@Autowired(required = false)
	private ShopTradingHistoryService service;

	@RequestMapping(value = "/list")
	public ModelAndView list(ShopTradingHistory vo) {
		ModelAndView mv = new ModelAndView();

		List<ShopTradingHistory> tradingHistoryList = service.listPageTradingHistory(vo);

		mv.addObject("tradingHistoryList", tradingHistoryList);
		mv.addObject("vo", vo);
		mv.setViewName("tradingHistoryList");

		return mv;
	}
}
