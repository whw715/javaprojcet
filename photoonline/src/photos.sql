create  database photos;
use photos;
create table Album_Type(
       AlbumTypeID int auto_increment primary key,
       AlbumType varchar(50),
       strSql varchar(50)
);
create table Photo(
       PhotoID int auto_increment primary key,
       AlbumID int,
       PhotoName varchar(50),
       PhotoDes varchar(50),
       strSql varchar(50)
);
create table Users(
       UserID int auto_increment primary key,
       SysRole int,
       UserName varchar(50),
       UserPassword varchar(50),
       Email varchar(50),
       CreateTime varchar(50),
       timeFormatter timestamp,
       strSql varchar(50)
);
create table Album(
       AlbumID int auto_increment primary key,
       UserID int,
       AlbumTypeID int,
       AlbumName varchar(50),
       CreateTime varchar(50),
       AlbumCon varchar(50),
       strSql varchar(50)
);