<%@page contentType="text/html;charset=gb2312" language="java"%>
<%@page import="org.lxh.smart.*" %>
<jsp:useBean scope="page" id="photo" class="photoOnline.Photo"/>
<html>
<head>
<title>ͼƬ��Ϣ�ϴ�</title>
</head>
<body bgcolor="#F4FFFFE">
<% 
try{
//�½�һ��smartUpload����
SmartUpload su=new SmartUpload();
//�ϴ���ʼ��
su.initialize(pageContext); //pageContextΪjspҳ�����ö���
//�����ϴ�����
//����ÿ���ϴ��ļ�����󳤶�
su.setMaxFileSize(1000000);
//�������ϴ����ݵĳ���
su.setTotalMaxFileSize(4000000);
//�趨�����ϴ����ļ���ͨ����չ�����ƣ���������doc��txt�ļ�
su.setAllowedFilesList("gif,jpg");
//�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�����ֹ�ϴ�����exe��bat��jsp��htm��html��չ�����ļ���û����չ�����ļ�
su.setDeniedFilesList("doc,txt,log,exe,bat,jsp,htm,html,,");
//�ϴ��ļ�
su.upload();
String s_AlbumID=su.getRequest().getParameter("AlbumID");
int AlbumID=Integer.parseInt(s_AlbumID);
String PhotoCon=su.getRequest().getParameter("PhotoCon");
String PhotoName="00000000000000.gif";
//�ж��Ƿ��и����ϴ�
org.lxh.smart.File file=su.getFiles().getFile(0);
if(!file.isMissing()){
String s_Pic=file.getFileName();
//��������  ��ǰʱ��+������չ��  ��Ϊ�ļ�������
java.text.SimpleDateFormat dateFormatter=new java.text.SimpleDateFormat("yyyyMMddHHmmss");
String s_NowTime=dateFormatter.format(new java.util.Date());
PhotoName=s_NowTime+"."+file.getFileExt();
file.saveAs("./userimages/"+PhotoName);
}
System.out.println(AlbumID+" "+PhotoCon+" "+PhotoName);
//���ļ���Ϣ���浽���ݿ���
photo.setAlbumID(AlbumID);
photo.setPhotoDes(PhotoCon);
photo.setPhotoName(PhotoName);
if(photo.add_Photo()){
out.println("<h1><p align=center>ͼƬ��Ϣ�����ɹ�</p></h1>");
response.setHeader("refresh","3;url=users.jsp");
}
else{
out.println("<p align=center>ͼƬ��Ϣ����ʧ�ܣ�������</p>");
out.println("<div align=center><input type=button value=���� onClick='window.history.go(-1)'></div>");
return;
}
}catch(Exception e){
out.println(e.toString());
out.println("<p align=center><font color=red>ֻ���ϴ�ͼƬ��ʽ��չ��Ϊ��gif��jpg�����ļ�</font></p>");
out.println("<div align=center><input type=button value=���� onClick='window.history.go(-1)'></div>");
return;
}
%>
</body>
</html>