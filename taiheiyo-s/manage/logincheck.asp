<!--#include file="conn.asp" -->
<!--#include file="../md5.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
	dim sql,rs,adminname,adminpass,yz,ok
	admin=trim(Request("name"))
	checkhefa(admin)
	password=trim(Request("pass"))
	yz=replace(ltrim(rtrim(request("yz"))),"'","‘")
    ok=replace(ltrim(rtrim(session("ok"))),"'","‘")
	if not yz=ok then
	  Response.Write "<script language=JavaScript>{window.alert('填入的验证码错误，请重新输入!');window.history.go(-1);}</script>"
	  response.end
    end if

	set rs = conn.execute("select * from admin where admin_name='"&admin&"' and admin_password='"&md5(password)&"'")
	if not(rs.bof and rs.eof) then
			session("admin_name")=rs("admin_name")				
			Response.Redirect "manage.asp"
	else
    	response.write "<script>alert(""用户名或密码错误，请检查！"");history.back();</script>"
	end if
	rs.close
	conn.close
	set rs=nothing
	set conn=nothing
%>