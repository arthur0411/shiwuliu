<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>专题管理</title>
	<jsp:include page="common/public_js_css.jsp" flush="true"/>
</head>
<body style="background-color: #FFFFFF;">
<div class="mainBox">
	<h3>
		<a href="/shopSpecialTopic/add.html" class="actionBtn add">添加专题</a><br/>
		<!--  <a href="/shopSpecialTopic/pic.html" class="actionBtn add">添加活动</a>-->
		专题管理
	</h3>
	<!-- 此form用于分页 -->
	<form action="/shopSpecialTopic/list.html" method="post" name="searchForm">
	</form>
	<div id="list">
		<form name="deleteForm" id="deleteForm">
			<table style="width: 100%;" class="tableBasic list">
				<tr>
					<th>ID</th>
					<th>专题分类</th>
					<th>专题名</th>
					<th>banner图片</th>
					<th>内容图片</th>
					<th>排序</th>
					<th>是否启用</th>
					<th>操作</th>
				</tr>
				<c:choose>
					<c:when test="${not empty specialTopicList}">
						<c:forEach items="${specialTopicList}" var="list" varStatus="vs">
							<tr class="main_info">
								<td>${list.id }</td>
								<td>
									<c:choose>
										<c:when test="${list.type == 1 }">
											<span>饰品搭配专题</span>
										</c:when>
										<c:when test="${list.type == 2 }">
											<span>饰五六推荐品牌</span>
										</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</td>
								<td>${list.name }</td>
								<td>
									<a href="${list.banner }" target="_blank">点击查看图片</a>
								</td>
								<td>
									<a href="${list.img1 }" target="_blank">点击查看图片</a>
								</td>
								<td>${list.sort }</td>
								<td>
									<c:choose>
										<c:when test="${list.invalid == 1 }">
											<span>弃用</span>
										</c:when>
										<c:when test="${list.invalid == 0 }">
											<span class="text_green">启用</span>
										</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</td>
								<td>
									<a href="/shopSpecialTopic/edit.html?id=${list.id }">修改</a>&nbsp;|&nbsp;
									<a href="javascript:delShopSpecial(${list.id });">删除</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="8">暂无数据o(&gt;﹏&lt;)o</td>
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
	$(function () {
		// 选中左侧相应的菜单
		activeMenu('专题管理');
	});
	
	function delShopSpecial(vid){
		if(confirm("确定要删除该记录？")){
			var url = "/shopSpecialTopic/delete.html?id="+vid;
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
