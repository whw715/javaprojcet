<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*,java.io.*" %>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>ɾ�����</title>
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
ResultSet rs=photo.get_photo(); //��ȡPhoto����������ΪAlbumID�Ķ���
while(rs.next()){
	String PhotoID=rs.getInt("PhotoID")+"";
if(photo.delete_Photo(PhotoID)){
	String path=request.getRealPath("/")+"/userimages";  //��ȡͼƬ·��
	String PhotoName="";
	File filename=null;
		PhotoName=rs.getString("PhotoName");
		filename=new File(path,""+PhotoName+"");
		filename.delete();
	}else{
		System.out.println("ɾ�������Ϣʧ��");
	}
}
if(album.delete_Album(s_AlbumID)){
out.println("<div align=center><h1>ɾ�������Ϣ�ɹ���</h1></div>");
response.setHeader("refresh","3;url=users.jsp");
}else{
	out.println("<div align=center><h1><font color=red>ɾ�������Ϣʧ�ܣ�</font></h1></div>");
	response.setHeader("refresh","3;url=myalbum.jsp");
}
		%>
		
</body>
</html>