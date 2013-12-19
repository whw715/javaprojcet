//���ݿ������
package photoOnline;
import java.sql.*;
public class Execute_DB extends Open_DB {
//���ݿ����Ӷ���
private Connection conn;
private Statement stmt;
private ResultSet rs;
//���������0=�޴���-1�д���
private int errNum;
//error ���� ������Ϣ
private String errDesc;
//��ʼ������
public Execute_DB(){
	conn=super.getConn();
	stmt=null;
	rs=null;
	errNum=0;
	errDesc="";
}
//ִ��sqlִ����䣬��Ҫ��ִ�в����ɾ����SQL���
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
//ִ��sql��ѯ���
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
//ȡ�ô������
public int getErrNum(){
	return errNum;
}
//ȡ�ô�����Ϣ
public String getErrDesc(){
	return errDesc;
}
}
