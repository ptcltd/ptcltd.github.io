<% 
' ���Ƿ���
function checkhefa(guanjian)
dim cuowu,xh
dim nothis(21)
nothis(0)="net user"
nothis(1)="xp_cmdshell"
nothis(2)="/add"
nothis(3)="exec%20master.dbo.xp_cmdshell"
nothis(4)="net localgroup administrators"
nothis(5)="select"
nothis(6)="count"
nothis(7)="asc"
nothis(8)="char"
nothis(9)="mid"
nothis(10)="'"
nothis(11)=":"
nothis(12)=""""
nothis(13)="insert"
nothis(14)="delete"
nothis(15)="drop"
nothis(16)="truncate"
nothis(17)="from"
nothis(18)="%"
nothis(19)="and"
nothis(20)="update"
nothis(21)="set"
cuowu=false
for xh= 0 to ubound(nothis)
if instr(guanjian,nothis(xh))<>0 then
cuowu=true
end if
next
if cuowu then
response.write "<script>alert(""�ܱ�Ǹ!��Ĳ�������������鿴���ǲ�������ˣ�ȷ����ֱ��ת����ҳ"");window.location.href=(""../index.asp"");</script>"
response.end
end if
end function

function checkhefa2(guanjian)
if not isnumeric(guanjian) then
response.write "<script>alert(""�ܱ�Ǹ!��Ĳ�������������鿴���ǲ�������ˣ�ȷ����ֱ��ת����ҳ"");window.location.href=(""../index.asp"");</script>"
response.end
end if
end function
%>