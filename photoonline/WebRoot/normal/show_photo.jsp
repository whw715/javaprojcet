<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<html>
<head>
<title>��ʾ���ͼƬ</title>
</head>
<body>
<%
String s_AlbumID=request.getParameter("AlbumID");
int AlbumID=Integer.parseInt(s_AlbumID);
photo.setAlbumID(AlbumID);
	ResultSet rs=photo.get_photo();
	while(rs.next()){
		%>
		<div align="center"><img src="../userimages/<%=rs.getString("PhotoName") %>"/></div>
		<%
              }
        %>
        
</body>
</html>