<%@page contentType="text/html;charset=gb2312"%>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>添加相片类型</title>
</head>
<body>
<% 
String AlbumType=request.getParameter("AlbumType");
albumtype.setAlbumType(AlbumType);
if(albumtype.add_AlbumType()){
	out.println("<div align=center><h1>添加成功！3秒后将自动跳转到添加相片类型页面。<h1></div>");
	response.setHeader("refresh","3;url=albumtype_management.jsp");
}else{
	out.println("<div align=center><h1><font color=red>添加失败，请继续！</font></h1>");
	out.println("<input type=button value=返回 onclick=window.history.go(-1)></div");
}
%>
</body>
</html>