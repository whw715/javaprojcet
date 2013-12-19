package photoOnline;

import java.sql.ResultSet;

public class Photo extends Execute_DB {
	//类成员变量
	private int PhotoID;
	private int AlbumID;
	private String PhotoName;
	private String PhotoDes;
	
	private String strSql;
	
	//类成员变量的get和set函数
	public int getPhotoID() {
		return PhotoID;
	}
	public void setPhotoID(int photoID) {
		PhotoID = photoID;
	}
	public int getAlbumID() {
		return AlbumID;
	}
	public void setAlbumID(int albumID) {
		AlbumID = albumID;
	}
	public String getPhotoName() {
		return PhotoName;
	}
	public void setPhotoName(String photoName) {
		PhotoName = photoName;
	}
	
	public String getPhotoDes() {
		return PhotoDes;
	}
	public void setPhotoDes(String photoDes) {
		PhotoDes = photoDes;
	}
	//初始化类成员变量
	public Photo(){
		this.PhotoID=0;
		this.AlbumID=0;
		this.PhotoName="";
		this.PhotoDes="";
		this.strSql="";
	}
	
	//向Photo数据表添加一条新纪录
	public boolean add_Photo(){
		this.strSql="insert into Photo(AlbumID,PhotoName,PhotoDes)values('"+this.AlbumID+"','"+this.PhotoName+"','"+this.PhotoDes+"')";
		boolean isAdd=super.exeSql(this.strSql);
		return isAdd;
	}
	
	//删除PhotoID对应的相片信息
	public boolean delete_Photos(){
		this.strSql="delete from Photo where AlbumID='"+this.AlbumID+"'";
		boolean isDelete=super.exeSql(this.strSql);
		return isDelete;
	}
	
	public boolean delete_Photo(String deleteID){
		this.strSql="delete from Photo where PhotoID='"+deleteID+"'";
		boolean isDelete=super.exeSql(this.strSql);
		return isDelete;
	}
	
	//修改成员变量PhotoID对应的相片信息
	public boolean modify_Photo(){
		this.strSql="update Photo set AlbumID='"+this.AlbumID+"',PhotoDes='"+this.PhotoDes+"' where PhotoID='"+this.PhotoID+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
	
	//获取类成员变量PhotoID对应的相片信息
	public boolean init(){
		this.strSql="select * from Photo where PhotoID='"+this.PhotoID+"'";
		ResultSet rs=null;
		try{
			rs=super.exeSqlQuery(this.strSql);
			if(rs.next()){
				this.PhotoID=rs.getInt("PhotoID");
				this.AlbumID=rs.getInt("AlbumID");
				this.PhotoName=rs.getString("PhotoName");
				this.PhotoDes=rs.getString("PhotoDes");
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			return false;
		}
	}
	
	//获取相片AlbumID对应的所有相片
	public ResultSet get_photo(){
		this.strSql="select * from Photo where AlbumID='"+this.AlbumID+"'";
		ResultSet rs=null;
		try{
			rs=super.exeSqlQuery(this.strSql);
		}catch(Exception e){
			System.out.println(e);
		}
		return rs;
	}
	
	//获取所有相片信息
	public ResultSet show_Photo(){
		this.strSql="select * from Photo";
		ResultSet rs=null;
		try{
			rs=super.exeSqlQuery(this.strSql);
		}catch(Exception e){
			System.out.println(e);
		}
		return rs;
	}

}
