<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<html>
<head>
<title>����б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
a:link {
	color: #000000;
	text-decoration: none;
}
a:visited {
	color: #0000FF;
	text-decoration: none;
}
a:hover {
	color: #FF00FF;
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center">
<br/><br/><br/>
<input type="button" value="����" onclick="window.history.go(-1)" width="80" height="40">
<h1>��վ�е��������</h1>
<table><tr>
            <% 
            ResultSet rs1=album.show_Album(); //��ȡ������е���Ϣ
            int AlbumID=0;
            while(rs1.next()){
            	AlbumID=rs1.getInt("AlbumID"); //��ȡ���������
                photo.setAlbumID(AlbumID); //����Photo����е�AlbumID
            ResultSet rs=photo.get_photo();
                if(rs.next()){
                	
            %>
            <td width="30">
<!-- Save for Web Slices (δ����.jpg) -->
<table id="__01" width="300" height="292" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="../images/i01.gif" width="300" height="72" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="../images/i02.gif" width="73" height="220" alt=""></td>
		<td>
			<a href='show_album_photo.jsp?AlbumID=<%=rs.getString("AlbumID") %>' target="_self"><img border="0" src="../userimages/<%=rs.getString("PhotoName") %>" width="199" height="193" alt=""></a></td>
		<td rowspan="2">
			<img src="../images/i04.gif" width="28" height="220" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/i05.gif" width="199" height="27" alt=""></td>
	</tr>
	<tr height="20" align="center">
	<td>�������</td>
	<td><%=rs1.getString("AlbumName") %></td>
	</tr>
    
	<%
                }else{
	%>
	<table id="__01" width="300" height="292" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="../images/i01.gif" width="300" height="72" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="../images/i02.gif" width="73" height="220" alt=""></td>
		<td>
			<a href="error_photo2.jsp"><img border="0" src="../images/i03.gif" width="199" height="193" alt=""></a></td>
		<td rowspan="2">
			<img src="../images/i04.gif" width="28" height="220" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/i05.gif" width="199" height="27" alt=""></td>
	</tr>
	<tr height="20" align="center">
	<td>�������</td>
	<td><%=rs1.getString("AlbumName") %></td>
    </tr>
	<%
                }
	%>
	<tr>
	<td height="20"></td>
	</tr>
</table></td>
	<%
            }
            	%>
            	<br>
	</tr>
</table>
<!-- End Save for Web Slices -->
</div>
</body>
</html>