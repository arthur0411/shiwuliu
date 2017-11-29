package com.flf.entity;

import java.math.BigDecimal;
import java.util.List;

import com.base.entity.BaseEntity;

/**
 * 
 * <br>
 * <b>功能：</b>ShopCommodityEntity<br>
 */
public class ShopCommodity extends BaseEntity {

	private java.lang.Integer commodityId;//
	private java.lang.String commodityName;// 商品名称
	private java.lang.String commodityPrice;// 商品价格
	private java.lang.String actualPrice;// 划线价格

	private java.lang.String commodityDescribe;// 商品描述
	private java.lang.Integer commodityTagId;// 商品分类ID
	private java.lang.Object commodityStatus;// 商品状态（1上架，0下架）
	private java.lang.Object isUpjia;// (yes 是）是否下架
	private java.lang.String createTime;// 添加时间
	private java.lang.String downTime;// 修改时间
	private java.lang.String deleterTime;// 删除时间
	private java.lang.Object isRecommend;// 是否推荐
	private java.lang.Integer sortId;// 佩戴所需会员等级
	private java.lang.Object isPresale;// 是否预售
	private java.lang.String commodityParameter;// 商品参数
	private java.lang.String saleStock;// 售卖库存
	private java.lang.String rentStock;// 租赁库存
	private java.lang.Integer commodityHot;// 商品销量
	private java.lang.String icon;// 商品封面图

	private List<String> imglist; // 图片分割
	private List<String> describeList; // 描述分割

	private Integer brandTopic;// 是否品牌专栏（1是0否）
	private java.lang.String brand;// 品牌
	private java.lang.String material;// 材质
	private BigDecimal goldenRent;// 黄金会员租金
	private BigDecimal platinumRent;// 铂金会员租金
	private BigDecimal masonryRent;// 砖石会员租金

	private java.lang.String commoditySize; //尺寸
	private java.lang.String dealWay;// 交易方式1，可售不可租 2可售可租
	private java.lang.String producer; // 产地

	private Page page;
	private java.lang.String commodityImg;// 商品图片1
	private java.lang.String commodityImg2;// 商品图片2
	private java.lang.String commodityImg3;// 商品图片3
	private java.lang.String commodityImg4;// 商品图片4
	private java.lang.String commodityImg5;// 商品图片5
	private java.lang.String commodityImg6;// 商品图片6
	private java.lang.String commodityImg7;// 商品图片7
	private java.lang.String commodityImg8;// 商品图片8
	private java.lang.String commodityImg10;
	
	private java.lang.String brandId;// 品牌
	
	public java.lang.String getCommodityImg7() {
		return commodityImg7;
	}

	public void setCommodityImg7(java.lang.String commodityImg7) {
		this.commodityImg7 = commodityImg7;
	}

	public java.lang.String getCommodityImg8() {
		return commodityImg8;
	}

	public void setCommodityImg8(java.lang.String commodityImg8) {
		this.commodityImg8 = commodityImg8;
	}

	public java.lang.String getCommodityImg9() {
		return commodityImg9;
	}

	public void setCommodityImg9(java.lang.String commodityImg9) {
		this.commodityImg9 = commodityImg9;
	}

	private java.lang.String commodityImg9;// 商品图片9
	
	public java.lang.String getActualPrice() {
		return actualPrice;
	}

	public void setActualPrice(java.lang.String actualPrice) {
		this.actualPrice = actualPrice;
	}

	public java.lang.String getCommoditySize() {
		return commoditySize;
	}

	public void setCommoditySize(java.lang.String commoditySize) {
		this.commoditySize = commoditySize;
	}

	public java.lang.String getCommodityImg5() {
		return commodityImg5;
	}

	public void setCommodityImg5(java.lang.String commodityImg5) {
		this.commodityImg5 = commodityImg5;
	}

	public java.lang.String getCommodityImg6() {
		return commodityImg6;
	}

	public void setCommodityImg6(java.lang.String commodityImg6) {
		this.commodityImg6 = commodityImg6;
	}

	private String buyingNickname;// 买手昵称

	private String bigImg;// 大图

	private String tagName;// 分类名称

	public java.lang.Integer getCommodityId() {
		return this.commodityId;
	}

	public void setCommodityId(java.lang.Integer commodityId) {
		this.commodityId = commodityId;
	}

	public java.lang.String getCommodityName() {
		return this.commodityName;
	}

	public void setCommodityName(java.lang.String commodityName) {
		this.commodityName = commodityName;
	}

	public java.lang.String getCommodityPrice() {
		return this.commodityPrice;
	}

