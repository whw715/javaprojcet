<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>��ӭ�����������</title>
</head>
<body bgcolor="#e4e8ef">
<div align="center">
<form action="modify_type_save.jsp" method="post">
<% 
String s_AlbumTypeID=request.getParameter("AlbumTypeID");
System.out.println(s_AlbumTypeID);
int AlbumTypeID=Integer.parseInt(s_AlbumTypeID);
albumtype.setAlbumTypeID(AlbumTypeID);
session.setAttribute("albumTypeID",AlbumTypeID);
ResultSet rs=null;
if(albumtype.init()){
%>
��Ҫ�޸ĵ�ͼ����������ǣ�<input type="text" name="AlbumType" value="<%=albumtype.getAlbumType()%>"/>
<input type="submit" value="�޸�"/>&nbsp;&nbsp;<input type="button" value="����" onClick="window.history.go(-1)">
<% 
}
%>
</form>
</div>
</body>
</html>