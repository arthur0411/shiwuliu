<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员等级管理</title>
<link href="../../style/css/public.css?v=20161223" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../style/js/jquery.min.js"></script>
<script type="text/javascript" src="../../style/js/global.js"></script>
</head>
<body style="background-color: #FFFFFF;">
	<div class="mainBox">
		<h3>
			会员等级管理
			<a href="/shopVip/toAdd.html" class="actionBtn add">添加会员等级</a>
		</h3>
		<div id="list">
			<form name="deleteForm" id="deleteForm">
				<table style="width: 100%;" class="tableBasic list">
					<tr>
						<th>ID</th>
						<th>会员类型</th>
						<th>会员时限</th>
						<th>创建时间</th>
						<th>商品可选数量</th>
						<th>商品可选价格</th>
						<th>操作</th>
					</tr>
					<c:choose>
						<c:when test="${not empty shopVipList}">
							<c:forEach items="${shopVipList}" var="list" varStatus="vs">
								<tr class="main_info">
									<td>${list.vipId }</td>
									<td>${list.vipName }</td>
									<td>${list.vipPrice }</td>
									<td>${list.createTime }</td>
									<td>${list.number }</td>
									<td>${list.commodityPrice }</td>
									<td>
										<a href="/shopVip/edit.html?id=${list.vipId }">编辑</a>&nbsp;|&nbsp;
										<a href="javascript:delShopVip(${list.vipId });">删除</a>
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
			</form>
		</div>
		<div class="clear"></div>
		<div class="page_and_btn">${vo.page.pageStr }</div>
	</div>

	<script type="text/javascript">
		$(function() {
			// 选中左侧相应的菜单
			activeMenu('会员等级管理');
		});
		
		function delShopVip(vid){
			if(confirm("确定要删除该记录？")){
				var url = "delete.html?id="+vid;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}
		}
		
	</script>
</body>
</html>
