<%@page contentType="text/html;charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="album" class="photoOnline.Album"/>
<jsp:useBean scope="page" id="users" class="photoOnline.Users"/>
<html>
<head>
<title>创建相册</title>
</head><style>
body{ background:url(images/13.jpg) repeat-x center top;}
</style>
<body>
<% 
try{
String UserName=(String)session.getAttribute("user"); //获取用户名
int AlbumTypeID=Integer.parseInt(request.getParameter("AlbumTypeID")); //获取相册类型索引号
int UserID=users.getID(UserName); //获取用户索引号
String AlbumName=request.getParameter("AlbumName"); //获取相册名称
String AlbumCon=request.getParameter("AlbumCon"); //获取相册内容
album.setAlbumTypeID(AlbumTypeID);
album.setUserID(UserID);
album.setAlbumName(AlbumName); //设置相册名称
album.setAlbumCon(AlbumCon); //设置相册内容
System.out.println(AlbumName+" "+AlbumCon+" "+UserID+" "+AlbumTypeID);
if(album.add_Album()){
	out.println("<div align=center><h1>新建相册成功！3秒后将自动跳转到个人主页</h1></div>");
	response.setHeader("refresh","3;url=users.jsp");
}else{
	out.println("<div align=center><h1><font color=red>新建相册失败！3秒后将自动跳转到个人主页</font></h1></div>");
	response.setHeader("refresh","3;url=users.jsp");
}
}catch(Exception e){
	out.println("<div align=center><font color=red>session获取失败！</font></div>");
	}
%>
</body>
</html>