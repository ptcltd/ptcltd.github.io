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
response.Write(en_content)

	set rs=server.createobject("adodb.recordset")
	if request("action")="add" then
		sql="select top 1 * from Products" 
		rs.open sql,conn,1,3
		rs.addnew

		rs.update
		ID=rs("ID")
		rs.close
		set rs=nothing
	elseif request("action")="Modify" then
  		if ArticleID<>"" then
			sql="select * from Product where articleid=" & ArticleID
			rs.open sql,conn,1,3
			if not (rs.bof and rs.eof) then
				call SaveData()
				rs.update
				rs.close
				set rs=nothing
 			else
				founderr=true
				errmsg=errmsg+"<li>�Ҳ��������£������Ѿ���������ɾ����</li>"
				call WriteErrMsg()
			end if
		else
			founderr=true
			errmsg=errmsg+"<li>����ȷ��ArticleID��ֵ</li>"
			call WriteErrMsg()
		end if
	else
       response.Write("<li>�����ˣ�û��ѡ������</li>")
	end if

%>
