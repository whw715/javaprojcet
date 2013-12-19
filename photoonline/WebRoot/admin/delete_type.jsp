<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="albumtype" class="photoOnline.Album_Type"/>
<html>
<head>
<title>删除图片类别</title>
</head>
<body>
<% 

String deleteID[]=request.getParameterValues("DeleteID");
String DeletetypeID="0";
if(deleteID!=null){
for(int i=0;i<deleteID.length;i++){
DeletetypeID=DeletetypeID+","+deleteID[i];
}
System.out.println(DeletetypeID);
if(albumtype.delete_Type(DeletetypeID)){
out.println("<div align=center><h1>删除图片类别成功！</h1></div>");
response.setHeader("refresh","3;url=albumtype_management.jsp");
}
else{
out.println("<div align=center><font color=red><h1>删除不成功！</h1></font></div>");
response.setHeader("refresh","3;url=albumtype_management.jsp");
}
}else{
out.println("<div align=center><h1><font color=red>你删除的内容为空，请重试！</font></h1></div>");
response.setHeader("refresh","3;url=albumtype_management.jsp");
}

%>
</body>
</html>