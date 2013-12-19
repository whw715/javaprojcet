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
    //执行各种操作的sql语句
    private String strSql;
    //时间格式
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
    
	//初始化类成员变量
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
	//向Users数据表中添加一条新记录
	public boolean add_user(){
		System.out.println(this.UserName+" "+this.UserPassword+" "+this.CreateTime+" "+this.Email+" "+this.SysRole);
		
		this.strSql="insert into users(UserName,UserPassword,CreateTime,Email,SysRole)values"+
		"('"+this.UserName+"','"+this.UserPassword+"','"+this.CreateTime+"','"+this.Email+"','"+this.SysRole+"')";
		boolean isAdd=super.exeSql(this.strSql);
		return isAdd;
	}
	//验证用户、密码和用户身份信息是否正确
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
	//删除用户信息
	public boolean delete_user(String DeleteID){
		this.strSql="delete from Users where UserID in ("+DeleteID+")";
		boolean isDelete=super.exeSql(this.strSql);
		return isDelete;
	}
	
	//判断用户名是否存在
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
	//修改类成员变量UserID对应的用户信息
	public boolean modify_info(){
		this.strSql="update Users set Email='"+this.Email+"',UserPassword='"+this.UserPassword+"' where UserID='"+this.UserID+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
	//获取类UserName对应的用户信息
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
	//获取所有普通用户信息，并返回一个ResultSet类型对象
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
	
	//通过用户名称获取用户ID
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
