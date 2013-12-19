<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
<title>µç×ÓÏà²á</title>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
<body>
<div align="center">
<table id="ss" width="1000" height="40" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="images/01.gif" width="135" height="40" alt=""></td>
		<td>
			<a href="index.jsp"><img src="images/02.gif" width="59" height="36" alt=""></a></td>
		<td>
			<a href="user_login.jsp"><img src="images/03.gif" width="90" height="36" alt=""></a></td>
		<td>
			<a href="user_login.jsp"><img src="images/04.gif" width="92" height="36" alt=""></a></td>
		<td>
			<script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','612','height','40','src','images/50','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','images/50' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="612" height="40">
        <param name="movie" value="images/50.swf">
        <param name="quality" value="high">
        <embed src="images/50.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="612" height="40"></embed>
      </object></noscript></td>
	</tr>
</table>
<table width="1000" border="0" cellpadding="0" cellspaing="0">
<tr>
<td width="740" bgcolor="#E6E0BB"></td>
<td width="260" bgcolor="#EFCCCC"><%@ include file="../user_login.jsp" %>
</tr>
</table>
</div>
</body>
</html>