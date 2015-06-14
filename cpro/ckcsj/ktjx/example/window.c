/*仿窗口界面 */
/*在Tubor C2环境下执行*/
#include "conio.h"
#include "stdio.h"
#include "graphics.h"
#include "stdlib.h"
#include "dos.h"
FILE *fp;
char sr[11];
void hz(int x,int y,int a,int COL,int b,char *s)
{
 int ROW;
 char buffer[32];
 register m,n,i,j,k;
 unsigned char qh,wh;
 unsigned long offset;
 ROW=COL;
 while(*s)
  {
   qh=*(s)-0xa0;
   wh=*(s+1)-0xa0;
   offset=(94*(qh-1)+(wh-1))*32L;
   fseek(fp,offset,SEEK_SET);
   fread(buffer,32,1,fp);
   for (i=0;i<16;i++)
   for(n=0;n<ROW;n++)
   for(j=0;j<2;j++)
   for(k=0;k<8;k++)
   for(m=0;m<COL;m++)
   if (((buffer[i*2+j]>>(7-k))&0x1)!=NULL)
     putpixel(x+8*j*COL+k*COL+m,y+i*ROW+n,b);
   s+=2;
   x+=a;
   }
}
void exit1()
{
 closegraph();
 close(fp);
 clrscr();
 exit(0);
}
void Box(int left,int top,int right,int bottom,int color)
{
 int old_color;
 old_color=getcolor();
 setcolor(color);
 line(left,top,right,top);
 line(left,top,left,bottom);
 line(right,top,right,bottom);
 line(left,bottom,right,bottom);
 setcolor(old_color);
}
Dbox(int left,int top,int right,int bottom)
{
 int x;
 setfillstyle(SOLID_FILL,LIGHTGRAY);
 bar(left,top,right,bottom);
 setcolor(BLACK);
 Box(left,top,right,bottom,BLACK);
 line(left,top+16+8,right,top+16+8);
 line(left+16+8,top,left+16+8,bottom);
 line(left,bottom-16-8,right,bottom-16-8);
 line(right-16-8,top,right-16-8,bottom);
 setfillstyle(SOLID_FILL,3);
 bar(left+2,top+2,right-2,bottom-2);
 setcolor(BLACK);
 Box(left+2,top+2,right-2,bottom-2,BLACK);
 line(left,top+16+8,right,top+16+8);
 line(left+16+8,top,left+16+8,top+16+8);
 setfillstyle(SOLID_FILL,BLUE);
 bar(left+16+9,top+3,right-3,top+16+7);
 setfillstyle(SOLID_FILL,LIGHTGRAY);
 bar(left+3,top+3,left+16+7,top+16+7);
 setfillstyle(SOLID_FILL,WHITE);
 x=(16+6)/4;
 bar(left+2+x,top+2+2*x-1,left+2+3*x,top+2+2*x+1);
 Box(left+2+x,top+2+2*x-1,left+2+3*x,top+2+2*x+1,BLACK);
}
Button(int left,int top,int length,int b,int g)
{
 int bottom,right;
 bottom=top+b;
 right=left+length;
 setfillstyle(SOLID_FILL,WHITE);
 bar(left,top,right,bottom);
 setcolor(BLACK);
 Box(left,top,right,bottom,BLACK);
 setfillstyle(SOLID_FILL,g);
 bar(left+2,top+2,right-1,bottom-1);
 setcolor(DARKGRAY);
 line(left+1,bottom-1,right,bottom-1);
 line(right-1,top+1,right-1,bottom);
}
void gy()
{
 clrscr();
 Button(100,60,450,330,LIGHTGRAY);
 hz(185,110,50,2,1,"密码演示系统");
 hz(200,160,15,1,2,"（默认密码为０１２３４５６７８９）");
 hz(250,220,15,1,4,"版权所有，随便拷贝");
 hz(190,270,15,1,3,"版权所有：");
 hz(280,270,15,1,3,"秋风之家");
 hz(190,300,15,1,8,"主页地址：");
 outtextxy(280,307,"www.wjhgnilm.8u8.com");
 hz(240,350,15,1,6,"设计时间：２００３年６月");
 getch();
}
void getinpass(char *s)
{
int e,z;
for(z=0;z<10;z++)
sr[z]=NULL;
clrscr();
Dbox(200,150,410,240);
hz(230,155,15,1,14,"口令");
hz(210,200,15,1,14,s);
z=0;
while(1)
{
 xyz:
 e=getch();
 if(e==13)
 return;
 if(e==27)
 {
 exit1();
 }
 if(z>=10)
 goto xyz;
 outtextxy(295+z*10,205,"*");
 sr[z]=e;
 z++;
}
}
void xyz()
{
 FILE *fp1;
 char buf[1];
 zyx:
 clrscr();
 getinpass("输入新口令：");
 if (strlen(sr)!=10)
 {
 clrscr();
 Dbox(200,150,410,240);
 hz(230,155,15,1,14,"口令");
 hz(210,200,15,1,14,"口令字无效，返回！");
 getch();
 goto zyx;
 }
 clrscr();
 Dbox(200,150,410,240);
 hz(230,155,15,1,14,"口令");
 hz(250,200,15,1,14,"口令修改成功！");
 if ((fp1=fopen("KLK.CFG","w"))!=NULL)
 {
  fputs(sr,fp1);
  buf[0]=0x1a;
  fwrite(&buf[0],1,1,fp1);
  fclose(fp1);
 }
 getch();
}
void windows()
{
 int anj,bc[3];
 xyz1:
 setbkcolor(1);
 textcolor(1);
 clrscr();
 Dbox(140,110,500,350);
 hz(170,115,15,1,3,"密码演示系统");
 hz(190,160,15,1,6,"本系统只是一个简单的密码实例；");
 hz(190,210,15,1,6,"它只能提供十位固定密码设置；");
 hz(190,260,15,1,6,"你可以选择改密码对默认秘密进行修改。");
 bc[0]=2;bc[1]=7;bc[2]=7;
 do
  {
   Button(190,310,60,22,bc[0]);
   Button(290,310,60,22,bc[1]);
   Button(390,310,60,22,bc[2]);
   hz(198,313,15,1,14,"改密码");
   hz(298,313,30,1,14,"关于");
   hz(398,313,30,1,14,"退出");
   xyz:
   anj=getch();
   switch(anj)
   {
    case 27:
     close(fp);
     closegraph();
     exit(0);
    case 32:
    case 13:
     if(bc[0]==2)
       xyz();
     else
      {
       if(bc[1]==2)
  gy();
       else
 {
  close(fp);
  closegraph();
  exit(0);
 }
       }
 goto xyz1;
      case 75:
      if(bc[0]==2)
 goto xyz;
      else
      {
       if(bc[1]==2)
 {
  bc[0]=2;
  bc[1]=7;
 }
       else
 {
  bc[2]=7;
  bc[1]=2;
 }
      }
    break;
  case 77:
     if(bc[2]==2)
 goto xyz;
      else
      {
       if(bc[1]==2)
  {
   bc[2]=2;
   bc[1]=7;
  }
       else
 {
  bc[1]=2;
  bc[0]=7;
 }
      }
   break;
  default:
  goto xyz;
}
}while(1);
}

