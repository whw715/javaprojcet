<%@page contentType="text/html;charset=gb2312"%>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>�����Ƭ����</title>
</head>
<body>
<% 
String AlbumType=request.getParameter("AlbumType");
albumtype.setAlbumType(AlbumType);
if(albumtype.add_AlbumType()){
	out.println("<div align=center><h1>��ӳɹ���3����Զ���ת�������Ƭ����ҳ�档<h1></div>");
	response.setHeader("refresh","3;url=albumtype_management.jsp");
}else{
	out.println("<div align=center><h1><font color=red>���ʧ�ܣ��������</font></h1>");
	out.println("<input type=button value=���� onclick=window.history.go(-1)></div");
}
%>
</body>
</html>