<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../images/css.css" type=text/css rel=stylesheet>
<script>
function Confirmlogout(unid)     
   {     
      if(confirm("\n你确认要退出吗？"))     
      {     
        window.location.href="../logout.asp";
      }        
   } 
</script>

<SCRIPT language=JavaScript>
if (window.Event)
  document.captureEvents(Event.MOUSEUP);

function nocontextmenu()
{
 event.cancelBubble = true
 event.returnValue = false;

 return false;
}

function norightclick(e)
{
 if (window.Event)
 {
  if (e.which == 2 || e.which == 3)
   return false;
 }
 else
  if (event.button == 2 || event.button == 3)
  {
   event.cancelBubble = true
   event.returnValue = false;
   return false;
  }

}

document.oncontextmenu = nocontextmenu;  // for IE5+
document.onmousedown = norightclick;  // for all others
</SCRIPT>

<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY class=bodycolor leftMargin=0 topMargin=0>
<TABLE height=50 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD background=../images/banner0.gif>
      <DIV 
      style="MARGIN-TOP: 5pt; FONT-WEIGHT: bold; FONT-SIZE: 19pt; FILTER: Glow(Color=#000000,Strength=2); WIDTH: 100%; COLOR: #ffffff; FONT-FAMILY: 宋体">&nbsp;网站管理系统 </DIV></TD>
    <TD class=small width=300 background=../images/banner1.gif>
      <DIV 
      style="FONT-WEIGHT: bold; FONT-SIZE: 9pt; FILTER: dropshadow(color=#FFFFFF,offx=1,offy=1,positive=1); WIDTH: 100%; COLOR: #000000; HEIGHT: 20pt" 
      align=right><SCRIPT LANGUAGE=JavaScript>
<!--
// Begin
var enable=0;today=new Date();var day;var date;var time_start=new Date();var clock_start=time_start.getTime();if(today.getDay()==0)day="星期日"
if(today.getDay()==1)day="星期一"
if(today.getDay()==2)day="星期二"
if(today.getDay()==3)day="星期三"
if(today.getDay()==4)day="星期四"
if(today.getDay()==5)day="星期五"
if(today.getDay()==6)day="星期六"
date=(today.getYear())+"年"
+(today.getMonth()+1)+"月"
+today.getDate()+"日 ";document.write("<span style='font-size:12px;color:#000000;'>"+date);
document.write(day+"</font></span>");//-->
    </SCRIPT>&nbsp;
      <SCRIPT language=JavaScript>
<!--
var bsYear;
var bsDate;
var bsWeek;
var arrLen=8;
var sValue=0;
var dayiy=0;
var miy=0;
var iyear=0;
var dayim=0;
var spd=86400;

var year1999="30;29;29;30;29;29;30;29;30;30;30;29"; //354
var year2000="30;30;29;29;30;29;29;30;29;30;30;29"; //354
var year2001="30;30;29;30;29;30;29;29;30;29;30;29;30"; //384
var year2002="30;30;29;30;29;30;29;29;30;29;30;29"; //354
var year2003="30;30;29;30;30;29;30;29;29;30;29;30"; //355
var year2004="29;30;29;30;30;29;30;29;30;29;30;29;30"; //384
var year2005="29;30;29;30;29;30;30;29;30;29;30;29"; //354
var year2006="30;29;30;29;30;30;29;29;30;30;29;29;30";

var month1999="正月;二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
var month2001="正月;二月;三月;四月;闰四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
var month2004="正月;二月;闰二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
var month2006="正月;二月;三月;四月;五月;六月;七月;闰七月;八月;九月;十月;十一月;十二月"
var Dn="初一;初二;初三;初四;初五;初六;初七;初八;初九;初十;十一;十二;十三;十四;十五;十六;十七;十八;十九;二十;廿一;廿二;廿三;廿四;廿五;廿六;廿七;廿八;廿九;三十";

var Ys=new Array(arrLen);
Ys[0]=919094400;Ys[1]=949680000;Ys[2]=980265600;
Ys[3]=1013443200;Ys[4]=1044028800;Ys[5]=1074700800;
Ys[6]=1107878400;Ys[7]=1138464000;

var Yn=new Array(arrLen); //农历年的名称  
Yn[0]="己卯年";Yn[1]="庚辰年";Yn[2]="辛巳年";
Yn[3]="壬午年";Yn[4]="癸未年";Yn[5]="甲申年";
Yn[6]="乙酉年";Yn[7]="丙戌年";

var D=new Date();  
var yy=D.getYear();  
var mm=D.getMonth()+1;  
var dd=D.getDate();  
var ww=D.getDay();

var ss=parseInt(D.getTime() / 1000);
if (yy<100) yy="19"+yy;

for (i=0;i<arrLen;i++)
if (ss>=Ys[i]){
iyear=i;
sValue=ss-Ys[i]; //当年的秒数
}
dayiy=parseInt(sValue/spd)+1; //当年的天数

var dpm=year1999;
if (iyear==1) dpm=year2000;
if (iyear==2) dpm=year2001;
if (iyear==3) dpm=year2002;
if (iyear==4) dpm=year2003;
if (iyear==5) dpm=year2004;
if (iyear==6) dpm=year2005;
if (iyear==7) dpm=year2006;
dpm=dpm.split(";");

var Mn=month1999;
if (iyear==2) Mn=month2001;
if (iyear==5) Mn=month2004;
if (iyear==7) Mn=month2006;
Mn=Mn.split(";");

var Dn="初一;初二;初三;初四;初五;初六;初七;初八;初九;初十;十一;十二;十三;十四;十五;十六;十七;十八;十九;二十;廿一;廿二;廿三;廿四;廿五;廿六;廿七;廿八;廿九;三十";
Dn=Dn.split(";");

dayim=dayiy;
var total=new Array(13);
total[0]=parseInt(dpm[0]);
for (i=1;i<dpm.length-1;i++) total[i]=parseInt(dpm[i])+total[i-1];
for (i=dpm.length-1;i>0;i--)
if (dayim>total[i-1]){
dayim=dayim-total[i-1];
miy=i;
}

bsYear2=Mn[miy]+Dn[dayim-1];
if (ss>=Ys[7]||ss<Ys[0]) bsYear=Yn[7];
document.write(" 农历 "+bsYear2);
//-->
</SCRIPT>
       </DIV>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href="table_index.asp"  target=table_index><IMG src="../images/mytable.gif" alt=控制中心  width=16 height=16 border=0 align="absbottom"><FONT color=black>&nbsp;管理首页</FONT></A>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<a href="../../bbs/" target=table_index><IMG src="../images/bbs.gif" alt=内部交流 width=16 height=16 border=0 align="absbottom"><FONT color=black>&nbsp;论坛交流</FONT></A>&nbsp;&nbsp;&nbsp;&nbsp; 
        <a href="javascript:Confirmlogout()"><IMG src="../images/exit.gif" alt=退出系统 width=16 height=16 border=0 align="absbottom"><FONT color=black>&nbsp;退出系统</FONT></A> 
      </TD>
    </TR></TBODY></TABLE>
&nbsp; 
</BODY></HTML>
