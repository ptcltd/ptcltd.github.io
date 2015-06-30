<%
function delgl(str)
dlist=""
dstr=split(session("port"),",")
for i=0 to ubound(dstr)
 if trim(dstr(i))<>trim(str) then
   if dlist="" then
   dlist=dstr(i)
   else
   dlist=dlist&","&dstr(i)
   end if
 end if
next
delgl=dlist
end function

%>
