<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=shift_jis" />
<title>太平洋商事株式会社</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>

<body style="margin:0px">
<!--#include file="top.asp" -->
<table cellspacing="0" cellpadding="0" width="900" border="0">
  <tbody>
    <tr>
      <td width="12" background="images/BG_01.gif"></td>
      <td width="165" valign="top" bgcolor="#FDFDFE"><!--#include file="left.asp" --></td>
      <td width="20" background="images/BG_02.gif"></td>
      <td align="left" valign="top"><table width="670" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse">
            <tr>
              <td><table width="100%" border="0" cellspacing="2">
                <tr>
                  <td><img src="images/t8.gif" width="670" height="39" /></td>
                </tr>
                <tr>
                  <td height="300" align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="8">
                    <tr>
                      <td style="line-height:28px"><%
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from news",conn,1,1
if rs.eof and rs.bof then
else
do while not rs.eof
%>
<a href="newsinfo.asp?id=<%=rs("id")%>" class="hei1"><%=rs("title")%></a>&nbsp;&nbsp;<b>[<%=year(rs("time"))&"年"&month(rs("time"))&"月"&day(rs("time"))&"日"%>]</b><br>
<%
rs.movenext
loop
end if
rs.close
set rs=nothing
%></td>
                    </tr>
                  </table></td>
                </tr>
                
              </table></td>
            </tr>
            
          </table>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <br /></td>
    </tr>
  </tbody>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
