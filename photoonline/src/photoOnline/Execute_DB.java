//数据库操作类
package photoOnline;
import java.sql.*;
public class Execute_DB extends Open_DB {
//数据库连接对象
private Connection conn;
private Statement stmt;
private ResultSet rs;
//描述错误号0=无错误，-1有错误
private int errNum;
//error 描述 错误信息
private String errDesc;
//初始化操作
public Execute_DB(){
	conn=super.getConn();
	stmt=null;
	rs=null;
	errNum=0;
	errDesc="";
}
//执行sql执行语句，主要是执行插入和删除的SQL语句
public boolean exeSql(String strSql){
	try{
		stmt=conn.createStatement();
		stmt.executeUpdate(strSql);
		stmt.close();
		return true;
	}catch(Exception e){
		this.errNum=-1;
		this.errDesc=e.toString();
		return false;
	}
}
//执行sql查询语句
public ResultSet exeSqlQuery(String strSql){
	try{
		stmt=conn.createStatement();
		rs=stmt.executeQuery(strSql);
	}catch(Exception e){
		this.errNum=-1;
		this.errDesc=e.toString();
		rs=null;
	}
	return rs;
}
//取得错误号码
public int getErrNum(){
	return errNum;
}
//取得错误信息
public String getErrDesc(){
	return errDesc;
}
}
