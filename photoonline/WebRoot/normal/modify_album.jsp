<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<html>
<head>
<title>修改相册信息</title>
<style>
body{ background:url(images/13.jpg) repeat-x center top;}
</style>
<script language="javascript">
function check(){
	var AlbumName=id.AlbumName.value;

	if(AlbumName==""){
		alert ("相册名不能为空！");
		return false;
	}
	else{
		return true;
	}
}
</script>
</head>
<body>

<div align="center">
<h1>修改相册信息</h1>
<form action="modify_album_save.jsp" name="id" method="post" onclick="return check()">
<table>
<tr>
<td align="center">相册类型：</td>
<td>
<%
String s_AlbumID=request.getParameter("AlbumID");
int AlbumID=Integer.parseInt(s_AlbumID);
album.setAlbumID(AlbumID);
session.setAttribute("AlbumID",AlbumID);
if(album.init()){
	int AlbumTypeID=album.getAlbumTypeID();
	albumtype.setAlbumTypeID(AlbumTypeID);
	if(albumtype.init()){
%>
<select name="AlbumTypeID">
<option value="<%=albumtype.getAlbumTypeID()%>" selected><%=albumtype.getAlbumType() %></option>
<% 
ResultSet rs=albumtype.show_Type();
while(rs.next()){
	int albumtypeid=rs.getInt("AlbumTypeID");
	String AlbumType=rs.getString("AlbumType");
%>
<option value="<%=albumtypeid %>"><%=AlbumType %></option>
<%
}
	}
%>
</select>
</td>
</tr>
<tr>
<td align="center">相册名：</td>
<td><input type="text" name="AlbumName" width="200" value="<%=album.getAlbumName() %>"/><font color="red">(必填）</font></td>
</tr>
<tr>
<td align="center">简介：</td>
<td><textarea name="AlbumCon" cols="70" rows="10"><%=album.getAlbumCon() %></textarea></td>
</tr>
</table>
<input type="submit" value="提交"/>&nbsp;&nbsp;
<input type="button" value="重置"/>
</div>
</form>
<%
}
%>
</body>
</html>