	public void setCommodityPrice(java.lang.String commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	public java.lang.String getCommodityImg() {
		return this.commodityImg;
	}

	public void setCommodityImg(java.lang.String commodityImg) {
		this.commodityImg = commodityImg;
	}

	public java.lang.String getCommodityDescribe() {
		return this.commodityDescribe;
	}

	public void setCommodityDescribe(java.lang.String commodityDescribe) {
		this.commodityDescribe = commodityDescribe;
	}

	public java.lang.Integer getCommodityTagId() {
		return this.commodityTagId;
	}

	public void setCommodityTagId(java.lang.Integer commodityTagId) {
		this.commodityTagId = commodityTagId;
	}

	public java.lang.Object getCommodityStatus() {
		return this.commodityStatus;
	}

	public void setCommodityStatus(java.lang.Object commodityStatus) {
		this.commodityStatus = commodityStatus;
	}

	public java.lang.Object getIsUpjia() {
		return this.isUpjia;
	}

	public void setIsUpjia(java.lang.Object isUpjia) {
		this.isUpjia = isUpjia;
	}

	public java.lang.String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(java.lang.String createTime) {
		this.createTime = createTime;
	}

	public java.lang.String getDownTime() {
		return this.downTime;
	}

	public void setDownTime(java.lang.String downTime) {
		this.downTime = downTime;
	}

	public java.lang.String getDeleterTime() {
		return this.deleterTime;
	}

	public void setDeleterTime(java.lang.String deleterTime) {
		this.deleterTime = deleterTime;
	}

	public java.lang.Object getIsRecommend() {
		return this.isRecommend;
	}

	public void setIsRecommend(java.lang.Object isRecommend) {
		this.isRecommend = isRecommend;
	}

	/*public java.lang.Object getIsDeleter() {
		return this.isDeleter;
	}

	public void setIsDeleter(java.lang.Object isDeleter) {
		this.isDeleter = isDeleter;
	}*/

	public java.lang.String getCommodityParameter() {
		return this.commodityParameter;
	}

	public void setCommodityParameter(java.lang.String commodityParameter) {
		this.commodityParameter = commodityParameter;
	}

	public java.lang.String getSaleStock() {
		return this.saleStock;
	}

	public void setSaleStock(java.lang.String saleStock) {
		this.saleStock = saleStock;
	}

	public java.lang.Integer getCommodityHot() {
		return this.commodityHot;
	}

	public void setCommodityHot(java.lang.Integer commodityHot) {
		this.commodityHot = commodityHot;
	}

	public java.lang.String getIcon() {
		return this.icon;
	}

	public void setIcon(java.lang.String icon) {
		this.icon = icon;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<String> getImglist() {
		return imglist;
	}

	public void setImglist(List<String> imglist) {
		this.imglist = imglist;
	}

	public List<String> getDescribeList() {
		return describeList;
	}

	public void setDescribeList(List<String> describeList) {
		this.describeList = describeList;
	}

	public Integer getBrandTopic() {
		return brandTopic;
	}

	public void setBrandTopic(Integer brandTopic) {
		this.brandTopic = brandTopic;
	}

	public java.lang.String getBrand() {
		return brand;
	}

	public void setBrand(java.lang.String brand) {
		this.brand = brand;
	}

	public java.lang.String getMaterial() {
		return material;
	}

	public void setMaterial(java.lang.String material) {
		this.material = material;
	}

	public BigDecimal getGoldenRent() {
		return goldenRent;
	}

	public void setGoldenRent(BigDecimal goldenRent) {
		this.goldenRent = goldenRent;
	}

	public BigDecimal getPlatinumRent() {
		return platinumRent;
	}

	public void setPlatinumRent(BigDecimal platinumRent) {
		this.platinumRent = platinumRent;
	}

	public BigDecimal getMasonryRent() {
		return masonryRent;
	}

	public void setMasonryRent(BigDecimal masonryRent) {
		this.masonryRent = masonryRent;
	}


	public java.lang.String getProducer() {
		return producer;
	}

	public void setProducer(java.lang.String producer) {
		this.producer = producer;
	}

	public java.lang.String getCommodityImg2() {
		return commodityImg2;
	}

	public void setCommodityImg2(java.lang.String commodityImg2) {
		this.commodityImg2 = commodityImg2;
	}

	public java.lang.String getCommodityImg3() {
		return commodityImg3;
	}

	public void setCommodityImg3(java.lang.String commodityImg3) {
		this.commodityImg3 = commodityImg3;
	}

	public java.lang.String getCommodityImg4() {
		return commodityImg4;
	}

	public void setCommodityImg4(java.lang.String commodityImg4) {
		this.commodityImg4 = commodityImg4;
	}

	public String getBuyingNickname() {
		return buyingNickname;
	}

	public void setBuyingNickname(String buyingNickname) {
		this.buyingNickname = buyingNickname;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getBigImg() {
		return bigImg;
	}

	public void setBigImg(String bigImg) {
		this.bigImg = bigImg;
	}

	public java.lang.String getDealWay() {
		return dealWay;
	}

	public void setDealWay(java.lang.String dealWay) {
		this.dealWay = dealWay;
	}

	public java.lang.Object getIsPresale() {
		return isPresale;
	}

	public void setIsPresale(java.lang.Object isPresale) {
		this.isPresale = isPresale;
	}

	public java.lang.String getRentStock() {
		return rentStock;
	}

	public void setRentStock(java.lang.String rentStock) {
		this.rentStock = rentStock;
	}

	public java.lang.String getCommodityImg10() {
		return commodityImg10;
	}

	public void setCommodityImg10(java.lang.String commodityImg10) {
		this.commodityImg10 = commodityImg10;
	}

	public java.lang.String getBrandId() {
		return brandId;
	}

	public void setBrandId(java.lang.String brandId) {
		this.brandId = brandId;
	}

	public java.lang.Integer getSortId() {
		return sortId;
	}

	public void setSortId(java.lang.Integer sortId) {
		this.sortId = sortId;
	}

}
