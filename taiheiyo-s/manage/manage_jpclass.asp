<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
if request("flag")="del" then
conn.execute("delete from pclass where id="&request("id")&"")
response.write "<script>alert('delete Succeed!');window.location.href='manage_jpclass.asp';</script>"
response.end
end if
id=request("id")
if id<>"" then
jp_classname=request("jp_classname")

'jp_classname=request("jp_classname")
'ko_classname=request("ko_classname")

if jp_classname="" then
response.Write("<script>alert('please input japanese name!');window.history.go(-1);</script>")
response.End()
end if


set rs=server.CreateObject("adodb.recordset")
rs.open"select * from pclass where id="&id,conn,1,3
'rs("cn_classname")=cn_classname
'rs("en_classname")=en_classname
rs("jp_classname")=jp_classname
'rs("ko_classname")=ko_classname
rs.update
rs.close
set rs=nothing
response.Write("<script>alert('Modification success!');window.location='manage_jpclass.asp';</script>")
end if
%>

<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=shift_jis">
<script language="javascript">
function shanchu(unid)     
   {     
      if(confirm("\nDo you confirm to want the deletion this kind!"))     
      {     
        window.location.href="manage_jpclass.asp?flag=del&id="+unid;
      }        
   } 
</script></head>
<body>
<br>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  
  <tr bgcolor="#FFFFFF"> 
    <td height="25">&nbsp;</td>
    <td height="25"><div align="center"><strong>Japanese Name</strong></div></td>
    <td height="25" align="center"><strong>Mange<strong></td>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  rs.activeconnection=conn
  rs.open"select * from pclass where class_id=0"
  if rs.bof and rs.eof then
  response.Write("<tr><td colspan='5'><font color='#ff0000'>NO Class!</font></td></tr>")
  else
  do while not rs.eof
  %>
  <tr bgcolor="#FFFFFF"> 
  <form action="manage_jpclass.asp" method="post">
    <td height="25" align="center">&nbsp;</td>
    <td height="25" align="center"><input style=" color:#FF0000" name="jp_classname" type="text" id="jp_classname" size="30" value="<%=rs("jp_classname")%>"></td>
    <td height="25" align="center"><input name="id" type="hidden" value="<%=rs("id")%>">
      <input name="Submit4" type="button" onClick="window.location='manage_addclassjp.asp?bigclass=<%=rs("id")%>';" value="Add SmallClass">
      <input type="submit" name="Submit" value="Modify">
      <input type="button" name="Submit3" value="delete" onClick="javascript:shanchu(<%=rs("id")%>)"></td>
  </form>
  </tr>
  <%
  		  set srs=server.CreateObject("adodb.recordset")
		  srs.activeconnection=conn
		  srs.open"select * from pclass where class_id="&rs("id")
		  if srs.bof and srs.eof then
	      else
		    do while not srs.eof
			%>
			<tr bgcolor="#FFFFFF"><form action="manage_jpclass.asp" method="post"><td colspan="3" align="center" bgcolor="#F0F0F0"><input name="jp_classname" type="text" class="txtbg" id="jp_classname" value="<%=srs("jp_classname")%>" size="25">
			    <input name="id" type="hidden" id="id" value="<%=srs("id")%>">
			    <input type="submit" class="go-wenbenkuang" value="modify">
			      <label>
			      <input name="Submit5" type="button" class="go-wenbenkuang" value="delete" onClick="javascript:shanchu(<%=srs("id")%>)">
			      </label>
			<td></form><tr>
			  <%
			srs.movenext
			loop
	      end if

   
  rs.movenext
  loop
  end if
  rs.close
  set rs=nothing
  
  %>
</table>
</body>
</html>
