<%@page contentType="text/html;charset=gb2312" language="java"%>
<%
	//ʹsessionʧЧ
	session.invalidate();
	//��ת����½ҳ��
	response.sendRedirect("../index.jsp");
%>