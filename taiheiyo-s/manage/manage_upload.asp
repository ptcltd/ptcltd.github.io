<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<!--#include file="getimgsize.asp" -->

<%
if request("shanchu")="del" then
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from uploadimg where id="&request("id"),conn,1,3
img_name=rs("img_name")
rs.close
set rs=nothing
'response.Write(server.MapPath("../upload/"&img_name))
'response.End()
set myfile=server.CreateObject("scripting.filesystemobject")
myfile.deletefile server.MapPath("../upload/"&img_name)
set imgfile=nothing
conn.execute("delete from uploadimg where id="&request("id"))

response.Write("<script>alert('ͼƬ��ɾ��!');window.location='manage_upload.asp';</script>")
response.End()
end if

function imgtype(imgname)
response.Write("<img src='../upload/imgtype/"&right(imgname,3)&".gif'>")
end function


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1479" name=GENERATOR>
<link href="css.css" rel="stylesheet" type="text/css">
<script src="poptext.js" language="javascript"></script>
<title>��������</title>
</head>
<script language="javascript">
function shanchu(unid)     
   {     
      if(confirm("\n��ȷ��Ҫɾ����ͼƬ��"))     
      {     
        window.location.href="manage_upload.asp?shanchu=del&id="+unid;
      }        
   } 
</script>
<body>
<br>
<%
newpage=request("currentpage")
if trim(newpage)="" then
newpage=1
end if
  set rs=server.CreateObject("adodb.recordset")
  rs.activeconnection=conn
  rs.cursortype=1
  rs.pagesize=20
  rs.open"select * from uploadimg"
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr align="left" bgcolor="#FFFFFF"> 
    <td height="25" colspan="5" valign="middle" bgcolor="#f1f1f1"><font color="#FF3333">
&nbsp;&gt;&gt;�ϴ�ͼƬ����</font></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25" valign="middle"><strong>���</strong></td>
    <td height="25" valign="middle"><strong>ͼƬ��ŵ�ַ������</strong></td>
    <td height="25" valign="middle"><strong>ͼƬ����</strong></td>
    <td valign="middle"><strong>ͼƬ��С</strong></td>
    <td height="25" valign="middle"><strong>����</strong></td>
  </tr>
 <% if rs.eof and rs.bof then
response.Write("  <tr bgcolor='#FFFFFF'><td height='25' colspan='5'><div align='center'><font color=#ff0000>Ŀǰû���κ�����!!</font></div></td></tr>")
else
  rs.absolutepage=newpage
  i=1
  do while not rs.eof and i<=rs.pagesize
  %>
  <tr bgcolor="#FFFFFF"> 
    <td height="25" align="center"><%=rs("id")%></td>
    <td height="25" align="left">
	<%
	IMGPath="../upload/"&rs("img_name")

    Set PP = New ImgWHInfo  
     W = PP.imgW(Server.Mappath(IMGPath))  
     H = PP.imgH(Server.Mappath(IMGPath)) 
    Set pp = Nothing
							m=w/200:n=h/200
						if w>=200 or h>=200 then
							if m>n then
							   w1=200:h1=h/m
							elseif m<n then
							   h1=200:w1=w/n
							else
							   w1=200:h1=200
							end if
						else
							w1=w:h1=h
						end if
						if right(rs("img_name"),3)="swf" then%>
	<a title="<EMBED src='../upload/<%=rs("img_name")%>' quality=high TYPE='application/x-shockwave-flash'></EMBED>" href="../upload/<%=rs("img_name")%>" target=_blank><%=request.ServerVariables("server_name")&"/upload/"&rs("img_name")%></a>
						<%else%>
	<a title="<img src='../upload/<%=rs("img_name")%>' height=<%=h1%> width=<%=w1%>>" href="../upload/<%=rs("img_name")%>" target=_blank><%=request.ServerVariables("server_name")&"/upload/"&rs("img_name")%></a>
	                    <%end if%>
	</td>
    <td align="center">
	<%=imgtype(rs("img_name"))%>	</td>
    <td align="center">
	<%
	set myfile=server.CreateObject("scripting.filesystemobject")
	set imgfile=myfile.getfile(server.MapPath("/upload/"&rs("img_name")))
	response.Write(imgfile.size&"k")
	set imgfile=nothing
	%>
	</td>
    <td height="25" align="center">      <input type="button" name="Submit3" value="ɾ��" onClick="javascript:shanchu(<%=rs("id")%>)">
    </td></tr>
  <%
  rs.movenext
  i=i+1
  loop
  %>
  <tr bgcolor="#F1F1F1">
    <td height="25" colspan="5" align="center">
	ȫ����<%=rs.recordcount%>����Ա&nbsp;&nbsp;Ŀǰ��ʾ<%=i-1%>��&nbsp;&nbsp;��<%=newpage%>ҳ/��<%=rs.pagecount%>ҳ&nbsp;&nbsp;
      <%if newpage=1 then%>
      ��һҳ
      <%else%>
        <a href="manage_upload.asp?currentpage=<%=newpage-1%>">��һҳ</a>
      <%end if%>
      &nbsp;/&nbsp;
      <%if cint(newpage)=rs.pagecount then%>
      ��һҳ
      <%else%>
        <a href="manage_upload.asp?currentpage=<%=newpage+1%>">��һҳ</a>
      <%end if%>
    &nbsp;&nbsp;<a href="manage_upload.asp?currentpage=<%=rs.pagecount%>">βҳ</a>	</td>
  </tr><%  end if%>
</table>
<%

  rs.close
  set rs=nothing
%>
</body>
</html>
