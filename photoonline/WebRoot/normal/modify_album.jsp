<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<html>
<head>
<title>�޸������Ϣ</title>
<style>
body{ background:url(images/13.jpg) repeat-x center top;}
</style>
<script language="javascript">
function check(){
	var AlbumName=id.AlbumName.value;

	if(AlbumName==""){
		alert ("���������Ϊ�գ�");
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
<h1>�޸������Ϣ</h1>
<form action="modify_album_save.jsp" name="id" method="post" onclick="return check()">
<table>
<tr>
<td align="center">������ͣ�</td>
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
<td align="center">�������</td>
<td><input type="text" name="AlbumName" width="200" value="<%=album.getAlbumName() %>"/><font color="red">(���</font></td>
</tr>
<tr>
<td align="center">��飺</td>
<td><textarea name="AlbumCon" cols="70" rows="10"><%=album.getAlbumCon() %></textarea></td>
</tr>
</table>
<input type="submit" value="�ύ"/>&nbsp;&nbsp;
<input type="button" value="����"/>
</div>
</form>
<%
}
%>
</body>
</html>