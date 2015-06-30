<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
if request("flag")="del" then
conn.execute("delete from news where id="&request("id")&"")
response.write "<script>alert('del Succeed');window.location.href='manage_agentjp.asp';</script>"
response.end
end if
%>

<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=shift_jis">
<style type="text/css">
<!--
.STYLE3 {color: #FF0000}
.STYLE4 {color: #000000}
-->
</style>
<script language="javascript">
function shanchu(unid)     
   {     
      if(confirm("決定は削除しなければならない?"))     
      {     
        window.location.href="manage_agentjp.asp?flag=del&id="+unid;
      }        
   } 
</script>
</head>
<body>
<br>
<table width="670" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="25" colspan="4" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3">ニュース管理</span></td>
  </tr>
  <tr>
    <td width="36" height="25" align="center" valign="middle"><span class="STYLE4">ID</span></td>
    <td height="25" align="center" valign="middle"><span class="STYLE4">タイトル</span></td>
    <td width="59" align="center" valign="middle"><span class="STYLE4">修正</span></td>
    <td width="49" align="center" valign="middle"><span class="STYLE4">操作</span></td>
  </tr>
  <%
set rs=server.createobject("adodb.recordset")
sql = "select * from news"
rs.open sql,conn,1,1
if rs.bof and rs.eof then%>
  <tr>
    <td height="25" colspan="4" align="center" bgcolor="#FFFFFF">NO news!</td>
  </tr>
  <%
else
do while not rs.eof
%>
  <tr>
    <td height="25" align="center" valign="middle" bgcolor="#FFFFFF"><%=rs("id")%></td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("title")%></td>
    <td align="center" valign="middle" bgcolor="#FFFFFF"><input name="Submit2" type="button" class="go-wenbenkuang" value="修正" onClick="window.location='manage_newseditjp.asp?id=<%=rs("id")%>';"></td>
    <td align="center" valign="middle" bgcolor="#FFFFFF"><label>
      <input name="Submit4" type="button" class="go-wenbenkuang" value="削除" onClick="javascript:shanchu(<%=rs("id")%>)">
    </label></td>
  </tr>
  <%
rs.movenext
loop
end if
rs.close
set rs=nothing
%>
</table>
<br>
<br>
</body>
</html>
