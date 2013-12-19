<%@page contentType="text/html;charset=gb2312" language="java"%>
<html>
<head>
<title>管理员页面</title>
</head>
<body>
<div align="center">
<h1>管理员页面</h1>
<a href="albumtype_management.jsp">管理相册类型</a>&nbsp;&nbsp;
<a href="../normal/myalbum.jsp">管理相册</a>&nbsp;&nbsp;
<a href="user_management.jsp">管理会员</a>&nbsp;&nbsp;
欢迎你：<%=session.getAttribute("user") %>&nbsp;&nbsp;
<a href="logout.jsp">退出</a>
</div>
</body>
</html>