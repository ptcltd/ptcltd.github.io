<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<html>
<head>
<script language="javascript">
	<!--//
	function checksignup() {
		if ( document.form.MailServer.value == '' ) {
			window.alert('������SMTP��������ַ!!');
			document.form.MailServer.focus();
			return false;
		}
		if ( document.form.MailServerUserName.value == '' ) {
			window.alert('������SMTP��¼�û���!!');
			document.form.MailServerUserName.focus();
			return false;
		}
		if ( document.form.MailServerPassWord.value == '' ) {
			window.alert('SMTP��¼����!!');
			document.form.MailServerPassWord.focus();
			return false;
		}
		if ( document.form.MailDomain.value == '' ) {
			window.alert('�������ʼ���ַ!!');
			document.form.MailDomain.focus();
			return false;
		}
			return true;
			}
	//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<title></title>
</head>
<%
baocun=request("baocun")
MailServer=request("MailServer")
MailServerUserName=request("MailServerUserName")
MailServerPassWord=request("MailServerPassWord")
MailDomain=request("MailDomain")
sendname=request("sendname")
mailcontent=request("mailcontent")
set rs=server.CreateObject("adodb.recordset")
sql="select * from mail"
rs.open sql,conn,1,3

if baocun="save" then
rs("emp_mailsmtp")=MailServer
rs("emp_mailname")=MailServerUserName
rs("emp_mailpass")=MailServerPassWord
rs("emp_mailaddress")=MailDomain
rs("emp_mailtruename")=sendname
rs("emp_mailcontent")=mailcontent
rs.update
response.Write("<script>alert('������ɣ�');window.location='mailsetup.asp';</script>")
end if 
%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p>&nbsp;</p>
<form method="post" name="form">
  <table width="700" border="1" align="center" cellpadding="1" cellspacing="1" bordercolordark="#FFFFFF" bordercolrolight="000000">
    <tr bgcolor="#FFFFFF"> 
      
    <td height="25" colspan="2" valign="middle" bgcolor="#f1f1f1"><font color="#FF3333">�ʼ�������ã��û�����������������������䷢�ͣ�</font></td>
    </tr>

<tr> 
      <td width="201" height="25" class="tdbg"><strong>SMTP��������ַ��</strong><br>
        ���������ʼ���SMTP������<br>
    </td>
      <td height="25" class="tdbg"> 
	  <input name="MailServer" type="text" class="wenbenkuang" id="MailServer" value="<%=rs("emp_mailsmtp")%>" size="50">
        <font color="#FF0000"> * </font></td>
    </tr>
    <tr> 
      <td width="201" height="25" class="tdbg"><strong>SMTP��¼�û�����</strong><br>
        ����ķ�������ҪSMTP�����֤ʱ�������ô˲���</td>
      <td height="25" class="tdbg"> 
	  <input name="MailServerUserName" type="text" id="MailServerUserName" size="50"value="<%=rs("emp_mailname")%>"  class="wenbenkuang">
        <font color="#FF0000">*</font> </td>
    </tr>
    <tr> 
      <td width="201" height="25" class="tdbg"><strong>SMTP��¼���룺</strong><br>
        ����ķ�������ҪSMTP�����֤ʱ�������ô˲��� </td>
      <td height="25" class="tdbg"> 
	  <input name="MailServerPassWord" type="password" id="MailServerPassWord" size="50" value="<%=rs("emp_mailpass")%>" class="wenbenkuang">
        <font color="#FF0000">*</font> </td>
    </tr>
    <tr>
      <td height="25" class="tdbg"><strong>�ʼ���ַ</strong>��<br>
      </td>
      <td height="25" class="tdbg">
        <input name="MailDomain" type="text" id="MailDomain" size="50"  value="<%=rs("emp_mailaddress")%>" class="wenbenkuang">
        <font color="#FF0000">*</font> </td>
    </tr>
	<tr>
	  <td height="25" class="tdbg"><strong>Ԥ�����ݣ�</strong><br>
      �û�������%%%��ʾ<br>
      �û���������###��ʾ<br>
      </td>
	  <td height="25" class="tdbg"><textarea name="mailcontent" cols="85" rows="20" wrap="PHYSICAL" class="wenbenkuang" id="mailcontent"><%=rs("emp_mailcontent")%></textarea></td>
    </tr>
	<TR><TD colspan="2"><div align="center">
<input name="Submit" type="submit" class="go-wenbenkuang" value="�� ��" onClick="javascript:return checksignup()">		&nbsp;&nbsp;&nbsp;&nbsp;
        <input type=reset value="ȡ ��" class="go-wenbenkuang">
      </div></TD></TR>
</table>
<input type=hidden name="baocun" value="save">
</form>
</body>
<%
rs.close
set rs=nothing
%>
</html>
