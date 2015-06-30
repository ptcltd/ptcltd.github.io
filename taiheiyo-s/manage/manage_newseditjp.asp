<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
id=request("id")
if request("action")<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from news where id="&id,conn,1,3
rs("title")=trim(request("title"))
rs("time")=trim(request("datetime"))
rs("content")=trim(request("jp_content"))
rs.update
rs.close
set rs=nothing
response.Write("<script>alert('Modification success!');window.location='manage_newseditjp.asp?id="&id&"';</script>")
end if

set rs=server.createobject("adodb.recordset")
sql = "select * from news where id="&id
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
  <form name="myform" method="post" onSubmit="return CheckForm();" action="manage_newseditjp.asp?action=edit">
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3">Edit News </span></td>
    </tr>
  
  
  
  <tr>
    <td width="110" height="25" align="right" valign="middle" bgcolor="#f1f1f1">Title:</td>
    <td width="537" height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input name="title" type="text" id="title" value="<%=rs("title")%>" size="70">
      <input name="id" type="hidden" id="id" value="<%=id%>"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Date:</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input name="datetime" type="text" id="datetime" value="<%=rs("time")%>"></td>
  </tr>
  

  
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Content:</td>
    <td height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content3" src="editor/ewebeditor.asp?id=jp_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="400"></IFRAME>')       
                        </script><input name="Content3" type="hidden" id="Content3" value="">
						<input name="jp_Content" type="hidden" id="jp_Content" value="<%=Server.HTMLEncode(rs("content"))%>"></td>
  </tr>
  
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#f1f1f1"><input type="submit" name="Submit" value="Submit"></td>
    </tr>
  </form>
</table>
<br>
<br>
</body>
</html>
