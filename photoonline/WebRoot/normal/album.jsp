<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>�������</title>
<script language="javascript">
function check(){
	var AlbumTypeID=id.AlbumTypeID.value;
	var AlbumName=id.AlbumName.value;
	if(AlbumTypeID==""){
		alert("������Ͳ���Ϊ�գ�");
		return false;
	}
	if(AlbumName==""){
		alert ("���������Ϊ�գ�");
		return false;
	}
	else{
		return true;
	}
}
</script>
</head>
<body bgcolor="#e4e8ef">
<% 
//��ȡ�û���ɫ��Ϣ
int SysRole=-1;
try{
SysRole=(Integer)session.getAttribute("SysRole");
}catch(Exception e){}
//�жϵ�ǰ�����û��Ƿ�����ͨ�û�
if(SysRole==0){
	
%>
<div align="center">
<h1>���������</h1>
<form action="add_album.jsp" name="id" method="post" onSubmit="return check()">
<table>
<tr>
<td align="center">������ͣ�</td>
<td>
<select name="AlbumTypeID">
<option selected>--��ѡ��--</option>
<% 
ResultSet rs=albumtype.show_Type();
while(rs.next()){
	int albumtypeid=rs.getInt("AlbumTypeID");
	String AlbumType=rs.getString("AlbumType");
%>
<option value="<%=albumtypeid %>"><%=AlbumType %></option>
<%
}
%>
</select><font color="red">(���</font>
</td>
</tr>
<tr>
<td align="center">�������</td>
<td><input type="text" name="AlbumName" width="200"/><font color="red">(���</font></td>
</tr>
<tr>
<td align="center">��飺</td>
<td><textarea name="AlbumCon" cols="70" rows="10"></textarea></td>
</tr>
</table>
<input type="submit" value="�ύ"/>&nbsp;&nbsp;
<input type="button" value="����"/>
</div>
</form>
<% 
}else{
	out.println("<div align=center><h1><font color=red>����Ȩ���дβ��������¼��</font></h1></div>");
	response.setHeader("refresh","3;url=../user_login.jsp");
}
%>
</body>
</html>