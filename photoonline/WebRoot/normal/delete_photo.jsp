<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.io.*" %>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>删除图片</title>
</head>
<body>
<% 
String s_PhotoID=request.getParameter("PhotoID");
int PhotoID=Integer.parseInt(s_PhotoID);
photo.setPhotoID(PhotoID);
String path=request.getRealPath("/")+"/userimages";  //获取图片路径
String PhotoName="";
if((photo.init())&&(photo.delete_Photo(s_PhotoID))){
	PhotoName=photo.getPhotoName(); //获取图片名
	File filename=new File(path,""+PhotoName+"");
	System.out.println(PhotoName+" "+filename);
	filename.delete(); //删除图片
    out.println("<div align=center><h1>删除相片成功！</h1></div>");
    response.setHeader("refresh","3;url=users.jsp");
}else{
out.println("<div align=center><font color=red><h1>删除不成功！</h1></font></div>");
response.setHeader("refresh","3;url=users.jsp");
}
%>
</body>
</html>