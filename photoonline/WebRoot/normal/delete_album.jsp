<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*,java.io.*" %>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>删除相册</title>
</head>
<style>
body{ background:url(images/13.jpg) repeat-x center top;}
</style>
<body>
<%
String s_AlbumID=request.getParameter("AlbumID");
int AlbumID=Integer.parseInt(s_AlbumID);
album.setAlbumID(AlbumID);
photo.setAlbumID(AlbumID);
ResultSet rs=photo.get_photo(); //获取Photo中所有相册号为AlbumID的对象
while(rs.next()){
	String PhotoID=rs.getInt("PhotoID")+"";
if(photo.delete_Photo(PhotoID)){
	String path=request.getRealPath("/")+"/userimages";  //获取图片路径
	String PhotoName="";
	File filename=null;
		PhotoName=rs.getString("PhotoName");
		filename=new File(path,""+PhotoName+"");
		filename.delete();
	}else{
		System.out.println("删除相册信息失败");
	}
}
if(album.delete_Album(s_AlbumID)){
out.println("<div align=center><h1>删除相册信息成功！</h1></div>");
response.setHeader("refresh","3;url=users.jsp");
}else{
	out.println("<div align=center><h1><font color=red>删除相册信息失败！</font></h1></div>");
	response.setHeader("refresh","3;url=myalbum.jsp");
}
		%>
		
</body>
</html>