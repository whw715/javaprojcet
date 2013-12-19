package photoOnline;

import java.sql.*;
import java.text.SimpleDateFormat;

public class Users extends Execute_DB {
	private int UserID;
    private String UserName;
    private String UserPassword;
    private String Email;
    private int SysRole;
    private String CreateTime;
    //ִ�и��ֲ�����sql���
    private String strSql;
    //ʱ���ʽ
    private SimpleDateFormat timeFormatter;
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserPassword() {
		return UserPassword;
	}
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getSysRole() {
		return SysRole;
	}
	public void setSysRole(int sysRole) {
		SysRole = sysRole;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
    
	//��ʼ�����Ա����
	public Users(){
		this.UserID=0;
		this.UserName="";
		this.UserPassword="";
		this.SysRole=0;
		this.Email="";
		timeFormatter=new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		this.CreateTime=timeFormatter.format(new java.util.Date());
		this.strSql="";
	}
	//��Users���ݱ������һ���¼�¼
	public boolean add_user(){
		System.out.println(this.UserName+" "+this.UserPassword+" "+this.CreateTime+" "+this.Email+" "+this.SysRole);
		
		this.strSql="insert into users(UserName,UserPassword,CreateTime,Email,SysRole)values"+
		"('"+this.UserName+"','"+this.UserPassword+"','"+this.CreateTime+"','"+this.Email+"','"+this.SysRole+"')";
		boolean isAdd=super.exeSql(this.strSql);
		return isAdd;
	}
	//��֤�û���������û������Ϣ�Ƿ���ȷ
	public boolean user_valid(){
		this.strSql="select UserID,UserName,SysRole from Users where UserName='"+this.UserName+"' and UserPassword='"+this.UserPassword+"' and SysRole='"+this.SysRole+"'";
		ResultSet rs=super.exeSqlQuery(this.strSql);
		try{
		if(rs.next()){
			this.UserID=rs.getInt("UserID");
			this.UserName=rs.getString("UserName");
			this.SysRole=rs.getInt("SysRole");
			return true;
		}else{
			return false;
		}
		}catch(Exception e){
			return false;
		}
	}
	//ɾ���û���Ϣ
	public boolean delete_user(String DeleteID){
		this.strSql="delete from Users where UserID in ("+DeleteID+")";
		boolean isDelete=super.exeSql(this.strSql);
		return isDelete;
	}
	
	//�ж��û����Ƿ����
	public boolean is_exist(){
		this.strSql="select * from Users where UserName='"+this.UserName+"'";
		try{
			ResultSet rs=super.exeSqlQuery(this.strSql);
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			return false;
		}
	}
	//�޸����Ա����UserID��Ӧ���û���Ϣ
	public boolean modify_info(){
		this.strSql="update Users set Email='"+this.Email+"',UserPassword='"+this.UserPassword+"' where UserID='"+this.UserID+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
	//��ȡ��UserName��Ӧ���û���Ϣ
	public boolean init(String UserName){
		this.strSql="select * from users where UserName='"+UserName+"'";
		try{
			ResultSet rs=super.exeSqlQuery(this.strSql);
			if(rs.next()){
				this.UserID=rs.getInt("UserID");
				this.UserName=rs.getString("UserName");
				this.UserPassword=rs.getString("UserPassword");
				this.CreateTime=rs.getString("CreateTime");
				this.Email=rs.getString("Email");
				this.SysRole=rs.getInt("SysRole");
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			return false;
		}
	}
	//��ȡ������ͨ�û���Ϣ��������һ��ResultSet���Ͷ���
	public ResultSet show_users(){
		this.strSql="select * from Users where SysRole='"+this.SysRole+"'";
		ResultSet rs=null;
		try{
			rs=super.exeSqlQuery(this.strSql);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return rs;
	}
	
	//ͨ���û����ƻ�ȡ�û�ID
	public int getID(String UserName){
		this.strSql="select UserID from Users where UserName='"+UserName+"'";
		int UserID=0;
		try{
			ResultSet rs=super.exeSqlQuery(this.strSql);
			if(rs.next()){
				UserID=rs.getInt("UserID");
			}else{
				return UserID;
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return UserID;
	}
	
}
