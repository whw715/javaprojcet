<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<html>
<head>
<title>添加相片</title>
</head>
<body>
<div align="center">
<br/>
<br/>
<br/>
<h1>上传相片</h1>
<form action="add_photo.jsp" method="post" ENCTYPE="multipart/form-data">
<table>
<tr>
<td align="right">请选择相册：</td>
<td>
<select name="AlbumID">
<% 
int UserID=0;
UserID=(Integer)session.getAttribute("UserID");
album.setUserID(UserID);
ResultSet rs=album.show_users_Album();
while(rs.next()){
	int AlbumID=rs.getInt("AlbumID");
	String AlbumName=rs.getString("AlbumName");
%>
<option value="<%=AlbumID %>"><%=AlbumName %></option>
<%
}
%>
</select>
</td>
</tr>
<tr>
<td align="center">上传相片：</td>
<td><input type="file" name="photo"/></td>
</tr>
<tr>
<td align="center">对相片的描述：</td>
<td><input type="text" name="PhotoCon"/></td>
</tr>
</table>
<input type="submit" value="提交"/>&nbsp;&nbsp;
<input type="button" value="返回个人主页" onclick="window.open('users.jsp','_blank')"/>
</form>
</div>
<% 

%>
</body>
</html>