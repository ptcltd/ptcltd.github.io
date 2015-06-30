<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=shift_jis" />
<title>太平洋商事株式会社</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>

<body style="margin:0px">
<!--#include file="top.asp" -->
<table cellspacing="0" cellpadding="0" width="900" border="0">
  <tbody>
    <tr>
      <td width="12" background="images/BG_01.gif"></td>
      <td width="165" valign="top" bgcolor="#FDFDFE"><!--#include file="left.asp" --></td>
      <td width="20" background="images/BG_02.gif"></td>
      <td align="left" valign="top"><table width="670" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse">
            <tr>
              <td><table width="100%" border="0" cellspacing="2">
                <tr>
                  <td><img src="images/t7.gif" width="670" height="39" /></td>
                </tr>
                <tr>
                  <td height="300" align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="8">
                    <tr>
                      <td align="center" style="line-height:25px">
<script language="javascript">
										 function  FormCheck()
										 {
										   if (document.form1.name.value=="")
										   {
										    alert("Please Input Name!");
										    document.form1.name.focus();											
										    return false;
										   }
										    if (document.form1.EMAIL.value=="")
										   {
										    alert("Please Input Email!");
										    document.form1.EMAIL.focus();											
										    return false;
										   }
										   return true;
										 }										
</script>
<%
if Request.Form("action")="add" then

 purpose=Trim(Request.Form("purpose"))
 FeedbackClass=Trim(Request.Form("about"))
 Feedback=Trim(Request.Form("message"))
 Name=Trim(Request.Form("name"))										
 Email=Trim(Request.Form("EMAIL"))
 Telephone=Trim(Request.Form("Telephone"))
 Fax=Trim(Request.Form("Fax"))									
 ComName=Trim(Request.Form("Company"))										
 ComAddr=Trim(Request.Form("Address"))	

 conn.Execute("insert into FeedbackJp(QorA,Class,FeedBack,Name,Email,Telephone,Fax,ComName,ComAddr) values('"&purpose&"','"&FeedbackClass&"','"&Feedback&"','"&Name&"','"&Email&"','"&Telephone&"','"&Fax&"','"&ComName&"','"&ComAddr&"')")

 Response.Write "<script language='javascript'>alert('Thanks For Your FeedBack!');document.location.href='feedback.asp';</script>"
 Response.End()
 End if
%>

					  <form name="form1" method="post" action="feedback.asp" onSubmit="return FormCheck();">
                                            <table bordercolor=#FFFFFF cellspacing=0 
                  bordercolordark=#ffffff cellpadding=5 width="92%" align=center 
                  bgcolor=#FFFFFF bordercolorlight=#333333 border=0 style="font-size:12px">
                                              <center>
                                                <tr> 
                                                  <td colspan=2 height="25"><font color="#003366">
                                                    <b>オンライン伝言板にてご意見やご感想をどうぞ：</b></font></td>
                                                </tr>
                                                <tr> 
                                                  <td width="30%" height="25"> 
                                                    <p><b>オンラインフィードバック表</b> </p>
                                                  </td>
                                                  <td width="70%" align="left">
                                                    <input type=radio value=意見 
                        name=purpose>
                                                    意見 
                                                    <input type=radio CHECKED 
                        value=advice name="アドバイス">
                                                  アドバイス</td>
                                                </tr>
                                                <tr> 
                                                  <td width="30%" height="25">何についてですか</td>
                                                  <td width="70%" align="left">
                                                    <select name=about>
                                                       <option value=Webサイト selected>Webサイト</option>
                                                      <option value=製品>製品</option>
                                                      <option value=協力>協力</option>
                                                      <option value=アフターサービス>アフターサービス</option>
                                                      <option value=その他>その他</option>
                                                    </select>
                                                  </td>
                                                </tr>
                                                <tr> 
                                                  <td colspan=2 height="25">
                                                     メッセージをどうぞ： </td>
                                                </tr>
                                                <tr align=middle> 
                                                  <td colspan=2> 
                                                    <div align=center> 
                                                      <p> 
                                                        <textarea name="message" rows=5 cols=55></textarea>
                                                        <br>
                                                      </p>
                                                    </div>
                                                  </td>
                                                </tr>
                                                <tr> 
                                                  <td colspan=2 height="25"><font color="#FF6600"><b>ご連絡先：</b></font></td>
                                                </tr>
                                                <tr align=middle> 
                                                  <center>
                                                    <center>
                                                      <td align=right width="30%">お名前：</td>
                                                    </center>
                                                  </center>
                                                  <td align=middle width="70%"> 
                                                    <p align=left>
<input maxlength=256 size=35 
                        name=Name>
                                                    </p>
                                                  </td>
                                                </tr>
                                                <tr align=middle> 
                                                  <center>
                                                    <center>
                                                      <td align=right width="30%">Eメール：</td>
                                                    </center>
                                                  </center>
                                                  <td align=middle width="70%"> 
                                                    <p align=left>
                                                      <input maxlength=256 size=35 
                        name=EMAIL>
                                                    </p>
                                                  </td>
                                                </tr>
                                                <tr align=middle> 
                                                  <center>
                                                    <center>
                                                      <td align=right width="30%">Tel:</td>
                                                    </center>
                                                  </center>
                                                  <td align=middle width="70%"> 
                                                    <p align=left>
                                                      <input maxlength=256 size=35 
                        name=Telephone>
                                                    </p>
                                                  </td>
                                                </tr>
                                                <tr align=middle> 
                                                  <center>
                                                    <center>
                                                      <td align=right width="30%">Fax:</td>
                                                    </center>
                                                  </center>
                                                  <td align=middle width="70%"> 
                                                    <p align=left>
                                                      <input maxlength=256 size=35 name=Fax>
                                                    </p>
                                                  </td>
                                                </tr>
                                                <tr align=middle> 
                                                  <center>
                                                    <center>
                                                      <td align=right width="30%">会社名：</td>
                                                    </center>
                                                  </center>
                                                  <td align=middle width="70%"> 
                                                    <p align=left>
<input maxlength=256 size=35 
                        name=Company>
                                                    </p>
                                                  </td>
                                                </tr>
                                                <tr align=middle> 
                                                  <center>
                                                    <center>
                                                      <td align=right width="30%">Address:</td>
                                                    </center>
                                                  </center>
                                                  <td align=middle width="70%"> 
                                                    <p align=left>
                                                      <input maxlength=256 size=35 
                        name=Address>
                                                    </p>
                                                  </td>
                                                </tr>
                                                <center>
                                                  <center>
                                                    <tr align=middle> 
                                                      <td width="30%"><br>
                                                      </td>
                                                      <td align="left"> <img width=20 height=3> 
                                                        <input type=submit value="完成"    name=submit class="inputstyle">
                                                        <input type=reset value="キャンセル" name=reset class="inputstyle">
                                                        <input type="hidden" name="action" value="add">
                                                      </td>
                                                    </tr>
                                                  </center>
                                                </center>
                                              </center>
                    </table>
                  </form></td>
                    </tr>
                  </table></td>
                </tr>
                
              </table></td>
            </tr>
            
          </table>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <br /></td>
    </tr>
  </tbody>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
