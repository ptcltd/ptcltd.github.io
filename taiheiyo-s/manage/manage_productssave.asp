<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->

<%
action=request("action")
BigClassName=trim(request.form("BigClassName"))
SmallClassName=trim(request.form("SmallClassName"))
cn_Title=trim(request.form("cn_Title"))
en_Title=trim(request.form("en_Title"))
jp_Title=trim(request.form("jp_Title"))
ko_Title=trim(request.form("ko_Title"))
bianhao=trim(request.form("bianhao"))
smallpic=trim(request.form("smallpic"))
bigpic=trim(request.form("bigpic"))
cn_content=request.Form("cn_content")
en_content=request.form("en_content")
jp_content=request.form("jp_content")
ko_content=request.form("ko_content")
flag2=request("flag2")
'response.Write(en_content)

	set rs=server.createobject("adodb.recordset")
		sql="select top 1 * from Products" 
		rs.open sql,conn,1,3
		rs.addnew
        rs("bigclassname")=bigclassname
		rs("smallclassname")=smallclassname
		rs("cn_title")=cn_title
		rs("en_title")=en_title
		rs("jp_title")=jp_title
		rs("ko_title")=ko_title
		rs("bianhao")=bianhao
		rs("smallpic")=smallpic
		rs("bigpic")=bigpic
		rs("cn_content")=cn_content
		rs("en_content")=en_content
		rs("jp_content")=jp_content
		rs("ko_content")=ko_content
		rs("flag2")=flag2
		rs("updatetime")=now
		
		rs.update
		ID=rs("ID")
		rs.close
		set rs=nothing
		response.Write("<script>alert('success!');window.location='manage_productsadd.asp';</script>")

%>
