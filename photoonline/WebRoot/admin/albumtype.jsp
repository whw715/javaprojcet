<%@page contentType="text/html;charset=gb2312"%>
<html>
<head>
<title>����������</title>
<script type="text/javascript">
function check(){
	var AlbumType=id.AlbumType.value;
	if(AlbumType==""){
		alert("��Ƭ���Ͳ���Ϊ�գ�");
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
<h1>�����Ƭ����</h1>
<table>
<tr>
<td>��Ƭ���ͣ�<input type="text" name="AlbumType"/>&nbsp;&nbsp;
<input type="submit" value="���"/>&nbsp;&nbsp;
<input type="button" value="������ҳ"  onClick="window.open('albumtype_management.jsp','_blank')"/>
</td>
</tr>
</table>
</form>

</div>
</body>
</html>