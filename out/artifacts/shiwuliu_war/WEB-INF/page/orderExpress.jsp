<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写物流公司信息</title>
<link href="../../style/css/public.css?v=20161223" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../style/js/jquery.min.js"></script>
<script type="text/javascript" src="../../style/js/global.js"></script>
</head>
<body style="background-color: #FFFFFF;">
<div class="mainBox">
	<h3>填写物流信息，更新订单状态为配送中</h3>
	<form name="editForm" id="editForm" method="post" >
		<input type="hidden" name="orderId" value="${orderMap.order_id}">
	<table class="tableBasic" style="width: 100%;  ">
		<tr>
			<td width="150px">快递公司：</td>
			<td><c:if test="${empty orderMap.express }">
						<input type="text" placeholder="快递公司"  name="express" id="express" value="${orderMap.express}">
					</c:if>
					<c:if test="${ not empty orderMap.express }">
						${orderMap.express}
					</c:if>
			</td>
		</tr>
		<%-- <tr>
			<td width="150px">快递公司编号：</td>
			<td><c:if test="${empty orderMap.express_num }">
						<input type="text" placeholder="快递公司编号"  name="expressNum" id="expressNum" value="${orderMap.express_num}">
					</c:if>
					<c:if test="${ not empty orderMap.express_num }">
						${orderMap.express_num}
					</c:if>
			</td>
		</tr> --%>
			<tr>
			<td width="150px">快递单号：</td>
			<td><c:if test="${empty orderMap.order_code }">
						<input type="text" placeholder="快递单号"  name="orderCode" id="orderCode" value="${orderMap.order_code}">
					</c:if>
					<c:if test="${ not empty orderMap.order_code }">
						${orderMap.order_code}
					</c:if>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><input id="btn_submit" class="btn" type="button" value="提交" /></td>
		</tr>
	</table>
	</form>	
</div>
 <!--  div style="text-align: center;margin-top: 10px;">  
        <select id="select" style="width:150px;height:21px;" onchange="a()">  
             <option value="1">爬楼高手</option>  
             <option value="2">隔壁老尤条</option>  
         </select>  
         <input id="_input" style="width:130px;height:15px;margin-left:-157px;"  type="text"  />  
</div--> 

<script type="text/javascript">
	$(function() {
		
		var express = $('#express').val();
		if(express == ''){
			$('#express').val('顺丰速运');
		}
		
		$('#btn_submit').click(function() {
			if ($('#invalid').is(':checked')) {
				$('#sort').val(0);
			}
			if (confirm('确定不是手抖吗？')) {
				var url = '/shopOrder/saveExpress.html';
				var express = $("#express").val();
				if (!express) {
					alert('你还输入快递公司呢');
					return false;
				}
				/* var expressNum = $("#expressNum").val();
				if (!expressNum) {
					alert('你还输入快递公司编号呢');
					return false;
				} */
				var orderCode = $("#orderCode").val();
				if (!orderCode) {
					alert('你还输入快递单号呢');
					return false;
				}
				$.post(url, $('#editForm').serialize(), function(data) {
					if (data.msg == '成功') {
						alert('搞定啦！');
						window.location.href = '/shopOrder/list.html';
					} else {
						alert(data.msg);
					}
				});
			}
		});
	});
	
	// 选中左侧相应的菜单
	activeMenu('订单查询');
</script>
</body>
</html>
