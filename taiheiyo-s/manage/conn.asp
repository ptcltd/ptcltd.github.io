<!--#include file="../inc/Fy_SqlX.Asp" -->
<%
set conn=server.CreateObject("adodb.connection")
connstr="driver={microsoft access driver (*.mdb)};dbq="&Server.MapPath("../db.mdb")
conn.open connstr
%>
