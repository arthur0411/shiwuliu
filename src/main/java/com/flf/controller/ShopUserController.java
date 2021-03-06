package com.flf.controller;

import java.io.PrintWriter;
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
import com.flf.entity.ShopUser;
import com.flf.entity.ShopUserAddress;
import com.flf.entity.ShopWithdrawals;
import com.flf.service.ShopUserAddressService;
import com.flf.service.ShopUserService;
import com.flf.util.ExcelUtil;

/**
 * 
 * <br>
 * <b>功能：</b>ShopUserController<br>
 * <br>
 */
@Controller
@RequestMapping(value = "/shopUser")
public class ShopUserController {

	private final static Logger log = Logger.getLogger(ShopUserController.class);
	@Autowired(required = false)
	private ShopUserService shopUserService;

	@Autowired(required = false)
	private ShopUserAddressService shopUserAddressService;

	@RequestMapping(value = "/list")
	public ModelAndView list(ShopUser vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		List<Map<String, Object>> shopUserList = shopUserService.listPage(vo);

		mv.addObject("vo", vo);
		mv.addObject("shopUserList", shopUserList);
		mv.setViewName("shopUserList");

		return mv;
	}

	@RequestMapping(value = "/selectInfo")
	public ModelAndView selectInfo(@RequestParam Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> vo = shopUserService.queryShopUserInfoById(id);
		mv.addObject("userManager", vo);
		// 收货地址
		List<ShopUserAddress> shopAddressList = shopUserAddressService.getShopAddressList(id);
		mv.addObject("shopAddressList", shopAddressList);

		mv.setViewName("selectInfo");
		return mv;
	}

	@RequestMapping(value = "/edit")
	public ModelAndView edit(@RequestParam Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		ShopUser vo = shopUserService.queryById(id);
		mv.addObject("ShopUser", vo);
		mv.setViewName("ShopUserEdit");
		return mv;
	}

	@RequestMapping(value = "/delete")
	public void delete(Integer[] id, PrintWriter out) throws Exception {
		shopUserService.delete((Object[]) id);
		out.print("success");
		out.close();
	}

	@RequestMapping(value = "/updateUserStatus")
	public void updateUserStatus(Integer id, PrintWriter out) throws Exception {
		shopUserService.updateUserStatus(id);
		out.print("success");
		out.close();
	}
	
	/**
	 * 导出excel
	 */

	@RequestMapping(value = "/excel")
	public void exportWithdrawals(HttpServletRequest request, HttpServletResponse response) {
		try {
			XSSFWorkbook wb = shopUserService.exportUsers();
			String filename = HttpUtil.encodeFilename(request, "客户列表");
			ExcelUtil.output(response, filename, wb);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
