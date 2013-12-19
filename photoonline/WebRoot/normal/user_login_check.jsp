<%@page contentType="text/html;charset=gb2312" language="java" import="java.sql.*,java.util.*"%>
<jsp:useBean id="users" scope="page" class="photoOnline.Users"/>
<html>
<head>
<title>用户登录</title>
</head>
<body>
<% 
String user=request.getParameter("user");
String password=request.getParameter("password");
int sysRole=Integer.parseInt(request.getParameter("sysRole"));
users.setUserName(user);
users.setUserPassword(password);
users.setSysRole(sysRole);
if(users.user_valid())
{
	int UserID=users.getUserID();
	session.setAttribute("UserID",UserID);
	session.setAttribute("user",user);
	session.setAttribute("SysRole",sysRole);
	
	switch(sysRole){
	//当前登录用户是普通用户
	case 0:
		out.println("<h1 align=center>登录成功，3秒之后将自动转到个人主页。</h1>");
		response.setHeader("refresh","3;url=users.jsp");
	break;
	//当前登录用户是管理员
	case 1:
		out.println("<h1 align=center>登录成功，3秒之后将自动转到管理员页面。</h1>");
		response.setHeader("refresh","3;url=../admin/admin.jsp");
	break;
	default:
	break;
	}
	
}
else
{
out.println("<h1 align=center><font color=red>你的用户名或密码不正确，请重新输入！</font></h1>");
out.println("<center><input type=button value=返回 onClick='window.history.go(-1)'></center>");
}
%>
</body>
</html>