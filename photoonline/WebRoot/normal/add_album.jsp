<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<jsp:useBean scope="page" id="users" class="photoOnline.Users"/>
<html>
<head>
<title>�������</title>
</head><style>
body{ background:url(images/13.jpg) repeat-x center top;}
</style>
<body>
<% 
try{
String UserName=(String)session.getAttribute("user"); //��ȡ�û���
int AlbumTypeID=Integer.parseInt(request.getParameter("AlbumTypeID")); //��ȡ�������������
int UserID=users.getID(UserName); //��ȡ�û�������
String AlbumName=request.getParameter("AlbumName"); //��ȡ�������
String AlbumCon=request.getParameter("AlbumCon"); //��ȡ�������
album.setAlbumTypeID(AlbumTypeID);
album.setUserID(UserID);
album.setAlbumName(AlbumName); //�����������
album.setAlbumCon(AlbumCon); //�����������
System.out.println(AlbumName+" "+AlbumCon+" "+UserID+" "+AlbumTypeID);
if(album.add_Album()){
	out.println("<div align=center><h1>�½����ɹ���3����Զ���ת��������ҳ</h1></div>");
	response.setHeader("refresh","3;url=users.jsp");
}else{
	out.println("<div align=center><h1><font color=red>�½����ʧ�ܣ�3����Զ���ת��������ҳ</font></h1></div>");
	response.setHeader("refresh","3;url=users.jsp");
}
}catch(Exception e){
	out.println("<div align=center><font color=red>session��ȡʧ�ܣ�</font></div>");
	}
%>
</body>
</html>