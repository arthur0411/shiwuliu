package com.flf.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.flf.entity.ShopRecommend;
 import com.flf.service.ShopRecommendService;
/**
 * 
 * <br>
 * <b>功能：</b>ShopRecommendController<br>
 *   <br>
 */ 
@Controller
public class ShopRecommendController {
	
	private final static Logger log= Logger.getLogger(ShopRecommendController.class);
	@Autowired(required=false) 
	private ShopRecommendService shopRecommendService; 
	
	
	
	
	

}
