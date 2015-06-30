<!--#include file="tuichu.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<html>
<head>
<title>不关联运价进行航线关联</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css.css" type="text/css">
</head>

<body>
<%
if request("guanlian")<>"" then
if trim(request("hxid"))="" then
   response.Write("<script>alert(""必须选择一条需要进行关联的航线！"");window.history.go(-1);</script>")
   response.end
end if
set rsxx=server.CreateObject("adodb.recordset")
sqlxx="select * from xiangxing where id="&request("xxid")&""
rsxx.open sqlxx,conn,1,3
rsxx("xx_hxid")=request("hxid")
rsxx.update
response.write "<script>alert('恭喜您，运价关联成功！');window.close();window.opener.location.reload();</script>"
response.end
end if

starport=trim(request("starport"))
endport=trim(request("endport"))
ownerid=trim(request("ownerid"))
set rs=server.CreateObject("adodb.recordset")
sql="select distan.id as distanid,destina.id as destinaid,*  from distan,destina where distan.id=destina.dest_hxid and path_sport="&starport&" and path_chuandong="&ownerid&" and dest_ddid="&endport&""
sql=sql&" order by dest_hxid asc"
rs.open sql,conn,1,3
if not rs.eof then%>
<form name="form1" method="post" action="">
<table width="100%" border=0 align="center" cellpadding=3 cellspacing=1 bgcolor=#CCCCCC class="9bang">
  <tr align="center">
    <td bgcolor="99cc00">选择</td>
    <td bgcolor="99cc00">所属船东 </td>
    <td bgcolor="99cc00">航线名称</td>
    <td bgcolor="99cc00">起始港ISO</td>
    <td bgcolor="99cc00">发班时间</td>
    <td bgcolor="99cc00">运营状态</td>
    <td bgcolor="ff9933">目的地ISO</td>
    <td bgcolor="ff9933">中转港 </td>
    <td bgcolor="ff9933">所需天数</td>
    <td bgcolor="ff9933">状态</td>
  </tr>
  <%while not rs.eof%>
  <tr>
    <td align="center" bgcolor="ffffff"><input type="radio" name="hxid" value="<%=rs("distanid")%>"></td>
    <td align="center" bgcolor="ffffff"><%set rsowner=conn.execute("select * from ship_owner where id="&rs("path_chuandong")&"")%>
        <a href="#" OnClick="Javascript:window.open('cdlxrmanage.asp?keywords=<%=rsowner("owner_cnjiancheng")%>','','width=800,height=450,top=10,left=180')"><%=rsowner("owner_cnjiancheng")%>(<%=rsowner("owner_enjiancheng")%>)</a></td>
    <td align="center" bgcolor="ffffff"><%=rs("path_name")%></td>
    <td align="center" bgcolor="ffffff"><%set rsstar=conn.execute("select * from city where id="&rs("path_sport")&"")%>
    <%=rsstar("city_iso")%></td>
    <td align="center" bgcolor="ffffff"><%=rs("path_sdate")%></td>
    <td align="center" bgcolor="ffffff"><%=rs("path_app")%></td>
    <td align="center" bgcolor="ffffff"><%set rsend=conn.execute("select * from city where id="&rs("dest_ddid")&"")%>
    <%=rsend("city_iso")%></td>
    <td align="center" bgcolor="ffffff"><%=rs("dest_zzg")%></td>
    <td align="center" bgcolor="ffffff"><%=rs("dest_ts")%>天</td>
    <td align="center" bgcolor="ffffff"><%=rs("dest_zt")%></td>
  </tr>
  <%rs.movenext  
  wend%>
  <tr>
    <td colspan="10" align="center" bgcolor="ffffff"><input name="guanlian" type="submit" id="guanlian" value="马上进行关联"></td>
  </tr>
</table>
</form>
<%else
response.write "<script>alert('没有发现与船东、发班地点、目的地点完全匹配的航线资料！按确定继续查找匹配船东、发班地点的航线！');</script>"
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from distan where path_sport="&starport&" and path_chuandong="&ownerid&""
rs2.open sql2,conn,1,3
if rs2.eof and rs2.bof then
response.write"<script>{if(confirm(""\n没有与此记录匹配的航线资料！要现在添加一条新的航线记录吗？"")){location.href=""hxedit.asp""; }} </script>"
else%>
<table width="100%" border=0 align="center" cellpadding=3 cellspacing=1 bgcolor=#CCCCCC class="9bang">
  <tr align="center">
    <td width="70" bgcolor="99cc00">操作</td>
    <td bgcolor="99cc00">所属船东 </td>
    <td bgcolor="99cc00">航线名称</td>
    <td bgcolor="99cc00">起始港ISO</td>
    <td bgcolor="99cc00">发班时间</td>
    <td bgcolor="99cc00">运营状态</td>
    <td bgcolor="ff9933">目的地ISO</td>
    <td bgcolor="ff9933">中转港 </td>
    <td bgcolor="ff9933">所需天数</td>
    <td bgcolor="ff9933">状态</td>
  </tr>
<%while not rs2.eof
  set rs3=server.CreateObject("adodb.recordset")
  sql3="select * from destina where dest_hxid="&rs2("id")&""
  rs3.open sql3,conn,1,3
  while not rs3.eof%>
  <tr>
    <td align="center" bgcolor="ffffff"><a href="hxedit.asp?modify=true&id=<%=rs2("id")%>">添加目的地</a></td>
    <td align="center" bgcolor="ffffff"><%set rsowner=conn.execute("select * from ship_owner where id="&rs2("path_chuandong")&"")%>
        <a href="#" OnClick="Javascript:window.open('cdlxrmanage.asp?keywords=<%=rsowner("owner_cnjiancheng")%>','','width=800,height=450,top=10,left=180')"><%=rsowner("owner_cnjiancheng")%>(<%=rsowner("owner_enjiancheng")%>)</a></td>
    <td align="center" bgcolor="ffffff"><%=rs2("path_name")%></td>
    <td align="center" bgcolor="ffffff"><%set rsstar=conn.execute("select * from city where id="&rs2("path_sport")&"")%>
        <%=rsstar("city_iso")%></td>
    <td align="center" bgcolor="ffffff"><%=rs2("path_sdate")%></td>
    <td align="center" bgcolor="ffffff"><%=rs2("path_app")%></td>
    <td align="center" bgcolor="ffffff"><%set rsend=conn.execute("select * from city where id="&rs3("dest_ddid")&"")%><%=rsend("city_iso")%></td>
    <td align="center" bgcolor="ffffff"><%=rs3("dest_zzg")%></td>
    <td align="center" bgcolor="ffffff"><%=rs3("dest_ts")%>天</td>
    <td align="center" bgcolor="ffffff"><%=rs3("dest_zt")%></td>
  </tr>
  <%rs3.movenext
  wend
  rs2.movenext  
  wend%>
</table>
<%end if
end if%>
</body>
</html>
