<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="users" scope="page" class="photoOnline.Users"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;chatset=gb2312"/>
<title>��Աע��</title>
</head>
<script language="javascript">
//��֤����
function IsDigit(cCheck)
{
  return (('0'<=cCheck)&&(cCheck<='9'));
}
//��֤��ĸ
function IsAlpha(cCheck)
{
  return ((('a'<=cCheck)&&(cCheck<='z'))||(('A'<=cCheck)&&(cCheck<='Z')))
}
//��֤�û����Ƿ�ȫ�������ֺ���ĸ���
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
 
 //��֤�����Ƿ�Ϊ��
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
 
//��֤�����ʽ�Ƿ���ȷ
function IsEmail(str){
return str.search(/[\w\-]{1,}@[\w\-]{1,}\.[\w\-]{1,}/)==0?true:false
}
function check(){
var user=id.user.value;
var password=id.password.value;
var cpassword=id.cpassword.value;
var email=id.email.value;
if(user==""){
alert("�û�������Ϊ�գ�");
return false;
}
if(!IsValid())
{
alert("�û���ֻ��ʹ����ĸ������");
return false;
}
if(password==""){
alert("���벻��Ϊ�գ�");
return false;
}
if(cpassword!=password){
alert("������������벻һ�£�");
return false;
}
if(email==""){
alert("���䲻��Ϊ�գ�");
return false;
}
if(!IsEmail(email)){
alert("����д��Ч��Email��ַ��");
return false;
}
else{
return true;
}
}
</script>
<body bgcolor="#E4E8BB">
<div align="center">
<h1>�û�ע��</h1>
<form action="user_reg_save.jsp" name="id" method="get" onSubmit="return check()">
<table>
<tr>
<td  bgcolor="#EFEFEF" align="right">�������û�����</td>
<td>
<input type="text" name="user" style="height:22px" style="width:152px"/>
<font color="red">*</font><br/>
<font color="red">�û���ֻ������ĸ���������</font>
</td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">���������룺</td><td>
<input type="password" name="password" style="width:152px" style="height:22px"/><font color="red"> *</font></td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">���ٴ��������룺</td>
<td><input type="password" name="cpassword" style="width:152px" style="height:22px"/><font color="red"> *</font></td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">������Email��ַ��</td>
<td><input type="text" name="email" style="width:152px" style="height=22px"/><font color="red"> *</font></td>
</tr>
<tr>
<td bgcolor="#EFEFEF" align="right">��������֤�룺</td>
<td><input type="text" name="Rand" maxlength="4" size="4"/>
<font color="red"> *</font>&nbsp;
<img border=0 src="image.jsp"/>
</td>
</tr>
</table>
<p><input type="submit" value="�ύ" />
<input type="reset" value="����"/></P>     
</form>
</div>
</body>
