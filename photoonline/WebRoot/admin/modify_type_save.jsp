<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>ͼ������޸�</title>
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
out.println("<div align=center><h1>�޸�ͼƬ���ɹ���</h1></div>");
response.setHeader("refresh","3;url=albumtype_management.jsp");
}
else{
out.println("<div align=center><h1><font color=red>�޸�ͼƬ��𲻳ɹ���</font></h1><br><input type=button value=���� onClick=window.history.go(-1)></div>");
}
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>