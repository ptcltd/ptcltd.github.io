<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<!--#include file="../md5.asp" -->

<%
xtype=request("xtype")
if xtype="modfiy" then
admin_name=trim(request("admin_name"))
old_password=trim(request("old_password"))
admin_password=request("admin_password")
com_password=request("com_password")

if admin_name="" then
response.Write("<script>alert('请输入管理员名！');window.history.go(-1);</script>")
response.End()
end if

if old_password="" then
response.Write("<script>alert('请输入旧密码！');window.history.go(-1);</script>")
response.End()
end if

if admin_password="" then
response.Write("<script>alert('请输入新密码！');window.history.go(-1);</script>")
response.End()
end if

if com_password="" then
response.Write("<script>alert('请输入重复密码！');window.history.go(-1);</script>")
response.End()
end if

if admin_password<>com_password then
response.Write("<script>alert('新密码与重复密码不同，请确认！');window.history.go(-1);</script>")
response.End()
end if

set rs=server.CreateObject("adodb.recordset")
rs.open"select * from admin",conn,1,3
if md5(old_password)<>rs("admin_password") then
response.Write("<script>alert('旧密码输入错误！');window.history.go(-1);</script>")
else
rs("admin_name")=admin_name
rs("admin_password")=md5(admin_password)
rs.update
response.Write("<script>alert('修改成功！');</script>")
end if
rs.close
set rs=nothing
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<title>船东管理</title>
</head>
<body>
<br>
<%
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from admin",conn,1,3
admin_name=rs("admin_name")
rs.close
set rs=nothing
%>
<form action="manage_admin.asp" method="post">
<table width="300" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr bgcolor="#FFFFFF"> 
    <td height="25" colspan="3" valign="middle" bgcolor="#f1f1f1">&nbsp; <font color="#FF3333">&gt;&gt;管理员密码设置</font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="81" height="25"><div align="center"><strong>管 理 员：</strong></div></td>
    <td width="216" height="25"><div align="center">
      <input name="admin_name" type="text" id="admin_name" value="<%=admin_name%>">
    </div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="25" align="center"><strong>旧 密 码：</strong></td>
    <td height="25" align="center"><input name="old_password" type="password" id="old_password"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center"><strong>新 密 码：</strong></td>
    <td height="25" align="center"><input name="admin_password" type="password" id="admin_password"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center"><strong>重复密码：</strong></td>
    <td height="25" align="center"><input name="com_password" type="password" id="com_password"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" colspan="2" align="center"><input name="xtype" type="hidden" id="xtype" value="modfiy">      <input type="submit" name="Submit" value="修改"></td>
  </tr>
</table></form>
</body>
</html>
