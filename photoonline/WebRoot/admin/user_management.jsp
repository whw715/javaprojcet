<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.util.*,java.sql.*;" %>
<jsp:useBean scope="page" id="users" class="photoOnline.Users"/>
<html>
<head>
<title>欢迎光临网上书店</title>
</head>
<body bgcolor="#F4FFFE">
<form action="delete_users.jsp" name="form1" method="post">
<div align="center">
<h1>会员管理</h1>
<table width="75%" border="0" cellpadding="0" cellspacing="1">
<tr bgcolor="#0066FF">
<td width="10%" height="20" align="center"><font color="#FFFFFF">选中</font></td>
<td width="15%" height="20" align="center"><font color="#FFFFFF">用户名</font></td>
<td width="25%" height="20" align="center"><font color="#FFFFFF">用户密码</font></td>
<td width="25%" height="20" align="center"><font color="#FFFFFF">邮箱</font></td>
<td width="25%" height="20" align="center"><font color="#FFFFFF">注册时间</font></td>
</tr>
<% 
ResultSet rs=null;
rs=users.show_users();
//显示图书信息
while(rs.next()){
%>
<tr>
<td width="10%" height="20" align="center"><input type="checkbox" name="DeleteID" value='<%=rs.getInt("UserID") %>'/></td>
<td width="15%" height="20" align="center"><%=rs.getString("UserName") %></td>
<td width="25%" height="20" align="center"><%=rs.getString("UserPassword") %></td>
<td width="25%" height="20" align="center"><%=rs.getString("Email") %></td>
<td width="25%" height="20" align="center"><%=rs.getString("CreateTime") %></td>
</tr>
<% 
}
%>
</table>
<p>
<a href="javascript:form1.submit()" target="_self"><font color="#0000FF">删除选中的用户</font></a>
<a href="admin.jsp" target="_self"><font color="#0000FF">返回主页</font></a>
</div>
</form> 
</body>
</html>