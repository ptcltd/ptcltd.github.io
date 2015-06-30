<%
function checkpower(list,val)
if isnull(list) then
else
pid=split(list,",")
for i=0 to ubound(pid)
if trim(pid(i))=trim(val) then
checkpower="checked"
end if
next
end if
end function

function dvHTMLEncode(fString)
if not isnull(fString) then
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")

    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(9), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "<BR>")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
    'fString = Replace(fString, CHR(10), "<BR> ")

    dvHTMLEncode = fString
end if
end function
%>


