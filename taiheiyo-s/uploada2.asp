<!--#include file="Inc/config.asp"-->
<%
id=request("id")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY{
font-size:9pt
}
.tx1 { height: 20px;font-size: 9pt; border: 1px solid; border-color: #000000; color: #0000FF}
-->
</style>
</head>
<body bgcolor="#f1f1f1" leftmargin="0" topmargin="0">
<div align="center">
  <%
if EnableUploadFile="Yes" and session("admin_name")<>""then
if id="" then
response.Write("<img src='images/noimg.gif' width='100' height='100'>")
else

db="db.mdb" '数据库文件位置
on error resume next
connstr="DBQ="+server.mappath(""&db&"")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
if err then
err.clear
else
conn.open connstr
end if

Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From products where ID="&id, conn,3,3
response.Write("<img src='"&rs("bigpic")&"' width='100' height='100'>")

rs.close
set rs=nothing

end if
%>

<form action="upfilea2.asp" method="post" name="form1" enctype="multipart/form-data">
  <input name="FileName" type="FILE" class="tx1" size="20">
  <input type="submit" name="Submit" value="上传" style="border:1px double rgb(88,88,88);font:9pt">
</form>
<%
end if
%></div>
</body>
</html>
