<%
'打开站点设置连接
sql="select * from main_book"
Set rs_main= Server.CreateObject("ADODB.Recordset")
rs_main.open sql,conn,1,1
content=ubbcode(rs_main("content"))
About=ubbcode(rs_main("About"))
Linian=ubbcode(rs_main("Linian"))
Jigou=ubbcode(rs_main("Jigou"))
Wenhua=ubbcode(rs_main("Wenhua"))
Job=ubbcode(rs_main("Job"))
sale=ubbcode(rs_main("sale"))
salea=ubbcode(rs_main("salea"))
jiameng=ubbcode(rs_main("jiameng"))
lianxi=ubbcode(rs_main("lianxi"))
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