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
response.Write("<script>alert('���������Ա����');window.history.go(-1);</script>")
response.End()
end if

if old_password="" then
response.Write("<script>alert('����������룡');window.history.go(-1);</script>")
response.End()
end if

if admin_password="" then
response.Write("<script>alert('�����������룡');window.history.go(-1);</script>")
response.End()
end if

if com_password="" then
response.Write("<script>alert('�������ظ����룡');window.history.go(-1);</script>")
response.End()
end if

if admin_password<>com_password then
response.Write("<script>alert('���������ظ����벻ͬ����ȷ�ϣ�');window.history.go(-1);</script>")
response.End()
end if

set rs=server.CreateObject("adodb.recordset")
rs.open"select * from admin",conn,1,3
if md5(old_password)<>rs("admin_password") then
response.Write("<script>alert('�������������');window.history.go(-1);</script>")
else
rs("admin_name")=admin_name
rs("admin_password")=md5(admin_password)
rs.update
response.Write("<script>alert('�޸ĳɹ���');</script>")
end if
rs.close
set rs=nothing
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<title>��������</title>
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
    <td height="25" colspan="3" valign="middle" bgcolor="#f1f1f1">&nbsp; <font color="#FF3333">&gt;&gt;����Ա��������</font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="81" height="25"><div align="center"><strong>�� �� Ա��</strong></div></td>
    <td width="216" height="25"><div align="center">
      <input name="admin_name" type="text" id="admin_name" value="<%=admin_name%>">
    </div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="25" align="center"><strong>�� �� �룺</strong></td>
    <td height="25" align="center"><input name="old_password" type="password" id="old_password"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center"><strong>�� �� �룺</strong></td>
    <td height="25" align="center"><input name="admin_password" type="password" id="admin_password"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="center"><strong>�ظ����룺</strong></td>
    <td height="25" align="center"><input name="com_password" type="password" id="com_password"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" colspan="2" align="center"><input name="xtype" type="hidden" id="xtype" value="modfiy">      <input type="submit" name="Submit" value="�޸�"></td>
  </tr>
</table></form>
</body>
</html>
