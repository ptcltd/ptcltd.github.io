<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
id=request("id")
bigclass=request("bigclass")


if request("add")<>"" then
cn_classname=request("cn_classname")
en_classname=request("en_classname")
'jp_classname=request("jp_classname")
'ko_classname=request("ko_classname")

if cn_classname="" then
response.Write("<script>alert('请输入中文小类名');window.history.go(-1);</script>")
response.End()
end if


set rs=server.CreateObject("adodb.recordset")
rs.open"select * from pclass",conn,1,3
rs.addnew
rs("cn_classname")=cn_classname
rs("en_classname")=en_classname
rs("class_id")=bigclass
'rs("jp_classname")=jp_classname
'rs("ko_classname")=ko_classname
rs.update
rs.close
set rs=nothing
response.Write("<script>alert('添加成功');window.location='manage_class.asp';</script>")
end if
%>
<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
  <form action="manage_addclass.asp" method="post">
    <td height="25" colspan="3" align="center" valign="middle" bgcolor="#f1f1f1">选择大类
      <select name="bigclass" id="bigclass">
	    <%
  set rs=server.CreateObject("adodb.recordset")
  rs.activeconnection=conn
  rs.open"select * from pclass where class_id=0"
  do while not rs.eof
  %>
        <option value="<%=rs("id")%>" <%if cint(bigclass)=rs("id") then%>selected<%end if%>><%=rs("cn_classname")&" "&rs("en_classname")%></option>
		<%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
      </select>    </td>
  </tr>
  <tr>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1">中文</td>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1">英文</td>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1">&nbsp;</td>
  </tr>
  <tr>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1"><input name="cn_classname" type="text" id="cn_classname" size="23"></td>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1"><input name="en_classname" type="text" id="en_classname" size="23"></td>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1"><input name="add" type="hidden" id="add" value="add">
    <input type="submit" name="Submit2" value="添加小类"></td>
	</form>
  </tr>
  
</table>
</body>
</html>
