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
<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	
	$.post("getTypeList.do",function(m){
		var select = $("[name='tid']");
		select.append('<option value="0">==请选择==</option>')
		for(var i in m){
			select.append('<option value="'+m[i].tid+'">'+m[i].tname+'</option>')
		}
	})
})
function tj(){
	$.post("add.do",$("form").serialize(),function(m){
		if(m>0){
			alert("添加成功")
			location='list.do'
		}else{
			alert("添加失败")
		}
	})
} 
</script>
<body>
	<form action="add.do" method="post">
		名称:<input type="text" name="pname"><br>
		简介: <textarea rows="5" cols="5" name="content">
		</textarea><br>
		类型:<select name="tid">
				
			</select><br>
			<input type="button" value="添加" onclick="tj()">
	</form>
</body>
</html>