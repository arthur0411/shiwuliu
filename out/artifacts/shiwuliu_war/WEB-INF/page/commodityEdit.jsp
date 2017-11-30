<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑商品</title>
<jsp:include page="common/public_js_css.jsp" flush="true"/>
<script type="text/javascript" src="../../style/js/echo-area-and-type.js"></script>
<script type="text/javascript" src="../../style/plugins/datePicker/WdatePicker.js"></script>
<style type="text/css">
input[type="file"] {
	opacity: 0;
	filter: alpha(opacity = 0);
	width: 0px;
	height: 0px;
}

#smallPicImg {
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}

#imagePathImg {
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#smallPicImg1 {
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}

#imagePathImg1 {
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imagePathImg2{
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imagePathImg3{
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imagePathImg4{
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imagePathImg5{
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imagePathImg6{
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imagePathImg7{
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imageConPathImg {
	width: 100px;
	height: 100px;
	cursor: pointer;
	border: 1px dotted gray;
}
#imagebigImgConPathImg {
	width: 150px;
	height: 154px;
	cursor: pointer;
	border: 1px dotted gray;
}

</style>
</head>
<body style="background-color: #FFFFFF;">
	<div class="mainBox">
		<h3>
		<a href="/commodity/list.html" class="actionBtn">商品运营</a>
		<c:if test="${not empty vo.commodityId }">
		修改商品
		</c:if>
		</h3>
		<form method="post" name="editForm" id="editForm" method="">
			<c:if test="${not empty vo.commodityId }">
				<input type="hidden" name="commodityId" value="${vo.commodityId }" />
			</c:if>
			<input type="hidden" name="memberLever" value="2" />
			
			<table class="tableBasic" style="width: 100%;  ">
				<tr>
					<td>商品名称：</td>
					<td>
						<input class="inpMain required" id="commodityName"  name="commodityName" value="${vo.commodityName }" />
					</td>
				</tr>
				
				<tr>
					<td><label>商品分类</label>：</td>
					<td>
						<select name="commodityTagId" id="commodityTagId" style="margin-right: 15px;">
							<option value="0">请选择</option>
							<c:forEach items="${commodityTagList}" var="list">
								<option value="${list.tagId }" <c:if test="${vo.commodityTagId==list.tagId}">selected</c:if>>${list.tagName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label>商品轮播图片1</label>：</td>
					<td>
						<div style="float: left; width: 150px;">
							<c:set var="smallImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg }">
								<c:set var="smallImageUrl" value="${vo.commodityImg }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="smallPicImg" src="${vo.commodityImg }"
								onclick="getElementById('smallPicFile').click()">
							<input class="inpFlie" type="file" id="smallPicFile" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg" name="commodityImg" value="${vo.commodityImg }" />
						</div>
					
						
					</td>
				</tr>
				
					<tr>
					<td><label>商品轮播图片2</label>：</td>
					<td>
							<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg2 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg2 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg" src="${vo.commodityImg2 }"
								onclick="getElementById('imagePathFile').click()">
							<input class="inpFlie" type="file" id="imagePathFile" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg2" name="commodityImg2" value="${vo.commodityImg2 }" />
						</div>
						
					</td>
				</tr>
				
					<tr>
					<td><label>商品轮播图片3</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg3 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg3 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="smallPicImg1" src="${vo.commodityImg3 }"
								onclick="getElementById('smallPicFile1').click()">
							<input class="inpFlie" type="file" id="smallPicFile1" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg3" name="commodityImg3" value="${vo.commodityImg3}" />
						</div>
						
					</td>
				</tr>
				
				<tr>
					<td><label>商品轮播图片4</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg4 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg4 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg1" src="${vo.commodityImg4 }"
								onclick="getElementById('imagePathFile1').click()">
							<input class="inpFlie" type="file" id="imagePathFile1" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg4" name="commodityImg4" value="${vo.commodityImg4 }" />
						</div>
						
					</td>
				</tr>
			
				<tr>
					<td><label>商品轮播图片5</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg5 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg5 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg2" src="${vo.commodityImg5 }"
								onclick="getElementById('imagePathFile2').click()">
							<input class="inpFlie" type="file" id="imagePathFile2" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg5" name="commodityImg5" value="${vo.commodityImg5 }" />
						</div>
						
					</td>
				</tr>
				
				<tr>
					<td><label>商品轮播图片6</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg6 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg6 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg3" src="${vo.commodityImg6 }"
								onclick="getElementById('imagePathFile3').click()">
							<input class="inpFlie" type="file" id="imagePathFile3" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg6" name="commodityImg6" value="${vo.commodityImg6 }" />
						</div>
						
					</td>
				</tr>
			
				<tr>
					<td><label>商品轮播图片7</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg7 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg7 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg4" src="${vo.commodityImg7 }"
								onclick="getElementById('imagePathFile4').click()">
							<input class="inpFlie" type="file" id="imagePathFile4" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg7" name="commodityImg7" value="${vo.commodityImg7 }" />
						</div>
						
					</td>
				</tr>
				
				<tr>
					<td><label>商品轮播图片8</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg8 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg8 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg5" src="${vo.commodityImg8 }"
								onclick="getElementById('imagePathFile5').click()">
							<input class="inpFlie" type="file" id="imagePathFile5" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg8" name="commodityImg8" value="${vo.commodityImg8 }" />
						</div>
						
					</td>
				</tr>
				
				<tr>
					<td><label>商品轮播图片9</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg9 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg9 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg6" src="${vo.commodityImg9 }"
								onclick="getElementById('imagePathFile6').click()">
							<input class="inpFlie" type="file" id="imagePathFile6" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg9" name="commodityImg9" value="${vo.commodityImg9 }" />
						</div>
						
					</td>
				</tr>
				
				<tr>
					<td><label>商品轮播图片10</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.commodityImg10 }">
								<c:set var="bigImageUrl" value="${vo.commodityImg10 }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagePathImg7" src="${vo.commodityImg10 }"
								onclick="getElementById('imagePathFile7').click()">
							<input class="inpFlie" type="file" id="imagePathFile7" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="commodityImg10" name="commodityImg10" value="${vo.commodityImg10 }" />
						</div>
						
					</td>
				</tr>
				
				<tr>
					<td><label>商品封面图片</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.icon }">
								<c:set var="bigImageUrl" value="${vo.icon }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imageConPathImg" src="${vo.icon  }"
								onclick="getElementById('imageConPathFile').click()">
							<input class="inpFlie" type="file" id="imageConPathFile" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="icon" name="icon" value="${vo.icon }" />
						</div>
						
					</td>
				</tr>
				
				<tr>
					<td><label>商品大图</label>：</td>
					<td>
						<div style="float: left;">
							<c:set var="bigImageUrl" value="#"></c:set>
							<c:if test="${not empty vo.bigImg }">
								<c:set var="bigImageUrl" value="${vo.bigImg }"></c:set>
							</c:if>
							<img alt="选择文件" title="选择文件" id="imagebigImgConPathImg" src="${vo.bigImg  }"
								onclick="getElementById('imagebigImgConPathFile').click()">
							<input class="inpFlie" type="file" id="imagebigImgConPathFile" accept=".jpg,.jpeg,.gif,.png" />
							<input type="hidden" id="bigImg" name="bigImg" value="${vo.bigImg }" />
						</div>
						
					</td>
				</tr>
				
				 <tr>
					<td><label>商品价格</label>：</td>
					<td>
						<input class="inpMain required" type="text" name="commodityPrice" value="${vo.commodityPrice }" />
					</td>
				</tr>
				
				<tr>
					<td><label>划线价格</label>：</td>
					<td>
						<input class="inpMain required" type="text" name="actualPrice" value="${vo.actualPrice }" />
					</td>
				</tr>
				
				<tr>
					<td><label>是否预售</label>：</td>
					<td>
						<select class="required" name="isPresale" id="isPresale">
							<option value="no" <c:if test="${vo.isPresale=='no'}">selected</c:if>>否</option>
							<option value="yes" <c:if test="${vo.isPresale=='yes'}">selected</c:if>>是</option>
							
						</select>
					</td>
				</tr>
				<tr>
					<td><label>是否上架</label>：</td>
					<td>
						<select class="required" name="isUpjia" id="isUpjia">
							<option value="yes" <c:if test="${vo.isUpjia=='yes'}">selected</c:if>>是</option>
							<option value="no" <c:if test="${vo.isUpjia=='no'}">selected</c:if>>否</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label>是否推荐</label>：</td>
					<td>
						<select class="required" name="isRecommend" id="isRecommend">
							<option value="yes" <c:if test="${vo.isRecommend=='yes'}">selected</c:if>>是</option>
							<option value="no" <c:if test="${vo.isRecommend=='no'}">selected</c:if>>否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>库存</label>：</td>
					<td>
						<input class="inpMain required" name="saleStock" id="saleStock" value="${vo.saleStock }" />
					</td>
				</tr>
				<!--<tr>
					<td><label>库存</label>：</td>
					<td>
						<input class="inpMain required" name="rentStock" id="rentStock" value="${vo.rentStock }" />
					</td>
				</tr> -->
				
				<tr>
					<td><label>是否单品推荐</label>：</td>
					<td>
						<select class="required" name="brandTopic" id="brandTopic">
							<option value="1" <c:if test="${vo.brandTopic=='1'}">selected</c:if>>是</option>
							<option value="0" <c:if test="${vo.brandTopic=='0'}">selected</c:if>>否</option>
						</select>
					</td>
				</tr>
				
				
				<tr>
					<td><label>品牌</label>：</td>
					<td>
						<select class="required" name="brandId" id="brandId">
							<option value="">请选择</option>
						</select>
						<a href="addBrand.html">没有该品牌？去添加</a>
					</td>
				</tr>
				<tr>
					<td><label>材质</label>：</td>
					<td>
						<input class="inpMain required" name="material" value="${vo.material }" />
					</td>
				</tr>
				
				
				
				<tr>
					<td><label>可交易方式</label>：</td>
					<td>
						<select class="required" name="dealWay" id="dealWay">
							<option value="2" <c:if test="${vo.dealWay=='2'}">selected</c:if>>可租可售</option>
							<option value="1" <c:if test="${vo.dealWay=='1'}">selected</c:if>>只可售</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>产地</label>：</td>
					<td>
						<input class="inpMain required" name="producer" value="${vo.producer }" />
					</td>
				</tr>
				
				<tr>
					<td><label>尺寸</label>：</td>
					<td>
						<input class="inpMain required" id="commoditySize" name="commoditySize" value="${vo.commoditySize }" />
					</td>
				</tr>
				
				<tr>
					<td><label>描述</label>：</td>
					<td>
						<input class="inpMain required" name="commodityDescribe" value="${vo.commodityDescribe }" />
					</td>
				</tr>
			
				<tr>
					<td><label>买手昵称</label>：</td>
					<td>
						<input class="inpMain required" name="buyingNickname" id="buyingNickname" value="${vo.buyingNickname }" />
					</td>
				</tr>
			
				<tr>
					<td></td>
					<td>
						<input id="btn_submit" class="btn" type="button" value="提交" />
					</td>
				</tr>
			</table>
		</form>
	</div>
			

</body>


<script type="text/javascript">


	$(function() {
	
	
		
		//var csize = $('#commoditySize').val();
		var cbuyingName = $('#buyingNickname').val();
		var saleStock = $('#saleStock').val();
		//var rentStock = $('#rentStock').val();
		//if(csize == ''){
		//	$('#commoditySize').val('均码');
		//}
		if(cbuyingName == ''){
			$('#buyingNickname').val('饰五六');
		}
		if(saleStock == ''){
			$('#saleStock').val('1');
		}
		//if(rentStock == ''){
		//	$('#buyingNickname').val('1');
		//}



		$.post("listBrand.html",
			  function(data){
   		 			for(var i=0;i<data.length;i++){
   		 				$("#brandId").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
   		 			}
 			 }
 			 );
	
		
		$('#btn_submit').click(function() {
				if (confirm('确定不是手抖吗？')) {
				
					var commodityName = $("#commodityName").val();
					if(commodityName=='')
					{
						alert('商品名称不能为空！');
						return;	
					}
					
					var commodityTagId = $("#commodityTagId").val();
					if(commodityTagId=='0')
					{
						alert('商品分类不能不选！');
						return;	
					}
					
					$(this).val('正在提交...');
					$(this).prop('disabled', 'disabled');
					
					var url = '/commodity/save.html';
					$.post(url, $('#editForm').serialize(), function(data) {
						if (data.error == '0') {
							alert('好了！');
							self.location=document.referrer;
							//window.location.href = '/commodity/list.html?page.currentPage='+vo.page.currentPage;
						} else {
							alert(data.msg);
							$('#btn_submit').val('提交');
							$('#btn_submit').removeProp('disabled');
						}
					});
				}
		});
			});
	
	$('#imageConPathFile').change(function() {
		uploadImage($(this), $('#imageConPathImg'), $('#icon'));
	});
	
	$('#smallPicFile').change(function() {
		uploadImage($(this), $('#smallPicImg'), $('#commodityImg'));
	});

	$('#imagePathFile').change(function() {
		uploadImage($(this), $('#imagePathImg'), $('#commodityImg2'));
	});
	
	$('#smallPicFile1').change(function() {
		uploadImage($(this), $('#smallPicImg1'), $('#commodityImg3'));
	});

	$('#imagePathFile1').change(function() {
		uploadImage($(this), $('#imagePathImg1'), $('#commodityImg4'));
	});
	
	$('#imagePathFile2').change(function() {
		uploadImage($(this), $('#imagePathImg2'), $('#commodityImg5'));
	});
	
	$('#imagePathFile3').change(function() {
		uploadImage($(this), $('#imagePathImg3'), $('#commodityImg6'));
	});
	
	$('#imagePathFile4').change(function() {
		uploadImage($(this), $('#imagePathImg4'), $('#commodityImg7'));
	});
	
	$('#imagePathFile5').change(function() {
		uploadImage($(this), $('#imagePathImg5'), $('#commodityImg8'));
	});
	$('#imagePathFile6').change(function() {
		uploadImage($(this), $('#imagePathImg6'), $('#commodityImg9'));
	});
	$('#imagePathFile7').change(function() {
		uploadImage($(this), $('#imagePathImg7'), $('#commodityImg10'));
	});
	
	$('#imagebigImgConPathFile').change(function() {
		uploadImage($(this), $('#imagebigImgConPathImg'), $('#bigImg'));
	});
	
	
	
	/**
	 * 上传图片时调用
	 */
	function uploadImage($fileId, $imageObj, $image) {
		//创建FormData对象
		var data = new FormData();

		//为FormData对象添加数据
		$.each($fileId[0].files, function(i, file) {
			data.append('fileName', file);
		});

		$.ajax({
			url : '/commodity/uploadFile.html',
			type : 'POST',
			data : data,
			cache : false,
			contentType : false, //不可缺
			processData : false, //不可缺
			success : function(result) {
				if (result.result = 'success') {
					$imageObj.attr('src', result.filePath);
					$image.val(result.filePath);
				} else {
					alert('我的天呐，上传失败了，赶紧问一下程序员GG');
				}
			},
			error : function() {
				alert('请先选择您要上传的图片');
			}
		});
	}
	
</script>
</html>