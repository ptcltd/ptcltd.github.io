<HTML><HEAD><TITLE>登录信息</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../images/css.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript>
window.setTimeout('this.location.reload();',600000);
var OA_TIME = new Date();
function timeview()
{
  timestr=OA_TIME.toLocaleString();
  timestr=timestr.substr(timestr.indexOf(" "));
  time_area.innerHTML = timestr;
  OA_TIME.setSeconds(OA_TIME.getSeconds()+1);
  window.setTimeout( "timeview()", 1000 );
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY bgColor=#c8d8f1 leftMargin=2 topMargin=0 onload=timeview();><IMG 
src="../images/dot3.gif"><B><SPAN class=small>&nbsp; 
<%=session("admin_name")%>，欢迎登陆！</B>&nbsp;&nbsp;&nbsp;&nbsp;现在时刻：<B><SPAN 
id=time_area></SPAN></B></SPAN> 
</BODY></HTML>
