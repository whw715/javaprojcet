<%@page contentType="image/jpeg;charset=gb2312" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>
<%!
Color getRandColor(int fc,int bc)
{
  Random random=new Random();
  if(fc>255) fc=255;
  if(bc>255) bc=255;
  int r=fc+random.nextInt(bc-fc);
  //random.nextInt(int n)����һ��α�����������ȡ�Դ���������������еġ��� 0����������ָ��ֵ����������֮����ȷֲ��� int ֵ��
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
//BufferedImage �����������пɷ���ͼ�����ݻ������� Image
//TYPE_INT_RGB ��ʾһ��ͼ�������кϳ��������ص� 8 λ RGB ��ɫ������
Graphics g=image.getGraphics();  //Graphics ��������ͼ�������ĵĳ������
Random random=new Random();  //�����
g.setColor(getRandColor(200,250));
g.fillRect(0,0,i_width,i_height);
//fillRect(int x, int y, int width, int height) ���ָ���ľ��Ρ�
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
        //  �ڴ�ͼ�������ĵ�����ϵ�У�ʹ�õ�ǰ��ɫ�ڵ� (x1, y1) �� (x2, y2) ֮�仭һ���ߡ�
}
String s_Rand="";
for(int i=0;i<4;i++)
{
  String rand=String.valueOf(random.nextInt(10));
  s_Rand+=rand;
  g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
  g.drawString(rand,13*i+6,16);
  //drawString(String str, int x, int y) 
      //    ʹ�ô�ͼ�������ĵĵ�ǰ�������ɫ������ָ�� string �������ı���
}
session.setAttribute("rand",s_Rand);  //����֤����ӵ�session����
g.dispose();//dispose()�ͷŴ�ͼ�ε��������Լ���ʹ�õ�����ϵͳ��Դ��
ImageIO.write(image,"JPEG",response.getOutputStream());
// ʹ��֧�ָ�����ʽ������ ImageWriter ��һ��ͼ��д�� OutputStream��
%>