<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户详情</title>
<jsp:include page="common/public_js_css.jsp" flush="true"/>
<script type="text/javascript" src="../../style/js/echo-area-and-type.js"></script>
<script type="text/javascript" src="../../style/plugins/datePicker/WdatePicker.js"></script>
</head>
<body style="background-color: #FFFFFF;">
	<div class="mainBox">
		<h3>
			<%-- <a href="/shopTradingHistory/list.html?userId=${userManager.id }&remark3=${userManager.name}" 
				class="actionBtn" style="margin-left: 7px;">交易记录</a> --%>
			客户详情
		</h3>
		<div class="filter" style="height: 250px;">
			<table class="tableBasic" style="width: 100%;  ">
				<tr>
					<th align="center">用户ID</th>
					<td>${userManager.id}</td>
					<th align="center">用户vip等级</th>
					<td>
						${userManager.vipName}
					</td>
					<th align="center">用户名称</th>
					<td>${userManager.name}</td>
					<th align="center">手机号码</th>
					<td>${userManager.mobilePhone }</td>
				</tr>
				<tr>
					<th align="center">邮箱</th>
					<td>${userManager.email }</td>
					<th align="center">第三方用户openid</th>
					<td>${userManager.openid }</td>
					<th align="center">用户类型</th>
					<td>
						<c:if test="${userManager.type=='1'}">注册</c:if>
						<c:if test="${userManager.type=='2'}">QQ</c:if>
						<c:if test="${userManager.type=='3'}">微博</c:if>
					</td>
					<th align="center">注册时间</th>
					<td><fmt:formatDate value="${userManager.register_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<th align="center">上次登录时间</th>
					<td><fmt:formatDate value="${userManager.last_login_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<th align="center">状态</th>
					<td><c:if test="${userManager.status eq '1'}">删除</c:if>
						<c:if test="${userManager.status eq '0'}">正常</c:if></td>
					<th align="center">用户押金</th>
					<td>${userManager.deposit }</td>
					<th align="center">免费期限</th>
					<td>${userManager.reductionDays }（天）</td>
				</tr>
				<tr>
					<th align="center">用户余额</th>
					<td>${userManager.balance  }</td>
					<th align="center">用户机型</th>
					<td>${userManager.phoneModel }</td>
					<th align="center">用户行业</th>
					<td>${userManager.occupation }</td>
					<th align="center">出生日期</th>
					<td>${userManager.birthday }</td>
				</tr>
			</table>
		</div>

		<div class="filter" style="width: 100%; float: left;">
			<table class="tableBasic" style="width: 48%; float: left;">
					<tr>
						<th>收货人</th>
						<th>联系电话</th>
						<th>收货地址</th>
						<th>是否默认</th>
					</tr>
					<c:choose>
						<c:when test="${not empty shopAddressList}">
							<c:forEach items="${shopAddressList}" var="list" varStatus="vs">
								<tr class="main_info">
									<td>${list.name }</td>
									<td>${list.phone }</td>
									<td>${list.address }</td>
									<td>
										<c:if test="${list.is_default == '1'}">否</c:if>
										<c:if test="${list.is_default == '0'}">是</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="5">暂无数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
			</table>
		</div>
	</div>
</body>
</html>
