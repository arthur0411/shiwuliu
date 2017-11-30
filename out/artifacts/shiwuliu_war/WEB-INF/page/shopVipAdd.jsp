<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加会员等级</title>
<link href="../../style/css/public.css?v=20161223" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../style/js/jquery.min.js"></script>
<script type="text/javascript" src="../../style/js/global.js"></script>
</head>
<body style="background-color: #FFFFFF;">
<div class="mainBox">
	<h3>
		<a href="list.html" class="actionBtn">会员等级</a>
		<c:if test="${empty shopVip.vipId }">
		添加配置
		</c:if>
		<c:if test="${not empty shopVip.vipId }">
		修改配置
		</c:if>
	</h3>
	
	<form name="editForm" id="editForm" method="post" >
	<c:if test="${not empty shopVip.vipId }">
	<input type="hidden" name="vipId" value="${shopVip.vipId }" />
	</c:if>
	<table class="tableBasic" style="width: 100%;  ">
		<tr>
			<td width="150px">会员类型：</td>
			<td><input type="text" name="vipName" id="vip_name" class="inpMain" value="${shopVip.vipName }"/></td>
		</tr>
		<tr>
			<td>会员时限:</td>
			<td>
				<input type="text" name="vipPrice" id="vip_price" class="inpMain" value="${shopVip.vipPrice }"/>
			</td>
		</tr>
		<tr>
			<td>可选商品数量:</td>
			<td>
				<input type="text" name="number" id="number" class="inpMain" value="${shopVip.number }"/>
			</td>
		</tr>
		<tr>
			<td>可选商品价格:</td>
			<td>
				<input type="text" name="commodityPrice" id="commodityPrice" class="inpMain" value="${shopVip.commodityPrice }"/>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><input id="btn_submit" class="btn" type="button" value="提交" /></td>
		</tr>
	</table>
	</form>	
</div>
<script type="text/javascript">
$(function(){
	$('#btn_submit').click(function(){
		var url = 'save.html';
		$.post(url, $('#editForm').serialize(), function(data){
			if (data == 'success') {
				window.location.href = document.referrer;
			} else {
				alert('未知异常，可能该会员类型已存在');
				$('#vip_name').focus();
			}
		});
	});
});

// 选中左侧相应的菜单
activeMenu('添加会员等级');
</script>
</body>
</html>