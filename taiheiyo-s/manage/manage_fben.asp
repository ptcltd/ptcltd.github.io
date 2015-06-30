<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->

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
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3">info</span></td>
  </tr>
  
  <%
set rs=server.createobject("adodb.recordset")
sql = "select * from feedbacken where id="&request("id")
rs.open sql,conn,1,1
%>
  <tr>
    <td width="134" height="25" align="right" valign="middle" bgcolor="#F6F6F6"><span class="title">It's about</span>：</td>
    <td width="533" height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("qora")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6"><span class="word">Class</span>：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("class")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6"><span class="word">Name</span>：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("name")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6">Email：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("email")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6">TEL：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("telephone")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6">FAX：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("fax")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6">Company：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("comname")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6">Address：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("comaddr")%></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#F6F6F6"><span class="word">Message</span>：</td>
    <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><%=rs("feedback")%></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#F6F6F6"><a href="manage_feedbacken.asp">back</a></td>
  </tr>
<%

rs.close
set rs=nothing
%>
</table>
<br>
<br>
</body>
</html>
