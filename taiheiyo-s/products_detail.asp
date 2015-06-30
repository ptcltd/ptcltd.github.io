<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=shift_jis" />
<title>pacific trading co.,ltd</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE3 {	font-size: 16px;
	font-weight: bold;
	color: #000000;
}
-->
</style>
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
                  <td><img src="images/t6.gif" width="670" height="39" /></td>
                </tr>
                <tr>
                  <td height="300" align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="8">
                    <tr>
                      <td align="center" style="line-height:25px"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                        
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px"><%

id=request("id")
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from products where id="&id,conn,1,1
set brs=server.CreateObject("adodb.recordset")
brs.open"select * from pclass where id="&rs("bigclassname"),conn,1,1
set srs=server.CreateObject("adodb.recordset")
srs.open"select * from pclass where id="&rs("smallclassname"),conn,1,1
%>
                            &gt;&gt;<a href="products.asp" class="hei1"><b><%=brs("jp_classname")%></b></a><strong>→</strong><a class="hei1" href="products.asp?id=<%=rs("smallclassname")%>" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px"><%=srs("jp_classname")%></a><strong>→</strong><font style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px"><%=rs("jp_title")&" "&rs("bianhao")%></font>
                            <%
brs.close
set brs=nothing
srs.close
set srs=nothing
 %></td>
                        </tr>
                        
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px"><hr></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px">&nbsp;</td>
                        </tr>
                        <tr>
                          <td align="center" valign="top" style="line-height:22px;  font-size:12px"><img src="<%=rs("bigpic")%>" border="0"></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px">&nbsp;</td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px"><hr></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;font-size:12px"><span class="STYLE3"><%=rs("jp_title")&" "&rs("bianhao")%></span></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px">&nbsp;</td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px; font-size:12px"><strong>製品の説明</strong></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px">&nbsp;</td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;font-size:12px"><%=rs("jp_content")%></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px">&nbsp;</td>
                        </tr>
                      </table></td>
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
