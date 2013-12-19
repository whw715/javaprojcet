<%@page contentType="text/html;charset=gb2312" language="java"%>
<%
	//使session失效
	session.invalidate();
	//跳转到登陆页面
	response.sendRedirect("../index.jsp");
%>