<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.util.*,java.sql.*;" %>
<jsp:useBean scope="page" id="users" class="photoOnline.Users"/>
<html>
<head>
<title>��ӭ�����������</title>
</head>
<body bgcolor="#F4FFFE">
<form action="delete_users.jsp" name="form1" method="post">
<div align="center">
<h1>��Ա����</h1>
<table width="75%" border="0" cellpadding="0" cellspacing="1">
<tr bgcolor="#0066FF">
<td width="10%" height="20" align="center"><font color="#FFFFFF">ѡ��</font></td>
<td width="15%" height="20" align="center"><font color="#FFFFFF">�û���</font></td>
<td width="25%" height="20" align="center"><font color="#FFFFFF">�û�����</font></td>
<td width="25%" height="20" align="center"><font color="#FFFFFF">����</font></td>
<td width="25%" height="20" align="center"><font color="#FFFFFF">ע��ʱ��</font></td>
</tr>
<% 
ResultSet rs=null;
rs=users.show_users();
//��ʾͼ����Ϣ
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
<a href="javascript:form1.submit()" target="_self"><font color="#0000FF">ɾ��ѡ�е��û�</font></a>
<a href="admin.jsp" target="_self"><font color="#0000FF">������ҳ</font></a>
</div>
</form> 
</body>
</html>