<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<html>
<head>
<title>�޸������Ϣ</title>
</head>
<body>
<% 
String TypeID=request.getParameter("AlbumTypeID");
int AlbumTypeID=Integer.parseInt(TypeID);
String AlbumName=request.getParameter("AlbumName");
String AlbumCon=request.getParameter("AlbumCon");
int AlbumID=(Integer)session.getAttribute("AlbumID");
album.setAlbumID(AlbumID);
album.setAlbumTypeID(AlbumTypeID);
album.setAlbumName(AlbumName);
album.setAlbumCon(AlbumCon);
if(album.modify()){
out.println("<div align=center><h1>�޸������Ϣ�ɹ���</h1></div>");
response.setHeader("refresh","3;url=users.jsp");
}
else{
out.println("<div align=center><h1><font color=red>�޸���᲻�ɹ���</font></h1><br><input type=button value=���� onClick=window.history.go(-1)></div>");
}
%>
</body>
</html>