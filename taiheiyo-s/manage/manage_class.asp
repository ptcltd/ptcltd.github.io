<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
if request("flag")="del" then
conn.execute("delete from pclass where id="&request("id")&"")
response.write "<script>alert('此信息删除成功！');window.location.href='manage_class.asp';</script>"
response.end
end if
id=request("id")
if id<>"" then
cn_classname=request("cn_classname")
en_classname=request("en_classname")
'jp_classname=request("jp_classname")
'ko_classname=request("ko_classname")

if cn_classname="" then
response.Write("<script>alert('请输入中文名');window.history.go(-1);</script>")
response.End()
end if


set rs=server.CreateObject("adodb.recordset")
rs.open"select * from pclass where id="&id,conn,1,3
rs("cn_classname")=cn_classname
rs("en_classname")=en_classname
'rs("jp_classname")=jp_classname
'rs("ko_classname")=ko_classname
rs.update
rs.close
set rs=nothing
response.Write("<script>alert('修改成功!');window.location='manage_class.asp';</script>")
end if

if request("add")<>"" then
cn_classname=request("cn_classname")
en_classname=request("en_classname")
'jp_classname=request("jp_classname")
'ko_classname=request("ko_classname")

if cn_classname="" then
response.Write("<script>alert('请输入中文大类名');window.history.go(-1);</script>")
response.End()
end if


set rs=server.CreateObject("adodb.recordset")
rs.open"select * from pclass",conn,1,3
rs.addnew
rs("cn_classname")=cn_classname
rs("en_classname")=en_classname
'rs("jp_classname")=jp_classname
'rs("ko_classname")=ko_classname
rs.update
rs.close
set rs=nothing
response.Write("<script>alert('添加成功');window.location='manage_class.asp';</script>")
end if
%>

<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function shanchu(unid)     
   {     
      if(confirm("\n你确认要删除此类吗？"))     
      {     
        window.location.href="manage_class.asp?flag=del&id="+unid;
      }        
   } 
</script></head>
<body>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr><form action="manage_class.asp" method="post">
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1"><input name="cn_classname" type="text" id="cn_classname" size="23"></td>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1"><input name="en_classname" type="text" id="en_classname" size="23"></td>
    <td height="25" align="center" valign="middle" bgcolor="#f1f1f1"><input name="add" type="hidden" id="add" value="add">
    <input type="submit" name="Submit2" value="添加大类"></td>
	</form>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="25"><div align="center"><strong>中文大类名</strong></div></td>
    <td height="25"><div align="center"><strong>英文大类名</strong></div></td>
    <td height="25" align="center"><strong>管理<strong></td>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  rs.activeconnection=conn
  rs.open"select * from pclass where class_id=0"
  if rs.bof and rs.eof then
  response.Write("<tr><td colspan='5'><font color='#ff0000'>目前没有大分类</font></td></tr>")
  else
  do while not rs.eof
  %>
  <tr bgcolor="#FFFFFF"> 
  <form action="manage_class.asp" method="post">
    <td height="25" align="center"><input style=" color:#FF0000" name="cn_classname" type="text" id="cn_classname" size="23" value="<%=rs("cn_classname")%>"></td>
    <td height="25" align="center"><input style=" color:#FF0000" name="en_classname" type="text" id="en_classname" size="23" value="<%=rs("en_classname")%>"></td>
    <td height="25" align="center"><input name="id" type="hidden" value="<%=rs("id")%>">
      <input type="button" name="Submit4" value="添加小类" onClick="window.location='manage_addclass.asp?bigclass=<%=rs("id")%>';">
      <input type="submit" name="Submit" value="修改">
      <input type="button" name="Submit3" value="删除" onClick="javascript:shanchu(<%=rs("id")%>)"></td>
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
			<tr bgcolor="#FFFFFF"><form action="manage_class.asp" method="post"><td colspan="3" align="center"><input name="cn_classname" type="text" class="txtbg" id="cn_classname" value="<%=srs("cn_classname")%>" size="20">
			  <input name="en_classname" type="text" class="txtbg" id="en_classname" value="<%=srs("en_classname")%>" size="20">
			    <input name="id" type="hidden" id="id" value="<%=srs("id")%>">
			    <input type="submit" class="go-wenbenkuang" value="修改">
			      <label>
			      <input name="Submit5" type="button" class="go-wenbenkuang" value="删除" onClick="javascript:shanchu(<%=srs("id")%>)">
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
