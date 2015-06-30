<%if session("admin_name")="" then%>
<script>alert("超时或非法登陆!请重新登陆!");top.location.href="default.asp"</script>
<%end if%>