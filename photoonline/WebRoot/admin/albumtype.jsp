<%@page contentType="text/html;charset=gb2312"%>
<html>
<head>
<title>添加相册类型</title>
<script type="text/javascript">
function check(){
	var AlbumType=id.AlbumType.value;
	if(AlbumType==""){
		alert("相片类型不能为空！");
		return false;
	}else{
		return true;
}
</script>
</head>
<body>
<div align="center">
<form action="add_type.jsp" name="id" method="post" onclick="return check()">
<br/>
<br/>
<br/>
<h1>添加相片类型</h1>
<table>
<tr>
<td>相片类型：<input type="text" name="AlbumType"/>&nbsp;&nbsp;
<input type="submit" value="添加"/>&nbsp;&nbsp;
<input type="button" value="返回主页"  onClick="window.open('albumtype_management.jsp','_blank')"/>
</td>
</tr>
</table>
</form>

</div>
</body>
</html>