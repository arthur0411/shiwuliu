<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link href="../../style/css/public.css?v=20161223" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../style/js/jquery.min.js"></script>
<script type="text/javascript" src="../../style/js/global.js"></script>

<link type="text/css" rel="stylesheet" href="../../style/plugins/zTree/zTreeStyle.css"/>
<script type="text/javascript" src="../../style/plugins/zTree/jquery.ztree-2.6.min.js"></script>
</head>
<body style="background-color: #FFFFFF;">
<div class="mainBox">
	<h3>
		<a href="/role.html" class="actionBtn">角色管理</a>
		<c:if test="${empty role.roleId }">
		添加角色
		</c:if>
		<c:if test="${not empty role.roleId }">
		修改角色
		</c:if>
	</h3>
	
	<form name="editForm" id="editForm" method="post" >
	<input type="hidden" name="roleId" value="${role.roleId }" />
	<table class="tableBasic" style="width: 100%;  ">
		<tr>
			<td width="150px">角色名称：</td>
			<td><input type="text" name="roleName" id="roleName" class="inpMain" value="${role.roleName }"/></td>
		</tr>
		<tr>
			<td>权限：</td>
			<td>
				<ul id="tree" class="tree" style="overflow:auto;"></ul>
				<input type="hidden" name="menuIds" id="menuIds"/>
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
		var nodes = zTree.getCheckedNodes();
		var tmpNode;
		var ids = "";
		for(var i=0; i<nodes.length; i++){
			tmpNode = nodes[i];
			if(i!=nodes.length-1){
				ids += tmpNode.id+",";
			}else{
				ids += tmpNode.id;
			}
		}
		var roleName = $('#roleName').val();
		var url = "auth/save.html";
		$('#menuIds').val(ids);
		var postData = $('#editForm').serialize();
		
		$.post(url, postData, function(data){
			if(data=="1") {
				alert('操作成功');
				window.location.href = "/role.html";
			} else if (data == '2') {
				alert('保存角色名失败');	
			} else {
				alert('操作失败,重复角色名称');	
			}
		});
	});
	var setting = {
	    showLine: true,
	    checkable: true
	};
	var zn = '${zTreeNodes}';
	var zTreeNodes = eval(zn);
	var zTree = $("#tree").zTree(setting, zTreeNodes);
});
// 选中左侧相应的菜单
activeMenu('角色管理');
</script>
</body>
</html>