<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<title>�������ݿ�</title>
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
<font color="#FFFFFF">�������ݿ�</font></b></td>
</tr>
<tr>
<td width="100%" bgcolor="#FFFFFF">
<font color="#FF0000">ע�⣺</font>����������ҪFSO���֧�֣�FSO�������ذ����뿴΢����վ��<br>������
����·��������������ռ��Ŀ¼�����·����</td>
 </tr>

<td width="100%" bgcolor="#FFFFFF">
<br>��ǰ���ݿ�·����<input type=text size=24 name=DBpath value="../db.mdb">����ȷ��д����ǰʹ�õ����ݿ�·����
<br>�������ݿ�Ŀ¼��<input type=text size=24 name=bkfolder value=backup> ���Ŀ¼�����ڣ������Զ�������
<br>�������ݿ����ƣ�<input type=text size=24 name=bkDBname value=databackup.mdb> �������Ŀ¼�и��ļ��������ǣ����û�У������Զ�������
<br><br><input type=submit value="��ʼ����">
</td>

<tr>
<td width="100%" bgcolor="#FFFFFF">
��������������д���ݿ�·�������ݿ��������ƣ������Ĭ�����ݿ��ļ�Ϊmaster.asp<br>
����������������������������������ݿ⣬�Ա�֤���ݵİ�ȫ��<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000">ע:�˹��ܽ���ʹ��,������
��Щ�ռ䱸�ݺ�,�ڱ����ϲ�����ACCESS�򿪡�</font></td>
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
response.write "���ݿⱸ����ɣ����������������<br>����ʹ�� FTP ���߽����ݿⱸ�ݣ��Ա�֤���ݰ�ȫ"
else
response.write "�Ҳ���������Ҫ���ݵ��ļ���"
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