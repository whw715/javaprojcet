<%@page contentType="text/html;charset=gb2312" language="java"%>
<html>
<head>
<title>自动切换图片</title>
</head>
<script type="text/javascript">
setInterval("loadImage()",2000); //启动定时器
var images=['01.jpg','02.jpg','03.jpg','04.jpg','05.jpg','06.jpg']; //指定图像文件名
var i=0;  //从第一个图像文件开始显示
function loadImage(){
i++;
//当显示到第5个图像文件时，再从第1个图像开始循环
if(i==6)i=0;
var oImage=document.getElementById('image');
var oLabel=document.getElementById('info');
oImage.src='images/'+images[i]; //为img标签的src属性赋值
}
</script>
<body>
<div align="center">
<font color="white"><label id="info"></label></font>
<p/>
<img src="images/01.jpg" id="image" width="750" height="500"/>
</div>
</body>
</html>