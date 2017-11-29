package com.flf.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.criteria.Criteria;
import com.base.service.BaseService;
import com.flf.entity.ShopCommodity;
import com.flf.entity.ShopOrderDetails;

/**
 * 
 * <br>
 * <b>功能：</b>ShopCommodityService<br>
 */
public interface ShopCommodityService extends BaseService {

	List<Map<String, Object>> getCommodityIndex(Criteria criteria);

	List<Map<String, Object>> getRecommendCommodity(Criteria criteria);

	List<Map<String, Object>> getCommodityByTagId(Criteria criteria);

	List<Map<String, Object>> listPage(ShopCommodity vo);

	List<ShopCommodity> listcart();
	
	ShopCommodity getCommodityById(Integer id);

	List<Map<String, Object>> getSearchCommodity(Criteria criteria);

	int updateInventoryReduce(ShopOrderDetails details);
	
	int updateRentInventoryReduce(ShopOrderDetails details);

	void updateSoldOut(Integer commodityId);
	
	void updateStock(Integer commodityId,Integer num);

	List<Map<String, Object>> getBrandTopicCommodity(Criteria criteria);

	List<Map<String, Object>> getSaleStockById(String[] commodityId);

	List<Map<String, Object>> getRentStockById(String[] commodityId);
	
	String getRentStock(Object commodityId);
	
	void deletePic(String picName);
	
	void changeBrand(String brandId,String brandName);
	
	void guaHui(Integer price);
	
}
