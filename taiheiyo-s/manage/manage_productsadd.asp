<!--#include file="tuichu1.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../checkhefa.asp" -->
<%
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
    alert("please input name");
	document.myform.cn_title.focus();
	return false;
  }




  return true;  
}

</script>

<html>
<head>

<link href="css.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=shift_jis">
<style type="text/css">
<!--
.STYLE3 {color: #FF0000}
-->
</style>
</head>
<body>
<br>
<table width="670" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <form name="myform" method="post" onSubmit="return CheckForm();" action="manage_productssave.asp?action=add">
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><span class="STYLE3">Add Products </span></td>
    </tr>
  <tr>
    <td width="110" height="25" align="right" valign="middle" bgcolor="#f1f1f1">Class Name:</td>
    <td width="537" height="25" align="left" valign="middle" bgcolor="#f1f1f1"><%
        sql = "select * from pClass where class_id=0"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "please input products class"
		else
		%>
                    <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
                      <option selected value="<%=trim(rs("id"))%>"><%=trim(rs("jp_ClassName"))%></option>
                      <%
			dim selclass
		    selclass=rs("id")
        	rs.movenext
		    do while not rs.eof
			%>
                      <option value="<%=trim(rs("id"))%>"><%=trim(rs("jp_ClassName"))%></option>
                      <%
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
                    </select> <select name="SmallClassName">
                      <option value="" selected>No Small Class</option>
                      <%
			sql="select * from pClass where class_id="&selclass
			rs.open sql,conn,1,1
			if not(rs.eof and rs.bof) then
			%>
                      <option value="<%=rs("id")%>"><%=rs("jp_ClassName")%></option>
                      <% rs.movenext
				do while not rs.eof%>
                      <option value="<%=rs("id")%>"><%=rs("jp_ClassName")%></option>
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
      </select></td>
  </tr>
  
  
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Product Name:</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input name="jp_title" type="text" id="jp_title" size="30"></td>
  </tr>
  
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Serial Number:</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input name="bianhao" type="text" id="bianhao" size="20"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Show the picture:</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><input type="radio" name="flag2" value="1">
yes
  <input name="flag2" type="radio" value="0" checked>
no</td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Small Image:</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><div align="center">
                        <iframe name="ad1" frameborder=0 width=100% height=180 scrolling=no src=../uploada1.asp?id=<%=ID%>></iframe>
                      </div>
      <input name="smallpic" type="hidden" id="smallpic"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Big Image:</td>
    <td height="25" align="left" valign="middle" bgcolor="#f1f1f1"><div align="center">
      <iframe name="ad2" frameborder=0 width=100% height=180 scrolling=no src=../uploada2.asp?id=<%=ID%>></iframe>
    </div>
      <input name="bigpic" type="hidden" id="bigpic"></td>
  </tr>
  
  
  <tr>
    <td height="25" align="right" valign="middle" bgcolor="#f1f1f1">Prodct Detailed:</td>
    <td height="200" align="left" valign="middle" bgcolor="#f1f1f1"><script language="JavaScript">
		   document.write ('<IFRAME ID="content3" src="editor/ewebeditor.asp?id=jp_content&style=edragon" frameborder="0" scrolling="no" width="100%" height="200"></IFRAME>')       
                        </script><input name="Content3" type="hidden" id="Content3" value="">
						<input name="jp_Content" type="hidden" id="jp_Content" value=""></td>
  </tr>
  
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#f1f1f1"><input type="submit" name="Submit" value="Submit"></td>
    </tr>
  </form>
</table>
<br>
<br>
</body>
</html>
