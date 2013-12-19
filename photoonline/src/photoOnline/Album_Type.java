package photoOnline;

import java.sql.ResultSet;

public class Album_Type extends Execute_DB {
    //定义成员变量
    private int AlbumTypeID; //相册类型索引号
    private String AlbumType; //相册类型
    private String strSql;
    
    
    public int getAlbumTypeID() {
		return AlbumTypeID;
	}

	public void setAlbumTypeID(int albumTypeID) {
		AlbumTypeID = albumTypeID;
	}

	public String getAlbumType() {
		return AlbumType;
	}

	public void setAlbumType(String albumType) {
		AlbumType = albumType;
	}

	//初始化成员变量值
    public Album_Type(){
    	this.AlbumTypeID=0;
    	this.AlbumType="";
    	this.strSql="";
    }
    
    //向数据库添加一条新纪录
    public boolean add_AlbumType(){
    	this.strSql="insert into Album_Type(AlbumType)values('"+this.AlbumType+"')";
    	boolean isAdd=super.exeSql(this.strSql);
    	return isAdd;
    }
    //删除AlbumTypeID所对应的相册类别信息
    public boolean delete_Type(String deleteID){
    	this.strSql="delete from Album_Type where AlbumTypeID in ("+deleteID+")";
    	boolean isDelete=super.exeSql(this.strSql);
    	return isDelete;
    }
    //修改AlbumTypeID所对应的相册类别信息
    public boolean modify_Type(){
    	this.strSql="update Album_Type set AlbumType='"+this.AlbumType+"' where AlbumTypeID='"+this.AlbumTypeID+"'";
    	boolean isUpdate=super.exeSql(this.strSql);
    	return isUpdate;
    }
    //获取类成员变量AlbumTypeID所对应的相册信息
    public boolean init(){
    	this.strSql="select * from Album_Type where AlbumTypeID='"+this.AlbumTypeID+"'";
    	try{
    		ResultSet rs=super.exeSqlQuery(this.strSql);
    		if(rs.next()){
    			this.AlbumTypeID=rs.getInt("AlbumTypeID");
    			this.AlbumType=rs.getString("AlbumType");
    			return true;
    		}else{
    			return false;
    		}
    	}catch(Exception e){
    		return false;
    	}
    }
    //获取所有相册类别信息，返回一个ResultSet类型对象
    public ResultSet show_Type(){
    	this.strSql="select * from Album_Type";
    	ResultSet rs=null;
    	try{
    		rs=super.exeSqlQuery(this.strSql);
    	}catch(Exception e){
    		System.out.println(e);
    	}
    	return rs;
    }

}
