<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="Content/jqueryEasyui/themes/default/easyui.css"
	rel="stylesheet" type="text/css" />
<link href="Content/jqueryEasyui/themes/ui-cupertino/menu.css"
	rel="stylesheet" type="text/css" />
<link href="Content/jqueryEasyui/themes/color.css" rel="stylesheet"
	type="text/css" />
<link href="Content/jqueryEasyui/themes/icon.css" rel="stylesheet"
	type="text/css" />
<script src="Content/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="Content/jqueryEasyui/jquery.easyui.min.js"
	type="text/javascript"></script>
</head>
<body>
	This is a testing JSP
	<br>
	<form action="login">
		username:<input type="text" class="easyui-textbox" name="username"><br>
		password:<input type="password"  class="easyui-textbox" prompt="Password"  name="pwd"><br> <input class="easyui-linkbutton"
			type="submit">
	</form>
</body>
</html>