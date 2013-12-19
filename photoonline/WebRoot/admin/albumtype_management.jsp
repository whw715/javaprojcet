<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<%
//获取所有图书类别信息
ResultSet rs=albumtype.show_Type();
%>
<html>
<head>
<title>欢迎光临网上电子相册</title>
</head>
<body bgcolor="#e4e8ef">
<div align="center">
<h1>图片类别管理</h1>
<form name="form1" action="delete_type.jsp" method="post">
<table width="60%" border="0" cellpadding="0" cellspacing="1">
<tr bgcolor="#0066FF">
<td width="20%" height="20" align="center"><font color="#FFFFFF">选中</font></td>
<td width="50%" height="20" align="center"><font color="#FFFFFF">图片类别</font></td>
<td width="30%" height="20" align="center"><font color="#FFFFFF">修改名称</font></td>
</tr>
<% 
int i=0;
//显示图书类别信息
while(rs.next()){
%>
<tr>
<td width="20%" height="20" align="center"><input type="checkbox" name="DeleteID" value='<%=rs.getInt("AlbumTypeID") %>'/></td>
<td width="50%" height="20" align="center">&nbsp;&nbsp;<%=rs.getString("AlbumType") %></td>
<td width="30%" height="20" align="center"><a href='modify_type_form.jsp?AlbumTypeID=<%=rs.getInt("AlbumTypeID") %>' target="_self">
<font color="#0000FF">修改</font></a></td>
</tr>
<% 
}
%>
</table>
<p>
<a href="javascript:form1.submit()" target="_self"><font color="#0000FF">删除选中的图片类别</font></a>
<a href="albumtype.jsp" target="_self"><font color="#0000FF">添加新图片类别</font></a>
<a href="admin.jsp" target="_self"><font color="#0000FF">返回主页</font></a>
</p>
</form>
</div>
</body>
</html>