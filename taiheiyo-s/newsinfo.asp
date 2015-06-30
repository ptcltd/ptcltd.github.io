<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=shift_jis" />
<title>pacific trading co.,ltd</title>
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
                      <td align="center" style="line-height:28px"><%
if not isEmpty(request.QueryString("id")) then
id=request.QueryString("id")
else
id=1
end if

Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From news where id="&id, conn,3,3
rs("counter")=rs("counter")+1
rs.update
nCounter=rs("counter")
content=rs("content")
%>
                        <table width="560"  border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse ">
                          <tr>
                            <td height="300" align="center" valign="top" style="font-size:12px "><table width="95%"  border="0" cellspacing="0" cellpadding="0" style="font-size:12px; color:#666666">
                                <tr>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="30" align="center" style="font-size:14px "><strong><%=rs("title")%></strong></td>
                                </tr>
                                <tr>
                                  <td height="15" background="images/bg_fw_02.gif" class="imgbg01">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="30" align="center" valign="top">DATE：[<font color="#FF0000"><%=rs("time")%></font>]&nbsp;&nbsp;&nbsp; HIT[<font color="#FF0000"><%=rs("counter")%></font>]</td>
                                </tr>
                                <tr>
                                  <td style="line-height:22px; font-size:14px">&nbsp;&nbsp;&nbsp;&nbsp;<%=content%><br>
                                      <br>
                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:12px ">
                                        <tr>
                                          <td align="right">[<a href='javascript:window.print()' class="hui">Print</a>]&nbsp;[<a href='javascript:history.back()' class="hui">Back</a>]</td>
                                        </tr>
                                    </table></td>
                                </tr>
                              </table>
                                <br>
                            </td>
                          </tr>
                        </table>
                        <br>
                        <%rs.close
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
