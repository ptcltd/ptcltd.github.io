<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<title>恢复数据库</title>
<body text="#000000" link="#000000" vlink="#000000" alink="#000000">
<%
call main()
conn.close
set conn=nothing
sub main()
%>
<center>
<%
if request("action")="Restore" then
dim dbpath,backpath,fso
Dbpath=request.form("Dbpath")
backpath=request.form("backpath")
if dbpath="" then
response.write "请输入您要恢复成的数据库完整名称"
else
Dbpath=server.mappath(Dbpath)
end if
backpath=server.mappath(backpath)
'Response.write Backpath
Set Fso=server.createobject("scripting.filesystemobject")
if fso.fileexists(dbpath) then  
fso.copyfile Dbpath,Backpath
response.write "数据库恢复完成，请进行其他操作！"
else
response.write "备份目录下没有找到您的备份文件！"
end if
else
%>
<table width="80%" border="0" cellpadding="1" cellspacing="1" bgcolor="cccccc" style="border-collapse: collapse">
<tr>
<td width="100%" height="30" bgcolor="#2B77BD" align="center">
<font color="#FFFFFF"><b>恢复数据库</b></font></td>
</tr>
<tr>
<td width="100%" bgcolor="#FFFFFF">
<font color="#FF0000">注意：</font>备份数据需要FSO组件支持，FSO组件的相关帮助请看微软网站！<br>　　　
所有路径都是相对与程序空间根目录的相对路径！
</td>
</tr>
<tr><form method="post" action="restore.asp?action=Restore">
<td width="100%" bgcolor="#FFFFFF">
<br>
　　　备份数据库路径：<input type=text size=24 name=dbpath value="backup/databackup.mdb"> 
如果文件不存在，将不能恢复！<BR>
　　　目标数据库路径：<input type=text size=24 name=backpath value="../db.mdb"> 
填写您当前使用的数据库路径！<p>
　　　如不想覆盖当前文件，可自行命名，然后修改conn.asp文件中相应连接。<br>
　　　如果目标文件名和当前使用数据库名一致的话，不需修改conn.asp文件。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000">&nbsp;注:此功能谨慎使用,可能在有些空间备份后,在本机上不能用ACCESS打开。</font><br><br>
  　　　　　　　　　　　　　　　　　<input type=submit value="开始恢复"> <br>
</td></form>
</tr>
<tr>
<td width="100%" bgcolor="#FFFFFF">
　　　在上面填写数据库路径及数据库完整名称，程序的默认备份数据库文件为backup/master.asp，请按照您的备份文件自行修改。<br>
　　　您可以用这个功能来备份您的数据库，以保证数据的安全！
</td>
</tr>
</table>
<%
end if
%>
</center>
<%
end sub
%>
</html>