<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
<title>µç×ÓÏà²á</title>
<style>
body{ background:url(images/13.jpg) repeat-x center top;}
</style>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body onLoad="MM_preloadImages('/image/01.gif','../myjsp/lo4go_02.gif','../myjsp/lo4go_03.gif')">

<div align="center">
  <table width="1000" border="0" cellpadding="0" cellspacing="0">
    <!--DWLayoutTable-->
    <tr>
      <td height="154" colspan="5" valign="top"><img src="images/11.jpg" width="1000" height="154" /></td>
    </tr>
    <tr>
      <td width="28" height="33" valign="top"><img src="images/01.gif" width="28" height="33" /></td>
      <td width="80" valign="top"><a href="index.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','images/22.gif',1)"><img src="images/02.gif" name="Image3" width="80" height="33" border="0" id="Image3" /></a></td>
      <td width="81" valign="top"><a href="normal/users.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','images/33.gif',1)"><img src="images/03.gif" name="Image4" width="81" height="33" border="0" id="Image4" /></a></td>
      <td width="84" valign="top"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','images/44.gif',1)"><img src="images/04.gif" name="Image5" width="84" height="33" border="0" id="Image5" /></a></td>
      <td width="727" valign="top"><img src="images/05.gif" width="727" height="33" /></td>
    </tr>
  </table>
  
<table width="1000" border="0" cellpadding="0" cellspaing="0">
<tr>
<td width="740" bgcolor="#E6E0BB">
<%@include file="change_images.jsp" %>
</td>
<td width="260" bgcolor="#FFDEAD" height="300" valign="top"><%@ include file="user_login.jsp" %></td>
</tr>
</table>
</div>
</body>
</html>