<%@page contentType="text/html;charset=gb2312" language="java"%>
<html>
<head>
<title>�Զ��л�ͼƬ</title>
</head>
<script type="text/javascript">
setInterval("loadImage()",2000); //������ʱ��
var images=['01.jpg','02.jpg','03.jpg','04.jpg','05.jpg','06.jpg']; //ָ��ͼ���ļ���
var i=0;  //�ӵ�һ��ͼ���ļ���ʼ��ʾ
function loadImage(){
i++;
//����ʾ����5��ͼ���ļ�ʱ���ٴӵ�1��ͼ��ʼѭ��
if(i==6)i=0;
var oImage=document.getElementById('image');
var oLabel=document.getElementById('info');
oImage.src='images/'+images[i]; //Ϊimg��ǩ��src���Ը�ֵ
oLabel.innerText=images[i]; //��ʾ��ǰ��ͼ���ļ���
}
</script>
<body>
<div align="center">
<font color="white"><label id="info"></label></font>
<p/>
<img src="images/01.jpg" id="image" width="400" height="400"/>
<script type="text/javascript">
var oLabel=document.getElementById('info');
oLabel.innerText=images[i];
</script>
</div>
</body>
</html>