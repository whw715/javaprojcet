<%@page contentType="text/html;charset=gb2312" language="java" import="java.sql.*,java.util.*"%>
<html>
<head>
<title>用户登录</title>
<style type="text/css">
<!--
a:link {
	color: #000099;
}
a:visited {
	color: #330099;
}
a:hover {
	color: #990099;
}
a:active {
	color: #990066;
}
-->
</style>
</head>
<body bgcolor="#E4E8BB">
<div align="center">
<form action="normal/user_login_check.jsp" method="post" name="form1">
<a href="normal/users.jsp"><font size="4">【个人主页】</font></a><br/>
<a href="normal/show_album.jsp"><font size="4">【查看所有相册】</font></a>
<table width="240" height="100">
<tr>
<td align="right">用户名：</td>
<td><input type="text" name="user" sytle="width:152px" style="height:22px"/></td>
</tr>
<tr>
<td align="right">密码：</td>
<td><input type="password" name="password" style="width:152px" style="height:22px"/></td>
</tr>
<tr>
<td align="right">类型：</td>
<td>
<input type="radio" value="0" name="sysRole" checked="checked"/>普通用户
<input type="radio" value="1" name="sysRole"/>管理员
</td>
</tr>
</table>
&nbsp;&nbsp;<input type="submit" value="登录"/>&nbsp;&nbsp;
<input type="button" value="注册" onclick="window.open('normal/user_reg.jsp','_blank')"/>&nbsp;&nbsp;
<input type="button" value="忘记密码" onclick="window.open('normal/get_userPassword_form.jsp','_blank')"/>
</form>
</div>
</body>
</html>