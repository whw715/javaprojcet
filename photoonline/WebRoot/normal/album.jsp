<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="java.sql.*" %>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>创建相册</title>
<script language="javascript">
function check(){
	var AlbumTypeID=id.AlbumTypeID.value;
	var AlbumName=id.AlbumName.value;
	if(AlbumTypeID==""){
		alert("相册类型不能为空！");
		return false;
	}
	if(AlbumName==""){
		alert ("相册名不能为空！");
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
//获取用户角色信息
int SysRole=-1;
try{
SysRole=(Integer)session.getAttribute("SysRole");
}catch(Exception e){}
//判断当前访问用户是否是普通用户
if(SysRole==0){
	
%>
<div align="center">
<h1>创建新相册</h1>
<form action="add_album.jsp" name="id" method="post" onSubmit="return check()">
<table>
<tr>
<td align="center">相册类型：</td>
<td>
<select name="AlbumTypeID">
<option selected>--请选择--</option>
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
</select><font color="red">(必填）</font>
</td>
</tr>
<tr>
<td align="center">相册名：</td>
<td><input type="text" name="AlbumName" width="200"/><font color="red">(必填）</font></td>
</tr>
<tr>
<td align="center">简介：</td>
<td><textarea name="AlbumCon" cols="70" rows="10"></textarea></td>
</tr>
</table>
<input type="submit" value="提交"/>&nbsp;&nbsp;
<input type="button" value="重置"/>
</div>
</form>
<% 
}else{
	out.println("<div align=center><h1><font color=red>你无权进行次操作，请登录！</font></h1></div>");
	response.setHeader("refresh","3;url=../user_login.jsp");
}
%>
</body>
</html>