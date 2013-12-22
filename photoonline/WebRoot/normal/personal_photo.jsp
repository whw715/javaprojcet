<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>

<html>
<head>
<title>相片</title>
</head>
<style>
body{ background:url(images/13.jpg) repeat-x center top;}
</style>
<body>
<div align="center">
<%
String s_AlbumID=request.getParameter("AlbumID");
int AlbumID=Integer.parseInt(s_AlbumID);
album.setAlbumID(AlbumID);
if(album.init()){
%>
<h1>相册【<font color="#ee79ac"><%=album.getAlbumName() %></font>】中的相片：</h1>
<table>
<tr>

<%
photo.setAlbumID(AlbumID);
ResultSet rs=photo.get_photo();
ResultSet rs2=photo.get_photo();
for(int i=1;i<6;i++){
if(rs2.next()){
		%>
		<td align="center"><a href='photo_size.jsp?PhotoID=<%=rs2.getInt("PhotoID") %>' target="_self"><img src="../userimages/<%=rs2.getString("PhotoName") %>" width="150" height="150"/></a>
		<br/>
		（<font color="#8828d2"><%=rs2.getString("PhotoDes") %>）</font><br/>
		<a href='modify_photo.jsp?PhotoID=<%=rs2.getInt("PhotoID") %>' target="_self">编辑</a>&nbsp;
		<a href='delete_photo.jsp?PhotoID=<%=rs2.getInt("PhotoID") %>' target="_self">删除</a>&nbsp;
		<a href="http://xiuxiu.web.meitu.com/">~照片美化~</a>&nbsp;&nbsp;
		</td>
		<%
}
%>

<%
}
}
%>
	</tr>
	

</table>
</div>
</body>
</html>
