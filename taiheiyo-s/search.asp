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
                  <td><img src="images/t9.gif" width="670" height="39" /></td>
                </tr>
                <tr>
                  <td height="300" align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="8">
                    <tr>
                      <td align="center" style="line-height:25px"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td align="left" style="line-height:22px "></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px; font-size:12px"><strong>�����v���_�N�g</strong></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px; font-size:12px"></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;  font-size:12px"><hr></td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px; font-size:12px">�����̌��� <br>
                              <%
							  
SearchStringMain=request("SearchStringMain")
id=request("id")
connstr="select * from products where jp_title like '%"&SearchStringMain&"%' or bianhao like '%"&SearchStringMain&"%'"

nowpage=request("currentpage")
if nowpage="" then
nowpage=1
else
nowpage=cint(request("currentpage"))
end if

col=4
flag=0

set rs=server.CreateObject("adodb.recordset")
rs.activeconnection=conn
rs.cursortype=1
rs.pagesize=20
rs.open connstr
if rs.eof and rs.bof then
response.Write("<font color='#ff0000'>���ݐ��i���Ȃ�</font>")
else
rs.absolutepage=nowpage
j=0
k=1
do while not rs.eof
%>
                              <table width="100%">
                                <tr>
                                  <%for i=1 to col
   if i=col then
     flag=1
   end if
%>
                                  <td align="center" valign="top"><table width="90" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
                                      <tr>
                                        <td height="80" align="center" valign="top" style="line-height:14px"><%
	if rs.eof then
	response.Write("&nbsp;")
	else
	%>
                                            <a href="products_detail.asp?id=<%=rs("id")%>"><img src="<%=rs("smallpic")%>" width="90" height="90" border="0"></a><br>
                                            <font style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px"><%=rs("jp_title")&rs("bianhao")%></font>
                                            <%
	end if
	%>                                        </td>
                                      </tr>
                                  </table></td>
                                  <%
rs.movenext
j=j+1
if j>=rs.pagesize then
rs.move 1,2
end if
if rs.eof and flag=0 then
exit for
end if
if not rs.eof then
k=k+1
end if
next%>
                                </tr>
                              </table>
                            <%
loop
%>
                              <table  border="0" align="center" cellpadding="10" cellspacing="0" style="border-collapse:collapse;font-size:12px">
                                <tr>
                                  <td align="center">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="20" align="center"><a href="search.asp?currentpage=1&SearchStringMain=<%=SearchStringMain%>" class="hei1">�g�b�v&nbsp;</a>
                                      <%if nowpage=1 then%>
                                    �O�y�[�W
                                    <%else%>
                                    <a href="search.asp?currentpage=<%=nowpage-1%>&SearchStringMain=<%=SearchStringMain%>" class="hei1">�O�y�[�W</a>
                                    <%end if%>
                                    &nbsp;/&nbsp;
                                    <%if cint(nowpage)=rs.pagecount then%>
                                    ���y�[�W
                                    <%else%>
                                    <a href="search.asp?currentpage=<%=nowpage+1%>&SearchStringMain=<%=SearchStringMain%>" class="hei1">���y�[�W</a>
                                    <%end if%>
                                    &nbsp;&nbsp;<a href="search.asp?currentpage=<%=rs.pagecount%>&SearchStringMain=<%=SearchStringMain%>" class="hei1">�Ō�</a></td>
                                </tr>
                              </table>
                            <%
		  end if
rs.close
set rs=nothing

%>
                          </td>
                        </tr>
                        <tr>
                          <td align="left" valign="top" style="line-height:22px;font-size:12px"><hr></td>
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
