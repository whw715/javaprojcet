<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>图书类别修改</title>
</head>
<body>
<% 
try{
String AlbumType=request.getParameter("AlbumType");
int AlbumTypeID=(Integer)session.getAttribute("albumTypeID");
albumtype.setAlbumTypeID(AlbumTypeID);
albumtype.setAlbumType(AlbumType);
System.out.println(AlbumType+" "+AlbumTypeID);
if(albumtype.modify_Type()){
out.println("<div align=center><h1>修改图片类别成功！</h1></div>");
response.setHeader("refresh","3;url=albumtype_management.jsp");
}
else{
out.println("<div align=center><h1><font color=red>修改图片类别不成功！</font></h1><br><input type=button value=返回 onClick=window.history.go(-1)></div>");
}
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>