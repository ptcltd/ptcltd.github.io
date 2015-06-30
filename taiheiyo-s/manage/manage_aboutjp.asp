<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
if request("action")<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from config",conn,1,3
'cn_about=request.form("cn_content")
'en_about=request.form("en_content")
jp_about=request.form("jp_content")
'ko_about=request.form("ko_content")
        'rs("cn_about")=cn_about
		'rs("en_about")=en_about
		rs("jp_about")=jp_about
		'rs("ko_about")=ko_about

rs.update
rs.close
set rs=nothing
response.Write("<script>alert('success!');window.location='manage_aboutjp.asp';</script>")
end if

dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from config"
rs.open sql,conn,1,1
%>

<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=shift_jis">
<style type="text/css">
<!--
.STYLE3 {color: #FF0000}
-->
</style>
</head>
<body>
<br>
<table width="670" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <form name="myform" method="post" action="manage_aboutjp.asp?action=edit">
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3"> about us </span></td>
    </tr>
  
  <tr>
    <td width="110" height="25" align="right" valign="middle" bgcolor="#f1f1f1">japanese</td>
    <td width="537" height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content3" src="editor/ewebeditor.asp?id=jp_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="400"></IFRAME>')       
                        </script><input name="Content3" type="hidden" id="Content3" value="">
						<input name="jp_Content" type="hidden" id="jp_Content" value="<%=Server.HTMLEncode(rs("jp_about"))%>"></td>
  </tr>
  
  
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#f1f1f1"><input type="submit" name="Submit" value="submit"></td>
    </tr>
  </form>
</table>
<br>
<br>
</body>
</html>
