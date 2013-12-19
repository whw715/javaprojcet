<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.sql.*,java.io.*" %>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>电子相册个人主页</title>
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

<body bgcolor="#e4e8ef" onload="MM_preloadImages('../../myjsp/p4.gif')">
<%
int sysRole=-1;
try{sysRole=(Integer)session.getAttribute("SysRole");
}catch(Exception e){};

if(sysRole==0){
%>

<div align="center">
<table id="__01" width="1000" height="100" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3"><img src="../../myjsp/personal_01.gif" width="1000" height="32" /></td>
  </tr>
	<tr>
		<td rowspan="2"><img src="../../myjsp/personal_02.gif" width="44" height="68" /></td>
<td><a href="../index.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image17','','../../myjsp/p4.gif',1)"><img src="../../myjsp/personal_03.gif" name="Image17" width="96" height="41" border="0" id="Image17" /></a></td>
<td rowspan="2"><img src="../../myjsp/personal_04.gif" width="860" height="68" /></td>
  </tr>
	<tr>
		<td><img src="../../myjsp/personal_05.gif" width="96" height="27" /></td>
  </tr>
</table>
  <table width="1000" border="0" cellpadding="0" cellspacing="0">
    <!--DWLayoutTable-->
    <tr>
      <td height="10" colspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr>
          <td width="1000" height="10" valign="top"></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td width="200" height="1148" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#9933CC">
        <!--DWLayoutTable-->
        <tr>
          <td width="200" height="30" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
        <tr>
          <td height="200" valign="top"><img src="../images/moren.gif" /></td>
          </tr>
        <tr>
          <td height="50" valign="top"><div align="center">名称：<font color="red"><%=session.getAttribute("user")%></font></div></td>
          </tr>
        <tr>
          <td height="20" valign="top"><div align="center"><a href="album.jsp">【新建相册】</a></div></td>
           </tr>
           
           
           <tr>
          <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#0000FF">
            <!--DWLayoutTable-->
            <tr>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              <td height="1" valign="top" width="80" bgcolor="#000000"></td>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              
              </tr>
            </table>
            </td>
            <tr>
            <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td height="20" valign="top"><a href="show_album.jsp"><div align="center">【查看相册】</div></a></td>
          </tr>
           
           
        <tr>
          <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#0000FF">
            <!--DWLayoutTable-->
            <tr>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              <td height="1" valign="top" width="80" bgcolor="#000000"></td>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              
              </tr>
            </table>
            </td>
            <tr>
            <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td height="20" valign="top"><a href="photo.jsp"><div align="center">【上传相片】</div></a></td>
          </tr>
          
        
           <tr>
          <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#0000FF">
            <!--DWLayoutTable-->
            <tr>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              <td height="1" valign="top" width="80" bgcolor="#000000"></td>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              
              </tr>
            </table>
            </td>
            <tr>
            <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td height="20" valign="top"><a href="../index.jsp"><div align="center">【返回主页】</div></a></td>
          </tr>
          
          
           <tr>
          <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#0000FF">
            <!--DWLayoutTable-->
            <tr>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              <td height="1" valign="top" width="80" bgcolor="#000000"></td>
              <td height="1" width="60" valign="top" bgcolor="#9933cc"></td>
              
              </tr>
            </table>
            </td>
            <tr>
            <td height="10" valign="top"></td>
          </tr>
        <tr>
          <td height="20" valign="top"><a href="logout.jsp"><div align="center">【退出登录】</div></a></td>
          </tr>
          
          
          <tr><td height="20"></td></tr>
          <tr>
          
          <!-- 显示相册名 -->
          
    
      </table></td>
      <td width="10" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr>
          <td width="10" height="1139">&nbsp;</td>
          </tr>
      </table></td>
      <td width="790" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCCFF">
        <!--DWLayoutTable-->
        <tr>
          <td width="790" height="50" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
        <tr>
          <td height="300" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!--DWLayoutTable-->
            
             <% 
             int UserID=0;
            	  UserID=(Integer)session.getAttribute("UserID");
             album.setUserID(UserID);
            ResultSet rs1=album.show_users_Album();
            int AlbumID=0;
            while(rs1.next()){
            	AlbumID=rs1.getInt("AlbumID"); //获取相册索引号
                photo.setAlbumID(AlbumID); //设置Photo相册中的AlbumID
            ResultSet rs=photo.get_photo();
                if(rs.next()){
            %>
<!-- Save for Web Slices (未命名.jpg) -->
<table id="__01" width="300" height="292" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="../images/i01.gif" width="300" height="72" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="../images/i02.gif" width="73" height="220" alt=""></td>
		<td>
			<a href='personal_photo.jsp?AlbumID=<%=rs.getString("AlbumID") %>' target="_self"><img border="0" src="../userimages/<%=rs.getString("PhotoName") %>" width="199" height="193" alt=""></a></td>
		<td rowspan="2">
			<img src="../images/i04.gif" width="28" height="220" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/i05.gif" width="199" height="27" alt=""></td>
	</tr>
	<tr height="20" align="center">
	<td>相册名：</td>
	<td><%=rs1.getString("AlbumName") %></td>
    </tr>
    <tr height="20" align="center">
	<td><a href='modify_album.jsp?AlbumID=<%=rs1.getInt("AlbumID") %>' target="_self">编辑相册</a></td>&nbsp;
	<td><a href='delete_album.jsp?AlbumID=<%=rs1.getInt("AlbumID") %>' target="_self">删除该相册</a></td>
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
			<a href="error_photo.jsp"><img border="0" src="../images/i03.gif" width="199" height="193" alt=""></a></td>
		<td rowspan="2">
			<img src="../images/i04.gif" width="28" height="220" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/i05.gif" width="199" height="27" alt=""></td>
	</tr>
	<tr height="20" align="center">
	<td>相册名：</td>
	<td><%=rs1.getString("AlbumName") %></td>
    </tr>
    <tr height="20" align="center">
	<td><a href='modify_album.jsp?AlbumID=<%=rs1.getInt("AlbumID") %>' target="_self">编辑相册</a></td>&nbsp;
	<td><a href='delete_album.jsp?AlbumID=<%=rs1.getInt("AlbumID") %>' target="_self">删除该相册</a></td>
	</tr>
	<%
                }
	%>
	<tr>
	<td height="20"></td>
	</tr>
	<%
            }
	%>
	
</table></td>
          </tr>
    
      </table></td>
    </tr>
  </table>
</div>
<%
}else{
	out.println("<div align=center><h1><font color=red>你还没有登录，请登录！</font></h1></div>");
	response.setHeader("refresh","3;url=../index.jsp");
}
%>
</body>
</html>
