//���ݿ������
package photoOnline;
import java.sql.*;
public class Open_DB {
//���ݿ��û���
String user="root";
//���ݿ�����
String password="root";
//�������ӵ����ݿ�ĵ�ַ
String url="jdbc:mysql://localhost:3306/photos";
//���ݿ�����Ӷ���
Connection conn;
//�洢������Ϣ�ı���
String errDesc;
//��ʼ����Ա����
public Open_DB(){
	conn=null;
}
//�������ݿ⣬����һ��Connection���Ͷ���
public Connection getConn(){
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,password);
	}catch(Exception e){
		conn=null;
		errDesc=e.toString();
	}
	return conn;
}
public String getErrDesc(){
	return errDesc;
}
}
