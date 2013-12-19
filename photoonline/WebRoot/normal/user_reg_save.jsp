<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@page import="java.util.*,java.sql.*" %>
<jsp:useBean scope="page" id="users" class="photoOnline.Users"/>
<html>
<head>
<title>用户注册</title>
</head>
<body>
<% 
String Rand1=request.getParameter("Rand");
String Rand2=(String)session.getAttribute("rand");
if(Rand1.equals(Rand2)){
String UserName=request.getParameter("user");
String UserPassword=request.getParameter("password");
String Email=request.getParameter("email");
System.out.println(UserName+" "+UserPassword+" "+Email);
users.setUserName(UserName);
users.setUserPassword(UserPassword);
users.setEmail(Email);
if(users.is_exist()){
	out.println("<div align=center><h1><font color=red>你输入的用户名已经存在</font></h1>");
	out.println("<input type=button value=返回 onclick=window.history.go(-1)></div>");
}else{
if(users.add_user()){
	out.println("<div align=center><h1>恭喜你，注册成功。</h1>");
	out.println("<font color=red><h2>3秒之后将自动跳转到主页！</h2></font></div>");
	response.setHeader("refresh","3;url=../index.jsp");
}else{
	out.println("<div align=center><font color=red><h1>很遗憾，你注册失败，请重试！</h1></font>");
	out.println("<input type=button value=返回 onclick=window.history.go(-1)></div>");
}
}
}else{
	out.println("<div align=center><font color=red><h1>验证码错误！</h1></font>");
	out.println("<input type=button value=返回 onclick=window.history.go(-1)></div>");
}
%>
</body>
</html>