void pass()
{
char kl[11]="0";
FILE *fp1;
int i;
for(i=0;i<=2;i++)
{
getinpass("请输入口令：");
if ((fp1=fopen("KLK.CFG","rb+"))!=NULL)
   {
    fseek(fp1,0,SEEK_SET);
    fgets(kl,11,fp1);
    fclose(fp1);
   }
if(i==2&&strcmp(sr,kl)!=0)
   {
     clrscr();
     Dbox(200,150,410,240);
     hz(230,155,15,1,14,"错误");
     hz(245,200,15,1,14,"口令错误，退出！");
     getch();
     close(fp1);
     exit1();
   }
if (strcmp(sr,kl)!=0)
   {
   clrscr();
   Dbox(200,150,410,240);
   hz(230,155,15,1,14,"错误");
   hz(245,200,15,1,14,"口令错误，重输！");
   getch();
 }
else
return;
}
close(fp1);
}
main()
{
 int GD=DETECT,GM;
 initgraph(&GD,&GM,"");
 if ((fp=fopen("hzk16","rb"))==NULL)
     { printf("Can't open haz16,Please add it");
    getch(); closegraph(); exit(0);
     }
 setbkcolor(1);
 textcolor(1);
 clrscr();
 gy();
 pass();
 windows();
 closegraph();
 close(fp);
 }

