<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path=request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="<%=path%>/css/index_work.css"/> 
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
</head>
<script type="text/javascript">
	function page(cpage){
		$("[name='cpage']").val(cpage);
		$("form").submit();
	}
	$(function(){
		
		$("#cks").click(function(){
			$(".ck").prop("checked",this.checked)
		})
		
		$.post("getTypeList.do",function(m){
			var select = $("[name='tid']");
			select.append('<option value="0">==请选择==</option>')
			for(var i in m){
				select.append('<option value="'+m[i].tid+'">'+m[i].tname+'</option>')
			}
		})
	})
	function ps(){
		var pids="";
		$(".ck:checked").each(function(){
			pids+=","+$(this).val();
		})
		pids=pids.substring(1);
		$.post("deleteall.do",{pids:pids},function(m){
			if(m>0){
				alert("删除"+m+"条数据")
				location='list.do'
			}else{
				alert("删除失败,选择数据不能为空")
			}
			
		})
	}
</script>
<body>
	<form action="list.do" method="post">
		<input type="hidden" name="cpage" value="${page.pageNum }">
		名称:<input type="text" name="pname" value="${map.pname }">
		类型:<select name="tid">
				
			</select>
			<input type="button" value="批量删除" onclick="ps()">
		<button>搜索</button>
	</form>
	<table>
		<tr>
			<td>
					<input type="checkbox" id="cks" >
				</td>
			<td>编号</td>
			<td>名称</td>
			<td>类型</td>
			<td>简介</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="li">
			<tr>
				<td>
					<input type="checkbox" value="${li.pid }" class="ck">
				</td>
				<td>${li.pid }</td>
				<td>${li.pname }</td>
				<td>${li.content }</td>
				<td>${li.tname }</td>
				<td>
					<input type="button" value="添加" onclick="location='toadd.do'">
					<input type="button" value="修改" onclick="location='toupdate.do?pid=${li.pid}'">
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8">
				<input type="button" value="首页" onclick="page('1')">
				<input type="button" value="上一页" onclick="page('${page.pageNum-1}')">
				<input type="button" value="下一页" onclick="page('${page.pageNum+1}')">
				<input type="button" value="尾页" onclick="page('${page.pages}')">
				&nbsp;当前:${page.pageNum}页/共${page.pages}页
			</td>
		</tr>
	</table>
</body>
</html>