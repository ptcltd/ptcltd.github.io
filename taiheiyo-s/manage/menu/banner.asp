<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../images/css.css" type=text/css rel=stylesheet>
<script>
function Confirmlogout(unid)     
   {     
      if(confirm("\n��ȷ��Ҫ�˳���"))     
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
      style="MARGIN-TOP: 5pt; FONT-WEIGHT: bold; FONT-SIZE: 19pt; FILTER: Glow(Color=#000000,Strength=2); WIDTH: 100%; COLOR: #ffffff; FONT-FAMILY: ����">&nbsp;��վ����ϵͳ </DIV></TD>
    <TD class=small width=300 background=../images/banner1.gif>
      <DIV 
      style="FONT-WEIGHT: bold; FONT-SIZE: 9pt; FILTER: dropshadow(color=#FFFFFF,offx=1,offy=1,positive=1); WIDTH: 100%; COLOR: #000000; HEIGHT: 20pt" 
      align=right><SCRIPT LANGUAGE=JavaScript>
<!--
// Begin
var enable=0;today=new Date();var day;var date;var time_start=new Date();var clock_start=time_start.getTime();if(today.getDay()==0)day="������"
if(today.getDay()==1)day="����һ"
if(today.getDay()==2)day="���ڶ�"
if(today.getDay()==3)day="������"
if(today.getDay()==4)day="������"
if(today.getDay()==5)day="������"
if(today.getDay()==6)day="������"
date=(today.getYear())+"��"
+(today.getMonth()+1)+"��"
+today.getDate()+"�� ";document.write("<span style='font-size:12px;color:#000000;'>"+date);
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

var month1999="����;����;����;����;����;����;����;����;����;ʮ��;ʮһ��;ʮ����"
var month2001="����;����;����;����;������;����;����;����;����;����;ʮ��;ʮһ��;ʮ����"
var month2004="����;����;�����;����;����;����;����;����;����;����;ʮ��;ʮһ��;ʮ����"
var month2006="����;����;����;����;����;����;����;������;����;����;ʮ��;ʮһ��;ʮ����"
var Dn="��һ;����;����;����;����;����;����;����;����;��ʮ;ʮһ;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;��ʮ;إһ;إ��;إ��;إ��;إ��;إ��;إ��;إ��;إ��;��ʮ";

var Ys=new Array(arrLen);
Ys[0]=919094400;Ys[1]=949680000;Ys[2]=980265600;
Ys[3]=1013443200;Ys[4]=1044028800;Ys[5]=1074700800;
Ys[6]=1107878400;Ys[7]=1138464000;

var Yn=new Array(arrLen); //ũ���������  
Yn[0]="��î��";Yn[1]="������";Yn[2]="������";
Yn[3]="������";Yn[4]="��δ��";Yn[5]="������";
Yn[6]="������";Yn[7]="������";

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
sValue=ss-Ys[i]; //���������
}
dayiy=parseInt(sValue/spd)+1; //���������

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

var Dn="��һ;����;����;����;����;����;����;����;����;��ʮ;ʮһ;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;��ʮ;إһ;إ��;إ��;إ��;إ��;إ��;إ��;إ��;إ��;��ʮ";
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
document.write(" ũ�� "+bsYear2);
//-->
</SCRIPT>
       </DIV>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href="table_index.asp"  target=table_index><IMG src="../images/mytable.gif" alt=��������  width=16 height=16 border=0 align="absbottom"><FONT color=black>&nbsp;������ҳ</FONT></A>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<a href="../../bbs/" target=table_index><IMG src="../images/bbs.gif" alt=�ڲ����� width=16 height=16 border=0 align="absbottom"><FONT color=black>&nbsp;��̳����</FONT></A>&nbsp;&nbsp;&nbsp;&nbsp; 
        <a href="javascript:Confirmlogout()"><IMG src="../images/exit.gif" alt=�˳�ϵͳ width=16 height=16 border=0 align="absbottom"><FONT color=black>&nbsp;�˳�ϵͳ</FONT></A> 
      </TD>
    </TR></TBODY></TABLE>
&nbsp; 
</BODY></HTML>
