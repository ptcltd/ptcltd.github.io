<%
'��ֹ��ҳ����
Response.Buffer = True 
Response.ExpiresAbsolute = now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache"
'��֤������
dim yz
randomize timer
yz=Int((8999)*Rnd +1009)
session("ok")=yz
%>
<html>
<head>
<title>����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<script language="javascript">
	function checksignup() {

		if ( document.form.name.value == '' ) {
			window.alert('����������!!');
			document.form.name.focus();
			
		}
		else if ( document.form.pass.value == '' ) {
			window.alert('����������!!');
			document.form.pass.focus();
		}
		else if ( document.form.yz.value == '' ) {
			window.alert('��������ҳ����ʾ��4λ������֤��!!');
			document.form.yz.focus();
		}
else {
			return true;
			}
		return false;
	}
</script>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"><table width="508" height="457" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="top" background="images/bgimg.gif" class="bg_img"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="180">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="507" border="0" cellspacing="0" cellpadding="0" style="font-size:12px ">
                    <tr align="left">
                      <td width="223">&nbsp;</td>
                      <td width="284" rowspan="4" ><form name="form" method="post" action="logincheck.asp">
                        <table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr valign="middle">
                            <td width="76" height="20" align="center">
                              
        ����Ա���ƣ�</td>
                            <td width="204">
                              <div align="left">
                                <input name="name" type="text" class="wenbenkuang" id="name" value="<%=request("name")%>" size="20" maxlength="20">
                            </div></td>
                            </tr>
                          <tr valign="middle">
                            <td width="76" align="center">����Ա���룺</td>
                            <td width="204">
                              <div align="left">
                                <input name="pass" type="password" class="wenbenkuang" id="pass" value="<%=request("pass")%>" size="20" maxlength="20">
                            </div></td>
                          </tr>
                          <tr valign="middle">
                            <td width="76" align="center">������֤�룺</td>
                            <td width="204">
                              <input name="yz" type="password" class="wenbenkuang" id="yz" size="12" maxlength="5">
&nbsp; <span style="background-color: #E5F0FF"><font color="#ff3333"><%=yz%></font></span> </td>
                          </tr>
                          <tr valign="middle">
                            <td align="center">&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr valign="middle">
                            <td colspan="2" align="center"><input name="Submit5" type="submit" class="go-wenbenkuang" value="��¼" onClick="javascript:return checksignup()">
                              <input name="Submit23" type="reset" class="go-wenbenkuang" value="����">
                              <input name="Submit33" type="button" class="go-wenbenkuang" value="����" onClick="javascript:window.history.go(-1)"></td>
                            </tr>
                        </table>
                      </form></td>
                    </tr>
                    <tr align="left">
                      <td>&nbsp;</td>
                    </tr>
                    <tr align="left">
                      <td>&nbsp;</td>
                    </tr>
                    <tr align="left">
                      <td>&nbsp;</td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html> 

