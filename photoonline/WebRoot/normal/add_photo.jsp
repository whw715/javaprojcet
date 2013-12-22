<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="org.lxh.smart.*" %>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>图片信息上传</title>
</head><style>
body{ background:url(../images/13.jpg) repeat-x center top;}
</style>
<% 
try{
//新建一个smartUpload对象
SmartUpload su=new SmartUpload();
//上传初始化
su.initialize(pageContext); //pageContext为jsp页面内置对象
//设置上传限制
//限制每个上传文件的最大长度
su.setMaxFileSize(1000000);
//限制总上传数据的长度
su.setTotalMaxFileSize(4000000);
//设定允许上传的文件（通过扩展名限制），仅允许doc，txt文件
su.setAllowedFilesList("gif,jpg");
//设定禁止上传的文件（通过扩展名限制），禁止上传带有exe，bat，jsp，htm，html扩展名的文件和没有扩展名的文件
su.setDeniedFilesList("doc,txt,log,exe,bat,jsp,htm,html,,");
//上传文件
su.upload();
String s_AlbumID=su.getRequest().getParameter("AlbumID");
int AlbumID=Integer.parseInt(s_AlbumID);
String PhotoCon=su.getRequest().getParameter("PhotoCon");
String PhotoName="00000000000000.gif";
//判断是否有附件上传
org.lxh.smart.File file=su.getFiles().getFile(0);
if(!file.isMissing()){
String s_Pic=file.getFileName();
//将附件以  当前时间+附件扩展名  作为文件名保存
java.text.SimpleDateFormat dateFormatter=new java.text.SimpleDateFormat("yyyyMMddHHmmss");
String s_NowTime=dateFormatter.format(new java.util.Date());
PhotoName=s_NowTime+"."+file.getFileExt();
file.saveAs("./userimages/"+PhotoName);
}
System.out.println(AlbumID+" "+PhotoCon+" "+PhotoName);
//将文件信息保存到数据库中
photo.setAlbumID(AlbumID);
photo.setPhotoDes(PhotoCon);
photo.setPhotoName(PhotoName);
if(photo.add_Photo()){
out.println("<h1><p align=center>图片信息发布成功</p></h1>");
response.setHeader("refresh","3;url=users.jsp");
}
else{
out.println("<p align=center>图片信息发布失败，请重试</p>");
out.println("<div align=center><input type=button value=返回 onClick='window.history.go(-1)'></div>");
return;
}
}catch(Exception e){
out.println(e.toString());
out.println("<p align=center><font color=red>只能上传图片格式扩展名为（gif，jpg）的文件</font></p>");
out.println("<div align=center><input type=button value=返回 onClick='window.history.go(-1)'></div>");
return;
}
%>
</body>
</html>