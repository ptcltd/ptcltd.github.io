<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
if request("flag")="del" then
conn.execute("delete from feedbacken where id="&request("id")&"")
response.write "<script>alert('delete Succeed！');window.location.href='manage_feedbacken.asp';</script>"
response.end
end if
%>
<script language="javascript">
function shanchu(unid)     
   {     
      if(confirm("\n delete？"))     
      {     
        window.location.href="manage_feedbacken.asp?flag=del&id="+unid;
      }        
   } 
</script>
<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #FF0000}
.STYLE4 {color: #000000}
-->
</style>
</head>
<body>
<br>
<table width="670" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="25" colspan="4" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3">info list </span></td>
  </tr>
  
  <tr>
    <td width="65" height="25" align="center" valign="middle"><span class="STYLE4">Name</span></td>
    <td width="186" height="25" align="center" valign="middle"><span class="STYLE4">Email</span></td>
    <td width="291" align="center" valign="middle"><span class="STYLE4">Company Name </span></td>
    <td width="123" align="center" valign="middle"><span class="STYLE4">Operation</span></td>
  </tr>
  <%
set rs=server.createobject("adodb.recordset")
sql = "select * from feedbacken"
rs.open sql,conn,1,1
if rs.bof and rs.eof then%>
  <tr>
    <td height="25" colspan="4" align="center" bgcolor="#FFFFFF">NO Feedback! </td>
  </tr>
  <%
else
do while not rs.eof
%>
  <tr>
    <td height="25" align="center" valign="middle" bgcolor="#FFFFFF"><%=rs("name")%></td>
    <td height="25" align="center" valign="middle" bgcolor="#FFFFFF"><%=rs("email")%></td>
    <td align="center" valign="middle" bgcolor="#FFFFFF"><%=rs("comname")%></td>
    <td align="center" valign="middle" bgcolor="#FFFFFF"><label>
      <input name="Submit" type="button" class="go-wenbenkuang" value="Detail" onClick="window.location='manage_fben.asp?id=<%=rs("id")%>';">
      <input name="Submit4" type="button" class="go-wenbenkuang" value="Delete" onClick="javascript:shanchu(<%=rs("id")%>)">
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
