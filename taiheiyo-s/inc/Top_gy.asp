<%
'打开站点设置连接
sql="select * from main_index"
Set rs_main= Server.CreateObject("ADODB.Recordset")
rs_main.open sql,conn,1,1
s1=ubbcode(rs_main("s1"))
s2=ubbcode(rs_main("s2"))
s3=ubbcode(rs_main("s3"))
s4=ubbcode(rs_main("s4"))
s5=ubbcode(rs_main("s5"))
s6=ubbcode(rs_main("s6"))
s7=ubbcode(rs_main("s7"))
s8=ubbcode(rs_main("s8"))
s9=ubbcode(rs_main("s9"))
%>
<script language="javascript">
<!--
function winopen(url)
{
window.open(url,"search","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=yes,width=640,height=450,top=200,left=100");
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
window.open(theURL,winName,features);
}
//-->
</script>
<script>
function eshop(id) { window.open("Eshop.asp?cpbm="+id,"","height=400,width=640,left=200,top=0,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");}
</script> 