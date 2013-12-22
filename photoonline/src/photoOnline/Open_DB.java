//数据库的连接
package photoOnline;
import java.sql.*;
public class Open_DB {
//数据库用户名
String user="root";
//数据库密码
String password="123456";
//所以连接的数据库的地址
String url="jdbc:mysql://localhost:3306/photos";
//数据库的连接对象
Connection conn;
//存储错误信息的变量
String errDesc;
//初始化成员变量
public Open_DB(){
	conn=null;
}
//连接数据库，返回一个Connection类型对象
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
