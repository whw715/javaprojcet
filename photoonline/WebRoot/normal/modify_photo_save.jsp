<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>修改相片信息</title>
</head>
<body>
<% 
int PhotoID=(Integer)session.getAttribute("PhotoID");
String s_AlbumID=request.getParameter("AlbumID");
System.out.println(s_AlbumID);
int AlbumID=Integer.parseInt(s_AlbumID);
//int AlbumID=(Integer)session.getAttribute("AlbumID");
String PhotoCon=request.getParameter("PhotoCon");
photo.setPhotoID(PhotoID);
photo.setAlbumID(AlbumID);
photo.setPhotoDes(PhotoCon);
if(photo.modify_Photo()){
out.println("<div align=center><h1>修改相册信息成功！</h1></div>");
response.setHeader("refresh","3;url=users.jsp");
}
else{
out.println("<div align=center><h1><font color=red>修改相册不成功！</font></h1><br><input type=button value=返回 onClick=window.history.go(-1)></div>");
}
%>
</body>
</html>