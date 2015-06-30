<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
if request("action")<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from config",conn,1,3
cn_about=request.form("cn_content")
en_about=request.form("en_content")
'jp_about=request.form("jp_content")
ko_about=request.form("ko_content")
        rs("cn_agent")=cn_about
		rs("en_agent")=en_about
		'rs("jp_agent")=jp_about
		rs("ko_agent")=ko_about

rs.update
rs.close
set rs=nothing
response.Write("<script>alert('修改成功!');window.location='manage_agent.asp';</script>")
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
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #FF0000}
-->
</style>
</head>
<body>
<br>
<table width="670" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <form name="myform" method="post" action="manage_agent.asp?action=edit">
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3"> 客户列表设置</span></td>
    </tr>
  
  <tr>
    <td width="110" height="25" align="right" valign="middle" bgcolor="#f1f1f1">中文：</td>
    <td width="537" height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content1" src="editor/ewebeditor.asp?id=cn_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="200"></IFRAME>')       
                        </script><input name="Content1" type="hidden" id="Content1" value="">
						<input name="cn_Content" type="hidden" id="cn_Content" value="<%=Server.HTMLEncode(rs("cn_agent"))%>"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">英文：</td>
    <td height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content2" src="editor/ewebeditor.asp?id=en_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="200"></IFRAME>')       
                        </script><input name="Content2" type="hidden" id="Content2" value="">
						<input name="en_Content" type="hidden" id="en_Content" value="<%=Server.HTMLEncode(rs("en_agent"))%>"></td>
  </tr>
  
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">韩文：</td>
    <td height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content4" src="editor/ewebeditor.asp?id=ko_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="200"></IFRAME>')       
                        </script><input name="Content4" type="hidden" id="Content4" value="">
						<input name="ko_Content" type="hidden" id="ko_Content" value="<%=Server.HTMLEncode(rs("ko_agent"))%>"></td>
  </tr>
  
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#f1f1f1"><input type="submit" name="Submit" value="提交"></td>
    </tr>
  </form>
</table>
<br>
<br>
</body>
</html>
