<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.util.*,javax.mail.*,javax.mail.internet.*,photoOnline.*"%>
<jsp:useBean scope="page" id="users" class="photoOnline.Users"/>
<html>
<head>
<title>��ӭ���ٵ������</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312"/>
</head>
<body>
<% 
//��ȡ������ȡ������û���
String UserName="";
UserName=request.getParameter("user");
//�����û�����ȡ�û���Ϣ
if(users.init(UserName)){
	try{
		//��html���н����ʼ���Ϣ
		String str_to=users.getEmail();
		String str_title="��ȡ����";
		String str_content="<p>���ڵ��������û����ǣ�<i>"+UserName+"</i></p>";
		str_content=str_content+"<p>���ڵ������������ǣ�<i>"+users.getUserPassword()+"</i></p>";
		//�����ʼ��Ự��Ҳ������Properties props=System.getProperties();
		Properties props=new Properties();
		//�����ʼ��Ự
		props.put("mail.smtp.host","smtp.sohu.com");
		props.put("mail.smtp.auth","true");
		Session s=Session.getInstance(props);
		/*
		Session���Ự�ࣩ����javax.mail.Session��ʹ���ʼ�����ʱ�����Ƚ����ʼ��Ự Session��Ķ���
		�����������������ʼ�����ʵ���ʼ����������ݵķ�װ����ָ���ʼ���������֤�Ŀͻ������ԡ�
		��1��getDefaultInstance()
		����ԭ�����£�
		public static Session Session.getDefaultInstance(java.util.Properties 
		props)
		��
		public static Session Session.getDefaultInstance(java.util.Properties 
		props, Authenticator authenticator)
		����������������Ŀͻ�����صĻỰ���󡣲���Props�����Զ��󣬼̳���HashTable����ϣ�����򵥵�˵���Ǽ���ֵ�ԣ�
		����authenticator�������ʼ���֤����
		��2��getInstance()
		����ԭ�����£�
		public static Session Session.getInstance(java.util.Properties props)
		��
		public static Session Session.getInstance(java.util.Properties props, 
		Authenticator authenticator)
		�˷����������ǹ����͵ĻỰ���󣬵�����ʽ��getDefaultInstance()�������ơ�
		*/
		s.setDebug(true);
		MimeMessage message=new MimeMessage(s);
		/*
		MimeMessage���ʼ���Ϣ�ࣩ����javax.mail.internet.MimeMessage�����̳��Գ����� javax.mail.Message��MimeMessage
		��һ���ڲ���Recipient�࣬��javax.mail.internet. MimeMessage.Recipient����ʾ�ʼ���Ϣ�Ľ����ߡ��������һ������to
		��ʾ�����ߣ��������ʼ��������ַ��MimeMessage�ೣ�õķ���������ʾ��
		��1�����캯��
		����ԭ�����£�
		public MimeMessage(Session session)
		���캯���������ʼ���Ϣ����󡣲���session���ʼ��Ự���������������ʼ���Ϣ�������ʼ��Ự����
        */
        //����Ϣ�������÷�����/�ռ���/����/����ʱ��
        InternetAddress from=new InternetAddress("limaoyuan@sohu.com"); //������
        message.setFrom(from);
        InternetAddress to=new InternetAddress(str_to);
        message.setRecipient(Message.RecipientType.TO,to); //�����ռ������ַ���޷���ֵ��
        message.setSubject(str_title); //�����ʼ���Ϣ����
        message.setSentDate(new java.util.Date());
        //����Ϣ������������
        //�½�һ������ż����ݵ�BodyPart����
        BodyPart mdp=new MimeBodyPart();
        //��BodyPart�����������ݺ͸�ʽ�ı��뷽ʽ
        mdp.setContent(str_content,"text/html;charset=gb2312");
        //�½�һ��MimeMultipart�����������BodyPart����(��ʵ�Ͽ��Դ�Ŷ��)
        Multipart mm=new MimeMultipart();
        //��BodyPart���뵽MimeMultipart�����У����Լ�����BodyPart��
        mm.addBodyPart(mdp);
        //��mm��Ϊ��Ϣ���������
        message.setContent(mm);
        message.saveChanges();
        Transport transport=s.getTransport("smtp");
        //��smtp��ʽ��¼���䣬��һ�������Ƿ����ʼ��õ��ʼ�������SMTP��ַ���ڶ�������Ϊ�û���������������Ϊ����
        transport.connect("smtp.sohu.com","limaoyuan","542184118123");
        transport.sendMessage(message,message.getAllRecipients());
        /*
                   ��3��getAllRecipients()
                     ����ԭ�����£�
        public Address[] MimeMessageObjectName.getAllRecipients()
                    �õ����е��ռ��䡣����������һ��Address��������
        */
        transport.close();
        %>
        <br>
        <p align="center">��������Ѿ����͵�: <font color="#FF0000"> <%=str_to %></font></p>
        <p align="center"><input type="button" name="btn" value="�رմ���" onClick="javascript:window.close()"/></p>
        <% 
        }catch(MessagingException e){
        out.println("<br><p align=center><h1><font color=red>���뷢��ʧ�ܣ�</font></h1></p>");
        out.println("<center><input type=button name=goback value=����  onclick=javascript:window.history.go(-1)></center>");
        }
        }else{
        out.println("<br><p align=center><font size=4 color=red>���û������ڣ�</font></p>");
        out.println("<p align=center><input type=button name=goback1 value=���� onclick=javascript:window.history.go(-1)></p>");
        }
        %>
        </body>
        </html>

