<%@page contentType="image/jpeg;charset=gb2312" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>
<%!
Color getRandColor(int fc,int bc)
{
  Random random=new Random();
  if(fc>255) fc=255;
  if(bc>255) bc=255;
  int r=fc+random.nextInt(bc-fc);
  //random.nextInt(int n)返回一个伪随机数，它是取自此随机数生成器序列的、在 0（包括）和指定值（不包括）之间均匀分布的 int 值。
  int g=fc+random.nextInt(bc-fc);
  int b=fc+random.nextInt(bc-fc);
  return new Color(r,g,b);
}
%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);
int i_width=60;
int i_height=20;
BufferedImage image=new BufferedImage(i_width,i_height,BufferedImage.TYPE_INT_RGB);
//BufferedImage 子类描述具有可访问图像数据缓冲区的 Image
//TYPE_INT_RGB 表示一个图像，它具有合成整数像素的 8 位 RGB 颜色分量。
Graphics g=image.getGraphics();  //Graphics 类是所有图形上下文的抽象基类
Random random=new Random();  //随机数
g.setColor(getRandColor(200,250));
g.fillRect(0,0,i_width,i_height);
//fillRect(int x, int y, int width, int height) 填充指定的矩形。
g.setFont(new Font("Times New Roman",Font.PLAIN,18));
g.setColor(getRandColor(160,200));
for(int i=0;i<155;i++)
{
  int i_x=random.nextInt(i_width);
  int i_y=random.nextInt(i_height);
  int i_x1=random.nextInt(12);
  int i_y1=random.nextInt(12);
  g.drawLine(i_x,i_y,i_x+i_x1,i_y+i_y1);
//drawLine(int x1, int y1, int x2, int y2) 
        //  在此图形上下文的坐标系中，使用当前颜色在点 (x1, y1) 和 (x2, y2) 之间画一条线。
}
String s_Rand="";
for(int i=0;i<4;i++)
{
  String rand=String.valueOf(random.nextInt(10));
  s_Rand+=rand;
  g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
  g.drawString(rand,13*i+6,16);
  //drawString(String str, int x, int y) 
      //    使用此图形上下文的当前字体和颜色绘制由指定 string 给定的文本。
}
session.setAttribute("rand",s_Rand);  //把验证码添加到session里面
g.dispose();//dispose()释放此图形的上下文以及它使用的所有系统资源。
ImageIO.write(image,"JPEG",response.getOutputStream());
// 使用支持给定格式的任意 ImageWriter 将一个图像写入 OutputStream。
%>