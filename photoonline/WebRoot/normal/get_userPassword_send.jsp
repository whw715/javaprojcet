<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.util.*,javax.mail.*,javax.mail.internet.*,photoOnline.*"%>
<jsp:useBean scope="page" id="users" class="photoOnline.Users"/>
<html>
<head>
<title>欢迎光临电子相册</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312"/>
</head>
<body>
<% 
//获取所以索取密码的用户名
String UserName="";
UserName=request.getParameter("user");
//根据用户名获取用户信息
if(users.init(UserName)){
	try{
		//从html表单中接收邮件信息
		String str_to=users.getEmail();
		String str_title="获取密码";
		String str_content="<p>你在电子相册的用户名是：<i>"+UserName+"</i></p>";
		str_content=str_content+"<p>你在电子相册的密码是：<i>"+users.getUserPassword()+"</i></p>";
		//建立邮件会话，也可以用Properties props=System.getProperties();
		Properties props=new Properties();
		//建立邮件会话
		props.put("mail.smtp.host","smtp.sohu.com");
		props.put("mail.smtp.auth","true");
		Session s=Session.getInstance(props);
		/*
		Session（会话类），即javax.mail.Session。使用邮件功能时必须先建立邮件会话 Session类的对象。
		这个对象可用来创建邮件对象、实现邮件对象中数据的封装并可指定邮件服务器认证的客户端属性。
		（1）getDefaultInstance()
		方法原型如下：
		public static Session Session.getDefaultInstance(java.util.Properties 
		props)
		或
		public static Session Session.getDefaultInstance(java.util.Properties 
		props, Authenticator authenticator)
		这个方法创建与具体的客户端相关的会话对象。参数Props是属性对象，继承自HashTable（哈希表），简单地说就是键和值对；
		参数authenticator对象是邮件认证对象。
		（2）getInstance()
		方法原型如下：
		public static Session Session.getInstance(java.util.Properties props)
		或
		public static Session Session.getInstance(java.util.Properties props, 
		Authenticator authenticator)
		此方法创建的是共享型的会话对象，调用形式与getDefaultInstance()方法类似。
		*/
		s.setDebug(true);
		MimeMessage message=new MimeMessage(s);
		/*
		MimeMessage（邮件消息类），即javax.mail.internet.MimeMessage。它继承自抽象类 javax.mail.Message。MimeMessage
		有一个内部类Recipient类，即javax.mail.internet. MimeMessage.Recipient，表示邮件消息的接收者。这个类有一个属性to
		表示接收者，即接收邮件的邮箱地址。MimeMessage类常用的方法如下所示。
		（1）构造函数
		方法原型如下：
		public MimeMessage(Session session)
		构造函数可生成邮件消息类对象。参数session是邮件会话对象，是用来建立邮件消息类对象的邮件会话对象。
        */
        //个消息对象设置发件人/收件人/主题/发信时间
        InternetAddress from=new InternetAddress("limaoyuan@sohu.com"); //发件人
        message.setFrom(from);
        InternetAddress to=new InternetAddress(str_to);
        message.setRecipient(Message.RecipientType.TO,to); //设置收件邮箱地址，无返回值。
        message.setSubject(str_title); //设置邮件消息主题
        message.setSentDate(new java.util.Date());
        //给消息对象设置内容
        //新建一个存放信件内容的BodyPart对象
        BodyPart mdp=new MimeBodyPart();
        //给BodyPart对象设置内容和格式的编码方式
        mdp.setContent(str_content,"text/html;charset=gb2312");
        //新建一个MimeMultipart对象用来存放BodyPart对象(事实上可以存放多个)
        Multipart mm=new MimeMultipart();
        //将BodyPart加入到MimeMultipart对象中（可以加入多个BodyPart）
        mm.addBodyPart(mdp);
        //把mm作为消息对象的内容
        message.setContent(mm);
        message.saveChanges();
        Transport transport=s.getTransport("smtp");
        //以smtp方式登录邮箱，第一个参数是发送邮件用的邮件服务器SMTP地址，第二个参数为用户名，第三个参数为密码
        transport.connect("smtp.sohu.com","limaoyuan","542184118123");
        transport.sendMessage(message,message.getAllRecipients());
        /*
                   （3）getAllRecipients()
                     方法原型如下：
        public Address[] MimeMessageObjectName.getAllRecipients()
                    得到所有的收件箱。返回类型是一个Address对象数组
        */
        transport.close();
        %>
        <br>
        <p align="center">你的密码已经发送到: <font color="#FF0000"> <%=str_to %></font></p>
        <p align="center"><input type="button" name="btn" value="关闭窗口" onClick="javascript:window.close()"/></p>
        <% 
        }catch(MessagingException e){
        out.println("<br><p align=center><h1><font color=red>密码发送失败！</font></h1></p>");
        out.println("<center><input type=button name=goback value=返回  onclick=javascript:window.history.go(-1)></center>");
        }
        }else{
        out.println("<br><p align=center><font size=4 color=red>该用户不存在！</font></p>");
        out.println("<p align=center><input type=button name=goback1 value=返回 onclick=javascript:window.history.go(-1)></p>");
        }
        %>
        </body>
        </html>

