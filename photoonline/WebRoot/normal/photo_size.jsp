<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>´óÍ¼</title>
</head>
<body>
<div align="center">
<%
String s_photoID=request.getParameter("PhotoID");
int PhotoID=Integer.parseInt(s_photoID);
photo.setPhotoID(PhotoID);
if(photo.init()){
	String PhotoName=photo.getPhotoName();
%>
<img src="../userimages/<%=PhotoName %>"/>
<input type="button" value="·µ»Ø" onclick="window.history.go(-1)">
<%
}
%>
</div>
</body>
</html>