<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<html>
<head>
<title>��ʾͼƬ</title>
</head><style>
body{ background:url(../images/13.jpg) repeat-x center top;}
</style>
<form action="findphotos.jsp" name="id" method="get">
<td  bgcolor="#EFEFEF" align="right">��������������</td>
<td>
<input type="text" name="sousuo" style="height:22px" style="width:152px"></td>
<p><input type="submit" value="�ύ" /></p>        
</form>
<%
String result=request.getParameter("sousuo");
photo.setPhotoDes(result);
ResultSet rs=photo.get_ph();
while(rs.next()){%>	
	<div align="center"><img src="../userimages/<%=rs.getString("PhotoName") %>"/></div>
		  <% }	


%>	
</body>

</html>