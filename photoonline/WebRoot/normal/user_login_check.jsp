<%@page contentType="text/html;charset=gb2312" language="java" import="java.sql.*,java.util.*"%>
<jsp:useBean id="users" scope="page" class="photoOnline.Users"/>
<html>
<head>
<title>�û���¼</title>
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
	//��ǰ��¼�û�����ͨ�û�
	case 0:
		out.println("<h1 align=center>��¼�ɹ���3��֮���Զ�ת��������ҳ��</h1>");
		response.setHeader("refresh","3;url=users.jsp");
	break;
	//��ǰ��¼�û��ǹ���Ա
	case 1:
		out.println("<h1 align=center>��¼�ɹ���3��֮���Զ�ת������Աҳ�档</h1>");
		response.setHeader("refresh","3;url=../admin/admin.jsp");
	break;
	default:
	break;
	}
	
}
else
{
out.println("<h1 align=center><font color=red>����û��������벻��ȷ�����������룡</font></h1>");
out.println("<center><input type=button value=���� onClick='window.history.go(-1)'></center>");
}
%>
</body>
</html>