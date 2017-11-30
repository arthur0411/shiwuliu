<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
<jsp:include page="common/public_js_css.jsp" flush="true"/>
</head>
<body style="background-color: #FFFFFF;">
	<div class="mainBox">
		<h3>订单详情</h3>
				<form method="post" name="editForm" id="editForm">
				<input type="hidden" name="orderId" value="${orderMap.orderId}">
		<table class="tableBasic" style="margin-bottom: 15px;">
			<tr>
				<th>订单号:</th>
				<td>${orderMap.order_nummmm}</td>
				<th>订单类型:</th>
				<td>
					<c:if test="${orderMap.order_class=='1'}">租用 </c:if>
					<c:if test="${orderMap.order_class=='2'}">售卖 </c:if>
				</td>
				<th>用户名:</th>
				<td>${orderMap.username}</td>
				<th>下单时间:</th>
				<td>${orderMap.create_time}</td>
				<th>订单状态:</th>
				<td>
					<c:if test="${orderMap.order_status=='0'}">未支付 </c:if>
					<c:if test="${orderMap.order_status=='1'}">确认中 </c:if>
										<c:if test="${orderMap.order_status=='2'}">配送中 </c:if>
										<c:if test="${orderMap.order_status=='3'}">佩戴中 </c:if>
										<c:if test="${orderMap.order_status=='4'}">返还中 </c:if>
										<c:if test="${orderMap.order_status=='5'}">验收中 </c:if>
										<c:if test="${orderMap.order_status=='6'}">违规处理 </c:if>
										<c:if test="${orderMap.order_status=='7'}">验收完成 </c:if>
										<c:if test="${orderMap.order_status=='8'}">已取消</c:if>
				</td>
				
			</tr>
			<tr>
				<%-- <th>快递公司编号:</th>
				<td >${orderMap.express_num}</td> --%>
				<th>快递公司:</th>
				<td>
					${orderMap.express}
					<%-- <c:if test="${empty orderMap.express }">
						<input type="text" name="express" id="express" value="${orderMap.express}">
					</c:if>
					<c:if test="${ not empty orderMap.express }">
						${orderMap.express}
					</c:if> --%>
				</td>
				<th>快递单号:</th>
				<td>${orderMap.order_code}</td>
				<th>收货人:</th>
				<td>${orderMap.name}</td>
				<th>收货人联系电话:</th>
				<td>${orderMap.phone}</td>
				<th>收货人地址:</th>
				<td>${orderMap.address}</td>
				
			</tr>
			<tr>
				<th>订单商品数量:</th>
				<td>${orderMap.commodity_num}</td>
				<th>商品总价:</th>
				<td>￥${orderMap.totalMoney}</td>
				<th>佩戴天数:</th>
				<td>${orderMap.wearingDays}</td>
				<th>配送时间:</th>
				<td>${orderMap.delivery_time}</td>
				<th>订单取消时间:</th>
				<td>${orderMap.cancelTime}</td>
				<%-- <th>实付价格:</th>
				<td>￥${orderMap.actualPayment}</td>
				<th>优惠金额:</th>
				<td>￥${orderMap.postFee}</td>
				<th>订单支付方式:</th>
				<td>	<c:choose>
									       <c:when test="${orderMap.paymentWay=='1'}">
									             微信
									       </c:when>
									       <c:when test="${orderMap.paymentWay=='2'}">
									              支付宝
									       </c:when>
									       <c:otherwise>
									              其他
									       </c:otherwise>				</c:choose></td> --%>
			</tr>
			<%-- <tr>
				<th>支付时间:</th>
				<td>${orderMap.paymentTime}</td>
				<th>订单取消时间:</th>
				<td>${orderMap.cancelTime}</td>
				<th>配送时间:</th>
				<td>${orderMap.delivery_time}</td>
				<th>佩戴天数:</th>
				<td>${orderMap.wearingDays}</td>
				<th>运费:</th>
				<td>${orderMap.postFee}</td>
			
			</tr> --%>
			
			<tr>
				<th>返还快递:</th>
				<td>${orderMap.returnExpress}</td>
				<th>返还单号:</th>
				<td>${orderMap.returnExpressCode}</td>
				<th>归还时间:</th>
				<td>${orderMap.return_time}</td>
				<%-- <th>手机号:</th>
				<td>${orderMap.mobilePhone}</td> --%>
				<!-- 	<td style="width: 150px;"></td>
					<td>
						<input id="btn_submit" class="btn" type="button" value="保存物流信息" />
					</td> -->
				</tr>
		</table>
		 </form>
		
		<div id="list">
			<form name="deleteForm" id="deleteForm">
				<table class="tableBasic list">
					<tr>
						<th colspan="8">商品列表</th>
					</tr>
					<tr>
						<th>序号</th>
						<th>商品ID</th>
						<th>商品封面图	</th>
						<th>分类</th>
						<th>商品名称</th>
						<th>商品数量</th>
						<th>商品实收金额</th>
					</tr>
					<c:choose>
						<c:when test="${not empty detailsList}">
							<c:forEach items="${detailsList}" var="order" varStatus="vs">
								<tr class="main_info">
									<td>${vs.index+1}</td>
									<td>${order.commodity_id}</td>
									<td><img width="50px;" height="50px;" src="${order.icon }"></td>
									<td>${order.tag_name}</td>
									<td>${order.commodityName}</td>
									<td>${order.commodity_onenum}</td>
									<td>￥${order.actualPayment}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="6">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</form>
		</div>
		<div class="clear"></div>
		<div class="page_and_btn"></div>

		
	</div>

	<script type="text/javascript">
	
	$(function() {
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
				var expressNum = $("#expressNum").val();
				if (!expressNum) {
					alert('你还输入快递公司编号呢');
					return false;
				}
				var orderCode = $("#orderCode").val();
				if (!orderCode) {
					alert('你还输入快递单号呢');
					return false;
				}
				$.post(url, $('#editForm').serialize(), function(data) {
					if (data == 'success') {
						alert('搞定啦！');
						//window.location.href = '/shopOrder/list.html';
						self.location=document.referrer;
					} else {
						alert(UNKNOWN_ERROR);
					}
				});
			}
		});
	});
	</script>
</body>
</html>
