<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<title>�ָ����ݿ�</title>
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
response.write "��������Ҫ�ָ��ɵ����ݿ���������"
else
Dbpath=server.mappath(Dbpath)
end if
backpath=server.mappath(backpath)
'Response.write Backpath
Set Fso=server.createobject("scripting.filesystemobject")
if fso.fileexists(dbpath) then  
fso.copyfile Dbpath,Backpath
response.write "���ݿ�ָ���ɣ����������������"
else
response.write "����Ŀ¼��û���ҵ����ı����ļ���"
end if
else
%>
<table width="80%" border="0" cellpadding="1" cellspacing="1" bgcolor="cccccc" style="border-collapse: collapse">
<tr>
<td width="100%" height="30" bgcolor="#2B77BD" align="center">
<font color="#FFFFFF"><b>�ָ����ݿ�</b></font></td>
</tr>
<tr>
<td width="100%" bgcolor="#FFFFFF">
<font color="#FF0000">ע�⣺</font>����������ҪFSO���֧�֣�FSO�������ذ����뿴΢����վ��<br>������
����·��������������ռ��Ŀ¼�����·����
</td>
</tr>
<tr><form method="post" action="restore.asp?action=Restore">
<td width="100%" bgcolor="#FFFFFF">
<br>
�������������ݿ�·����<input type=text size=24 name=dbpath value="backup/databackup.mdb"> 
����ļ������ڣ������ָܻ���<BR>
������Ŀ�����ݿ�·����<input type=text size=24 name=backpath value="../db.mdb"> 
��д����ǰʹ�õ����ݿ�·����<p>
�������粻�븲�ǵ�ǰ�ļ���������������Ȼ���޸�conn.asp�ļ�����Ӧ���ӡ�<br>
���������Ŀ���ļ����͵�ǰʹ�����ݿ���һ�µĻ��������޸�conn.asp�ļ���<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000">&nbsp;ע:�˹��ܽ���ʹ��,��������Щ�ռ䱸�ݺ�,�ڱ����ϲ�����ACCESS�򿪡�</font><br><br>
  ����������������������������������<input type=submit value="��ʼ�ָ�"> <br>
</td></form>
</tr>
<tr>
<td width="100%" bgcolor="#FFFFFF">
��������������д���ݿ�·�������ݿ��������ƣ������Ĭ�ϱ������ݿ��ļ�Ϊbackup/master.asp���밴�����ı����ļ������޸ġ�<br>
����������������������������������ݿ⣬�Ա�֤���ݵİ�ȫ��
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