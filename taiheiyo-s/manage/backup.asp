<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<title>备份数据库</title>
<body text="#000000" link="#000000" vlink="#000000" alink="#000000">
<%
dim bkfolder
dim bkdbname
dim fso
dim folderpath,fso1,f
call main()
conn.close
set conn=nothing
sub main()
%>
<center>
<%
if request("action")="Backup" then
call backupdata()
else
%>
<table width="80%" border="0" cellpadding="1" cellspacing="1" bgcolor="#cccccc" style="border-collapse: collapse">
<form method="post" action="Backup.asp?action=Backup">
<tr>
<td width="100%" bgcolor="99cc00" align="center" height="30" bordercolor="#333333"><b>
<font color="#FFFFFF">备份数据库</font></b></td>
</tr>
<tr>
<td width="100%" bgcolor="#FFFFFF">
<font color="#FF0000">注意：</font>备份数据需要FSO组件支持，FSO组件的相关帮助请看微软网站！<br>　　　
所有路径都是相对与程序空间根目录的相对路径！</td>
 </tr>

<td width="100%" bgcolor="#FFFFFF">
<br>当前数据库路径：<input type=text size=24 name=DBpath value="../db.mdb">请正确添写您当前使用的数据库路径！
<br>备份数据库目录：<input type=text size=24 name=bkfolder value=backup> 如果目录不存在，程序将自动创建！
<br>备份数据库名称：<input type=text size=24 name=bkDBname value=databackup.mdb> 如果备份目录有该文件，将覆盖，如果没有，程序将自动创建！
<br><br><input type=submit value="开始备份">
</td>

<tr>
<td width="100%" bgcolor="#FFFFFF">
　　　在上面填写数据库路径及数据库完整名称，程序的默认数据库文件为master.asp<br>
　　　您可以用这个功能来备份您的数据库，以保证数据的安全！<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000">注:此功能谨慎使用,可能在
有些空间备份后,在本机上不能用ACCESS打开。</font></td>
</tr></form>
</table>
<%
end if
%>
</center>
<%
end sub

sub backupdata()
Dbpath=request.form("Dbpath")
Dbpath=server.mappath(Dbpath)
bkfolder=request.form("bkfolder")
bkdbname=request.form("bkdbname")
Set Fso=server.createobject("scripting.filesystemobject")
if fso.fileexists(dbpath) then
If CheckDir(bkfolder) = True Then
fso.copyfile dbpath,bkfolder& "\"& bkdbname
else
MakeNewsDir bkfolder
fso.copyfile dbpath,bkfolder& "\"& bkdbname
end if
response.write "数据库备份完成，请进行其他操作！<br>建立使用 FTP 工具将数据库备份，以保证数据安全"
else
response.write "找不到您所需要备份的文件！"
end if
end sub
Function CheckDir(FolderPath)
folderpath=Server.MapPath(".")&"\"&folderpath
Set fso1 = CreateObject("Scripting.FileSystemObject")
If fso1.FolderExists(FolderPath) then
CheckDir = True
Else
CheckDir = False
End if
Set fso1 = nothing
End Function
Function MakeNewsDir(foldername)
Set fso1 = CreateObject("Scripting.FileSystemObject")
Set f = fso1.CreateFolder(foldername)
MakeNewsDir = True
Set fso1 = nothing
End Function
%>
</body>
</html>
<html></html>