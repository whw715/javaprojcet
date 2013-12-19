package photoOnline;

import java.sql.ResultSet;

public class Album_Type extends Execute_DB {
    //�����Ա����
    private int AlbumTypeID; //�������������
    private String AlbumType; //�������
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

	//��ʼ����Ա����ֵ
    public Album_Type(){
    	this.AlbumTypeID=0;
    	this.AlbumType="";
    	this.strSql="";
    }
    
    //�����ݿ����һ���¼�¼
    public boolean add_AlbumType(){
    	this.strSql="insert into Album_Type(AlbumType)values('"+this.AlbumType+"')";
    	boolean isAdd=super.exeSql(this.strSql);
    	return isAdd;
    }
    //ɾ��AlbumTypeID����Ӧ����������Ϣ
    public boolean delete_Type(String deleteID){
    	this.strSql="delete from Album_Type where AlbumTypeID in ("+deleteID+")";
    	boolean isDelete=super.exeSql(this.strSql);
    	return isDelete;
    }
    //�޸�AlbumTypeID����Ӧ����������Ϣ
    public boolean modify_Type(){
    	this.strSql="update Album_Type set AlbumType='"+this.AlbumType+"' where AlbumTypeID='"+this.AlbumTypeID+"'";
    	boolean isUpdate=super.exeSql(this.strSql);
    	return isUpdate;
    }
    //��ȡ���Ա����AlbumTypeID����Ӧ�������Ϣ
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
    //��ȡ������������Ϣ������һ��ResultSet���Ͷ���
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
