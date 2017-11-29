package com.flf.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.base.entity.BaseEntity;

/**
 * 
 * <br>
 * <b>功能：</b>ShopUserEntity<br>
 */
public class ShopUser extends BaseEntity {

	private static final long serialVersionUID = -778302006598460809L;
	
	private java.lang.Integer id;//
	private java.lang.String name;// 用户名
	private java.lang.String account;// 账号
	private java.lang.String password;// 密码
	private java.lang.String email;// 邮箱
	private java.lang.String openid;// 第三方用户openid
	private java.lang.String headImg;// 头像地址
	private java.lang.Integer type;// 1 注册 2 QQ 3 微博
	private Date registerTime;// 注册时间
	private Date lastLoginTime;// 上次登录时间
	private java.lang.Integer status;// 0正常 1 删除

	private BigDecimal deposit; // 用户押金
	private Integer reductionDays;// reductionDays

	private String machineNumber;
	private String phoneModel;// 用户机型

	private String mobilePhone;// 手机号码
	private BigDecimal balance;

	private Integer userVip; // 会员等级

	private String user_idcard;// 用户身份号码
	private String user_bname;// 用户真实姓名
	private String user_creditnumber;// 用户卡号
	private Integer renzhen_status;// 认证状态（1是0否）
	private String mobile;// 银行预留的手机

	private String occupation;// 行业
	private String birthday;// 出生
	private String timeOver;

	private Page page;

	public java.lang.Integer getId() {
		return this.id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}

	public java.lang.String getAccount() {
		return this.account;
	}

	public void setAccount(java.lang.String account) {
		this.account = account;
	}

	public java.lang.String getPassword() {
		return this.password;
	}

	public void setPassword(java.lang.String password) {
		this.password = password;
	}

	public java.lang.String getEmail() {
		return this.email;
	}

	public void setEmail(java.lang.String email) {
		this.email = email;
	}

	public java.lang.String getOpenid() {
		return this.openid;
	}

	public void setOpenid(java.lang.String openid) {
		this.openid = openid;
	}

	public java.lang.String getHeadImg() {
		return this.headImg;
	}

	public void setHeadImg(java.lang.String headImg) {
		this.headImg = headImg;
	}

	public java.lang.Integer getType() {
		return this.type;
	}

	public void setType(java.lang.Integer type) {
		this.type = type;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public java.lang.Integer getStatus() {
		return this.status;
	}

	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}

	public BigDecimal getDeposit() {
		return deposit;
	}

	public void setDeposit(BigDecimal deposit) {
		this.deposit = deposit;
	}

	public Integer getReductionDays() {
		return reductionDays;
	}

	public void setReductionDays(Integer reductionDays) {
		this.reductionDays = reductionDays;
	}

	public String getMachineNumber() {
		return machineNumber;
	}

	public void setMachineNumber(String machineNumber) {
		this.machineNumber = machineNumber;
	}

	public String getPhoneModel() {
		return phoneModel;
	}

	public void setPhoneModel(String phoneModel) {
		this.phoneModel = phoneModel;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Integer getUserVip() {
		return userVip;
	}

	public void setUserVip(Integer userVip) {
		this.userVip = userVip;
	}

	public String getUser_idcard() {
		return user_idcard;
	}

	public void setUser_idcard(String user_idcard) {
		this.user_idcard = user_idcard;
	}

	public String getUser_bname() {
		return user_bname;
	}

	public void setUser_bname(String user_bname) {
		this.user_bname = user_bname;
	}

	public String getUser_creditnumber() {
		return user_creditnumber;
	}

	public void setUser_creditnumber(String user_creditnumber) {
		this.user_creditnumber = user_creditnumber;
	}

	public Integer getRenzhen_status() {
		return renzhen_status;
	}

	public void setRenzhen_status(Integer renzhen_status) {
		this.renzhen_status = renzhen_status;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTimeOver() {
		return timeOver;
	}

	public void setTimeOver(String timeOver) {
		this.timeOver = timeOver;
	}

}
