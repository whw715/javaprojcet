package photoOnline;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class Album extends Execute_DB {
	//�������Ա����
	private int AlbumID; //���������
	private int UserID; //�û�������
	private int AlbumTypeID; //�������������
	private String AlbumName; //�����
	private String CreateTime; //�������ʱ��
	private String AlbumCon; //�����
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


	//��ʼ�����Ա����
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
	//��Album���ݱ����һ���¼�¼
	public boolean add_Album(){
		this.strSql="insert into Users_Album(UserID,AlbumTypeID,AlbumName,CreateTime,AlbumCon)values('"+this.UserID+"','"+this.AlbumTypeID+"','"+this.AlbumName+"','"+this.CreateTime+"','"+this.AlbumCon+"')";
		boolean isAdd=super.exeSql(this.strSql);
		return isAdd;
	}
	
	//�޸��������
	public boolean modify_type(){
		this.strSql="update Users_Album set AlbumTypeID='"+this.AlbumTypeID+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
    //�޸�Album���ݱ���Ϣ
	public boolean modify_Album(){
		this.strSql="update Users_Album set AlbumName='"+this.AlbumName+"',AlbumCon='"+this.AlbumCon+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
	//ɾ�������Ϣ
	public boolean delete_Album(String DeleteID){
		this.strSql="delete from Users_Album where AlbumID in ('"+DeleteID+"')";
		boolean isDelete=super.exeSql(this.strSql);
		return isDelete;
	}
	//��ȡ���Ա����Album��Ӧ�������Ϣ
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
	
	//�޸������Ϣ
	public boolean modify(){
		this.strSql="update Users_Album set AlbumTypeID='"+this.AlbumTypeID+"',AlbumName='"+this.AlbumName+"',AlbumCon='"+this.AlbumCon+"' where AlbumID='"+this.AlbumID+"'";
		boolean isUpdate=super.exeSql(this.strSql);
		return isUpdate;
	}
	
	//��ȡUserID��Ӧ�����������Ϣ
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
	
	
	//��ȡ���������Ϣ
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
