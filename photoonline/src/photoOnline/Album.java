package photoOnline;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class Album extends Execute_DB {
	//定义类成员变量
	private int AlbumID; //相册索引号
	private int UserID; //用户索引号
	private int AlbumTypeID; //相册类型索引号
	private String AlbumName; //相册名
	private String CreateTime; //创建相册时间
	private String AlbumCon; //相册简介
	private String strSql;
	
	public int getAlbumID() {
		return AlbumID;
	}


	public void setAlbumID(int albumID) {
		AlbumID = albumID;
	}


	public int getUserID() {
		return UserID;
	}


	public void setUserID(int userID) {
		UserID = userID;
	}


	public int getAlbumTypeID() {
		return AlbumTypeID;
	}


	public void setAlbumTypeID(int albumTypeID) {
		AlbumTypeID = albumTypeID;
	}


	public String getAlbumName() {
		return AlbumName;
	}


	public void setAlbumName(String albumName) {
		AlbumName = albumName;
	}


	public String getCreateTime() {
		return CreateTime;
	}


	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}

	public String getAlbumCon() {
		return AlbumCon;
	}


	public void setAlbumCon(String albumCon) {
		AlbumCon = albumCon;
	}


	//初始化类成员变量
	public Album(){
		this.AlbumID=0;
		this.UserID=0;
		this.AlbumTypeID=0;
		this.AlbumName="";
		this.AlbumCon="";
		SimpleDateFormat timeFormatter=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		this.CreateTime=timeFormatter.format(new java.util.Date());
		this.strSql="";
	}
	//向Album数据表添加一条新纪录
	public boolean add_Album(){
		this.strSql="insert into Users_Album(UserID,AlbumTypeID,AlbumName,CreateTime,AlbumCon)values('"+this.UserID+"','"+this.AlbumTypeID+"','"+this.AlbumName+"','"+this.CreateTime+"','"+this.AlbumCon+"')";
		boolean isAdd=super.exeSql(this.strSql);
		return isAdd;
	}
	
	//修改相册类型
	public boolean modify_type(){
		this.strSql="update Users_Album set AlbumTypeID='"+this.AlbumTypeID+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
    //修改Album数据表信息
	public boolean modify_Album(){
		this.strSql="update Users_Album set AlbumName='"+this.AlbumName+"',AlbumCon='"+this.AlbumCon+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
	//删除相册信息
	public boolean delete_Album(String DeleteID){
		this.strSql="delete from Users_Album where AlbumID in ('"+DeleteID+"')";
		boolean isDelete=super.exeSql(this.strSql);
		return isDelete;
	}
	//获取类成员变量Album对应的相册信息
	public boolean init(){
		this.strSql="select * from Users_Album where AlbumID='"+this.AlbumID+"'";
		ResultSet rs=null;
		try{
			rs=super.exeSqlQuery(this.strSql);
			if(rs.next()){
				this.AlbumID=rs.getInt("AlbumID");
				this.UserID=rs.getInt("UserID");
				this.AlbumTypeID=rs.getInt("AlbumTypeID");
				this.AlbumName=rs.getString("AlbumName");
				this.CreateTime=rs.getString("CreateTime");
				this.AlbumCon=rs.getString("AlbumCon");
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			return false;
		}
	}
	
	//修改相册信息
	public boolean modify(){
		this.strSql="update Users_Album set AlbumTypeID='"+this.AlbumTypeID+"',AlbumName='"+this.AlbumName+"',AlbumCon='"+this.AlbumCon+"' where AlbumID='"+this.AlbumID+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
	
	//获取UserID对应的所有相册信息
	public ResultSet show_users_Album(){
		this.strSql="select * from Users_Album where UserID='"+this.UserID+"'";
		ResultSet rs=null;
		try{
			rs=super.exeSqlQuery(this.strSql);
		}catch(Exception e){
			System.out.println(e);
		}
		return rs;
	}
	
	
	//获取所有相册信息
	public ResultSet show_Album(){
		this.strSql="select * from Users_Album";
		ResultSet rs=null;
		try{
			rs=super.exeSqlQuery(this.strSql);
		}catch(Exception e){
			System.out.println(e);
		}
		return rs;
	}
}
