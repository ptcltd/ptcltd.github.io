<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
id=request("id")
if request("action")<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from products where id="&id,conn,1,3
BigClassName=trim(request.form("BigClassName"))
SmallClassName=trim(request.form("SmallClassName"))
cn_Title=trim(request.form("cn_Title"))
en_Title=trim(request.form("en_Title"))
bianhao=trim(request.form("bianhao"))
smallpic=trim(request.form("smallpic"))
bigpic=trim(request.form("bigpic"))
cn_content=request.Form("cn_content")
en_content=request.form("en_content")
        rs("bigclassname")=bigclassname
		rs("smallclassname")=smallclassname
		rs("cn_title")=cn_title
		rs("en_title")=en_title
		rs("bianhao")=bianhao
		rs("cn_content")=cn_content
		rs("en_content")=en_content
        if smallpic<>"" then
		rs("smallpic")=smallpic
		end if
		if bigpic<>"" then
		rs("bigpic")=bigpic
		end if

rs.update
rs.close
set rs=nothing
response.Write("<script>alert('Modification success!');window.location='manage_producteditcn.asp?id="&id&"';</script>")
end if

set prs=server.createobject("adodb.recordset")
prs.open "select * from products where id="&id,conn,1,1
bigid=prs("bigclassname")
smallid=prs("smallclassname")
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from pClass where class_id<>0"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("cn_ClassName"))%>","<%= trim(rs("class_id"))%>","<%= trim(rs("id"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    

function CheckForm()
{
  if (document.myform.cn_title.value=="")
  {
    alert("��Ʒ���Ʋ���Ϊ�գ�");
	document.myform.cn_title.focus();
	return false;
  }




  return true;  
}

</script>

<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #FF0000}
-->
</style>
</head>
<body>
<br>
<table width="670" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <form name="myform" method="post" action="manage_producteditcn.asp?action=edit">
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3"> �޸Ĳ�Ʒ</span></td>
    </tr>
  <tr>
    <td width="110" height="25" align="right" valign="middle" bgcolor="#f1f1f1">�������</td>
    <td width="537" height="25" align="left" valign="middle" bgcolor="#f1f1f1"><%
        sql = "select * from pClass where class_id=0"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "���������Ŀ��"
		else
		%>
                    <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
                      <option selected value="<%=trim(rs("id"))%>"><%=trim(rs("cn_ClassName"))%></option>
                      <%
			dim selclass
		    selclass=rs("id")
        	rs.movenext
		    do while not rs.eof
			%>
                      <option value="<%=trim(rs("id"))%>" <%if rs("id")=cint(bigid) then%> selected<%end if%>><%=trim(rs("cn_ClassName"))%></option>
                      <%
				if rs("id")=cint(bigid) then
				selclass=rs("id")
				end if	  
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
                    </select> <select name="SmallClassName">
                      <option value="" selected>��ָ��С��</option>
                      <%
			sql="select * from pClass where class_id="&selclass
			rs.open sql,conn,1,1
			if not(rs.eof and rs.bof) then
			%>
                      <option value="<%=rs("id")%>" <%if rs("id")=cint(smallid) then%> selected<%end if%>><%=rs("cn_ClassName")%></option>
                      <% rs.movenext
				do while not rs.eof%>
                      <option value="<%=rs("id")%>" <%if rs("id")=smallid then%> selected<%end if%>><%=rs("cn_ClassName")%></option>
                      <%
			    	rs.movenext
				loop
			end if
	        rs.close
			%>
                      <%
			ranNum=int(9*rnd)+10
			iddata=month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum
			%>
      </select>
      <input name="id" type="hidden" id="id" value="<%=id%>"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">��Ʒ���ƣ�</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input name="cn_title" type="text" id="cn_title" value="<%=prs("cn_title")%>" size="30"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Ӣ�����ƣ�</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input name="en_title" type="text" id="en_title" value="<%=prs("en_title")%>" size="30"></td>
  </tr>
  
  
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">��Ʒ��ţ�</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input name="bianhao" type="text" id="bianhao" value="<%=prs("bianhao")%>" size="20"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">��ƷͼƬ��Сͼ����</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><div align="center">
                        <iframe name="ad1" frameborder=0 width=100% height=180 scrolling=no src=../uploada1.asp?id=<%=ID%>></iframe>
                      </div>
      <input name="smallpic" type="hidden" id="smallpic"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">��ƷͼƬ����ͼ����</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><div align="center">
      <iframe name="ad2" frameborder=0 width=100% height=180 scrolling=no src=../uploada2.asp?id=<%=ID%>></iframe>
    </div>
      <input name="bigpic" type="hidden" id="bigpic"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">��Ʒ˵�������ģ���</td>
    <td height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content1" src="editor/ewebeditor.asp?id=cn_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="200"></IFRAME>')       
                        </script><input name="Content1" type="hidden" id="Content1" value="">
						<input name="cn_Content" type="hidden" id="cn_Content" value="<%=Server.HTMLEncode(prs("cn_content"))%>"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">��Ʒ˵����Ӣ�ģ���</td>
    <td height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content2" src="editor/ewebeditor.asp?id=en_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="200"></IFRAME>')       
                        </script><input name="Content2" type="hidden" id="Content2" value="">
						<input name="en_Content" type="hidden" id="en_Content" value="<%=Server.HTMLEncode(prs("en_content"))%>"></td>
  </tr>
  
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#f1f1f1"><input type="submit" name="Submit" value="�ύ"></td>
    </tr>
  </form>
</table>
<br>
<br>
</body>
</html>
