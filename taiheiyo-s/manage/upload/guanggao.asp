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
 	response.write "<FIELDSET align=center><LEGEND align=center>文件上传发生错误 </LEGEND><br>请先选择你要上传的文件　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</fieldset>"
	response.end
 end if
 	
 if file.size>300000 then
 	response.write "<FIELDSET align=center><LEGEND align=center>文件上传发生错误 </LEGEND><br>文件大小超过了限制 300K　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</fieldset>"
	response.end
 end if

 if file.Ext<>".gif" and file.Ext<>".jpg" and file.Ext<>".png" and file.Ext<>".bmp" and file.Ext<>".swf" then
 	response.write "<FIELDSET align=center><LEGEND align=center>文件上传发生错误</LEGEND><br>文件格式不正确 　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</fieldset>"
	response.end
 end if 
 ranNum=int(900*rnd)
 formpath="/pic/gg/"
 filename=formpath&session("userid")&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&file.Ext

 File.SaveAsVirtual filename    ''保存文件
 	response.write "<script>parent.myform.xt.value='"&filename&"'</script>"
 set file=nothing
next
set upload=nothing  ''删除此对象
response.write "广告文件上传成功！"
end if%>     <form name="form" method="post" action="?chuan=yes" enctype="multipart/form-data" >
      <input type="hidden" name="act" value="upload">
  <input name="st" type="file" class="wenbenkuang" id="st" size="20">
      
  <input name="Submit" type="submit" class="wenbenkuang" value="上传" onSubmit="javascript:document.form.submit;" <%if session("setupself")<>1 then%>disabled<%end if%>>
      </form></body></html>
