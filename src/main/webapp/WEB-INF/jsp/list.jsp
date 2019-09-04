<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/index_work.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function page(cpage){
		$("[name='cpage']").val(cpage)
		$("#page").submit()
	}
	function qx(){
		$("[name='a']").each(function(){
			$(this).attr('checked',!$(this).attr("checked"))
		})
	}
</script>
</head>
<body>
<form action="list.do" id="page" method="post">
	<input type="hidden" name="cpage" value="${page.pageNum }">
	名称：<input type="text" name="pname" value="${map.pname }">
	<button>查询</button>
</form>
<table>
	<tr>
		<td><input type="checkbox" name="all" onclick="qx()">全选</td>
		<td>编号</td>
		<td>名称</td>
		<td>简介</td>
		<td>类别</td>
		<td><input type="button" value="添加" onclick="location='toAdd.do'"></td>
	</tr>
	<c:forEach items="${list }" var="l">
		<tr>
			<td><input type="checkbox" name="a" value="${l.pid }"></td>
			<td>${l.pid }</td>
			<td>${l.pname }</td>
			<td>${l.content }</td>
			<td>${l.tname }</td>
			<td><input type="button" value="修改" onclick="xg()"> </td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="11">
			<input type="button" value="批量删除" onclick="ps()">
			<input type="button" value="首页" onclick="page('1')">
			<input type="button" value="上一页" onclick="page('${page.pageNum-1}')">
			<input type="button" value="下一页" onclick="page('${page.pageNum+1}')">
			<input type="button" value="尾页" onclick="page('${page.pages}')">
		</td>
	</tr>
</table>
</body>
</html>