<!--#include virtual="/user/tuichu.asp"-->
<html>
<head>
<link href="/comm/usercss.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body>
<%
if request("chuan") = "yes" then
dim filename,ranNum,formpath,iCount
Set Upload = Server.CreateObject("Persits.Upload") 
Upload.Save
For Each File in Upload.Files
 if file.size<0 then
 	response.write "<FIELDSET align=center><LEGEND align=center>�ļ��ϴ��������� </LEGEND><br>����ѡ����Ҫ�ϴ����ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</fieldset>"
	response.end
 end if
 	
 if file.size>300000 then
 	response.write "<FIELDSET align=center><LEGEND align=center>�ļ��ϴ��������� </LEGEND><br>�ļ���С���������� 300K��[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</fieldset>"
	response.end
 end if

 if file.Ext<>".gif" and file.Ext<>".jpg" and file.Ext<>".png" and file.Ext<>".bmp" and file.Ext<>".swf" then
 	response.write "<FIELDSET align=center><LEGEND align=center>�ļ��ϴ���������</LEGEND><br>�ļ���ʽ����ȷ ��[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</fieldset>"
	response.end
 end if 
 ranNum=int(900*rnd)+100
 formpath="/pic/movie/" 
 filename=formpath&"sm"&session("userid")&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&file.Ext
  
 File.SaveAsVirtual filename    ''�����ļ�
 	response.write "<script>parent.myform.smallimg.value='"&filename&"'</script>"
 set file=nothing
next
set upload=nothing  ''ɾ���˶���
response.write "ͼƬ�Ѿ��ɹ��ϴ���"
end if%>     <form name="form" method="post" action="?chuan=yes" enctype="multipart/form-data" >
      <input type="hidden" name="act" value="upload">
  <input name="st" type="file" class="wenbenkuang" id="st" size="20">
      
  <input name="Submit" type="submit" class="wenbenkuang" value="�ϴ�" onSubmit="javascript:document.form.submit;">
      </form></body></html>
