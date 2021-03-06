package com.flf.service;

import java.util.List;
import java.util.Map;

import com.base.service.BaseService;
import com.flf.entity.ShopRecharge;
import com.flf.entity.ShopRechargeVo;

/**
 * 
 * <br>
 * <b>功能：</b>ShopRechargeService<br>
 */
public interface ShopRechargeService extends BaseService {

	ShopRecharge getByOutTradeNo(String out_trade_no);

	int updateHajRecharge(String prepayId, String alipayTradeNo);

	void updateUserRechargeRecord(String prepayId, String valueOf, String alipayTradeNo);

	void updateDeposit(String prepayId, String valueOf, String alipayTradeNo);

	List<ShopRecharge> list(ShopRecharge vo);

	Map<String, Object> queryTotalRecharge(ShopRechargeVo vo);

	Map<String, Object> queryTotalRefund(ShopRechargeVo vo);

	List<ShopRecharge> queryRechargeListForRerund(ShopRechargeVo vo);
	
	ShopRecharge findById(Object id);

}
