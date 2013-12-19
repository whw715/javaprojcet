<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="users" scope="page" class="photoOnline.Users"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;chatset=gb2312"/>
<title>会员注册</title>
</head>
<script language="javascript">
//验证数字
function IsDigit(cCheck)
{
  return (('0'<=cCheck)&&(cCheck<='9'));
}
//验证字母
function IsAlpha(cCheck)
{
  return ((('a'<=cCheck)&&(cCheck<='z'))||(('A'<=cCheck)&&(cCheck<='Z')))
}
//验证用户名是否全部由数字和字母组成
function IsValid()
{
  var struserName=id.user.value;
for(nIndex=0;nIndex<struserName.length;nIndex++)
{
  cCheck=struserName.charAt(nIndex);
  if(!(IsDigit(cCheck)||IsAlpha(cCheck)))
  {
  return false;
  }
  }
  return true;
 }
 
 //验证年龄是否为数
 function IsNum()
{
  var lage=id.age.value;
for(nIndex=0;nIndex<lage.length;nIndex++)
{
  cCheck=lage.charAt(nIndex);
  if(!(IsDigit(cCheck)))
  {
  return false;
  }
  }
  return true;
 }
 
//验证邮箱格式是否正确
function IsEmail(str){
return str.search(/[\w\-]{1,}@[\w\-]{1,}\.[\w\-]{1,}/)==0?true:false
}
function check(){
var user=id.user.value;
var password=id.password.value;
var cpassword=id.cpassword.value;
var email=id.email.value;
if(user==""){
alert("用户名不能为空！");
return false;
}
if(!IsValid())
{
alert("用户名只能使用字母和数字");
return false;
}
if(password==""){
alert("密码不能为空！");
return false;
}
if(cpassword!=password){
alert("两次输入的密码不一致！");
return false;
}
if(email==""){
alert("邮箱不能为空！");
return false;
}
if(!IsEmail(email)){
alert("请填写有效的Email地址！");
return false;
}
else{
return true;
}
}
</script>
<body bgcolor="#E4E8BB">
<div align="center">
<h1>用户注册</h1>
<form action="user_reg_save.jsp" name="id" method="get" onSubmit="return check()">
<table>
<tr>
<td  bgcolor="#EFEFEF" align="right">请输入用户名：</td>
<td>
<input type="text" name="user" style="height:22px" style="width:152px"/>
<font color="red">*</font><br/>
<font color="red">用户名只能由字母和数字组成</font>
</td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">请输入密码：</td><td>
<input type="password" name="password" style="width:152px" style="height:22px"/><font color="red"> *</font></td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">请再次输入密码：</td>
<td><input type="password" name="cpassword" style="width:152px" style="height:22px"/><font color="red"> *</font></td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">请输入Email地址：</td>
<td><input type="text" name="email" style="width:152px" style="height=22px"/><font color="red"> *</font></td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">请输入验证码：</td>
<td><input type="text" name="Rand" maxlength="4" size="4"/>
<font color="red"> *</font>&nbsp;
<img border=0 src="image.jsp"/>
</td>
</tr>
</table>
<p><input type="submit" value="提交" />
<input type="reset" value="重置"/></P>     
</form>
</div>
</body>
