package com.flf.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.flf.entity.ShopPhonesig;
 import com.flf.service.ShopPhonesigService;
/**
 * 
 * <br>
 * <b>功能：</b>ShopPhonesigController<br>
 *   <br>
 */ 
@Controller
public class ShopPhonesigController {
	
	private final static Logger log= Logger.getLogger(ShopPhonesigController.class);
	@Autowired(required=false) 
	private ShopPhonesigService shopPhonesigService; 
	
	
	
	
	

}
