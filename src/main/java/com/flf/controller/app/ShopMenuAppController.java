package com.flf.controller.app;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.flf.service.ShopMenuService;

/**
 * 
 * <br>
 * <b>功能：</b>ShopMenuAppController<br>
 * <br>
 */
@Controller
public class ShopMenuAppController {

	private final static Logger log = Logger.getLogger(ShopMenuAppController.class);
	@Autowired(required = false)
	private ShopMenuService shopMenuService;

}
