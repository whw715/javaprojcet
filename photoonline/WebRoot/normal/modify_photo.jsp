<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>�޸���Ƭ��Ϣ</title>
</head>
<body>
<div align="center">
<br/>
<br/>
<br/>
<h1>�޸���Ƭ��Ϣ</h1>
<form action="modify_photo_save.jsp" method="post">
<table>
<tr>
<td align="right">��ѡ����᣺</td>
<td>

<% 
String s_photoID=request.getParameter("PhotoID");
int PhotoID=Integer.parseInt(s_photoID);
photo.setPhotoID(PhotoID);
session.setAttribute("PhotoID",PhotoID);
if(photo.init()){
	int AlbumID=photo.getAlbumID();
	album.setAlbumID(AlbumID);
	if(album.init()){
		int UserID=album.getUserID();
		album.setUserID(UserID);
		session.setAttribute("AlbumID",album.getAlbumID());
%>
<select name="AlbumID">
<option value="<%=album.getAlbumID()%>" selected><%=album.getAlbumName() %></option>
<% 
ResultSet rs=album.show_users_Album();
while(rs.next()){
	int albumid=rs.getInt("AlbumID");
	String AlbumName=rs.getString("AlbumName");
%>
<option value="<%=albumid %>"><%=AlbumName %></option>
<%
}
	}
%>
</select>
</td>
</tr>
<tr>
<td align="center">����Ƭ��������</td>
<td><input type="text" name="PhotoCon" value="<%=photo.getPhotoDes() %>"/></td>
</tr>
</table>
<input type="submit" value="�ύ"/>&nbsp;&nbsp;
<input type="button" value="���ظ�����ҳ" onclick="window.open('users.jsp','_blank')"/>
</form>
</div>
<%
}
%>
</body>
</html>