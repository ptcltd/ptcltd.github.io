<link href="css/css.css" rel="stylesheet" type="text/css" />
<table cellspacing="0" cellpadding="0" width="165" 
            background="images/BG_03.gif" border="0">
        <tbody>
          <tr>
            <td style="PADDING-LEFT: 9px"><img 
                  src="images/TIT_M_search.gif" /><a href="index.asp"><img src="images/55.gif" width="65" height="28" border="0" /></a></td>
          </tr>
        </tbody>
        <form id="Search" name="Search" action="search.asp" 
              method="post">
          <script language="JavaScript" type="text/javascript">
  function SearchCheckMain(){
  if (document.Search.SearchStringMain.value=="")
   {alert("empyt!");Search.SearchStringMain.focus(); return (false); }
  }
  </script>
          <tr>
            <td align="middle" height="10"><input size="16" 
                  name="SearchStringMain" />
                  <input name="image" type="image" 
                  onclick="return SearchCheckMain();" 
                  src="images/BT_M_search.gif" align="absmiddle" 
              border="0" /></td>
          </tr>
        </form>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td align="middle"><table width="146" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center"><img src="images/b1.gif" width="146" height="24" /></td>
            </tr>
            <tr>
              <td height="100" align="center" valign="top" bgcolor="#E7F4D8"><table width="100%" border="0" cellspacing="0" cellpadding="3" style="font-size:13px">
<%set srs=server.CreateObject("adodb.recordset")
srs.open"select * from pclass where class_id=1",conn,1,1
do while not srs.eof%>
                <tr>
                  <td width="23%" align="right"><img src="images/nemo.gif" width="5" height="3" /></td>
                  <td width="77%" align="left"><a href="products.asp?id=<%=srs("id")%>" class="lv1"><%=srs("jp_classname")%></a></td>
                </tr>
<%
srs.movenext
loop
srs.close
set srs=nothing
%>
              </table></td>
            </tr>
            <tr>
              <td align="center"><img src="images/b2.gif" width="146" height="8" /></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td align="middle" height="7"></td>
        </tr>
        <tr>
          <td align="middle" bgcolor="#FFFFFF"><img src="images/ko_left1.gif" width="146" height="102" border="0" /></td>
        </tr>
        <tr>
          <td height="7" align="middle" bgcolor="#FFFFFF"></td>
        </tr>
        
        <tr>
          <td align="middle" bgcolor="#ffffff"><img src="images/email.gif" width="146" height="47" border="0" /><br />
            <table width="100%" border="0" cellspacing="0" cellpadding="5" style="font-size:12px">
              <tr>
                <td align="left" bgcolor="#FFFFFF" style="line-height:18px"><a href="mailto:kmnk_1031@ybb.ne.jp" class="hui1">íSìñ kmnk_1031@ybb.ne.jp</a><br />
<a href="mailto:admin@taiheiyo-s.com" class="hui1">ëçñ±ïî admin@taiheiyo-s.com</a><br />
                <a href="mailto:sales@taiheiyo-s.com" class="hui1">âcã∆ïî sales@taiheiyo-s.com</a><br />
	<a href="mailto:huweijp@hotmail.com" class="hui1">MSN
huweijp@hotmail.com</a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td bgcolor="#ffffff" height="7"></td>
        </tr>
        <tr>
          <td valign="bottom" bgcolor="#ffffff" height="43"><img 
                  src="images/TIT_04.gif" /></td>
        </tr>
      </table>