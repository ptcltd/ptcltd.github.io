<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=shift_jis" />
<meta name="description" content="�����m�����C��?�[�؁C��?�����؁C��?�ؙɁC��?���q�C�؍ށC����?�i��?�j�C?���p�i�C��??�i�C����
">
<meta name="Keywords" content="�����m�����C��?�[�؁C��?�����؁C��?�ؙɁC��?���q�C�؍ށC����?�i��?�j�C?���p�i�C��??�i�C����">
<META content="webmaster@boowww.com" name=author>
<title>�����m�����������</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>

<body style="margin:0px">
<!--#include file="top.asp" -->
<table cellspacing="0" cellpadding="0" width="900" border="0">
  <tbody>
    <tr>
      <td width="12" background="images/BG_01.gif"></td>
      <td width="165" valign="top" bgcolor="#FDFDFE"><!--#include file="left.asp" -->
</td>
      <td width="20" background="images/BG_02.gif"></td>
      <td align="left" valign="top"><table width="517" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><img src="images/t1.gif" width="517" height="27" /></td>
        </tr>
        <tr>
          <td height="100" align="center" background="images/t2.gif"><table width="100%" border="0" cellspacing="0" cellpadding="5">
            <tr>
              <td width="28%" align="center"><a href="aboutus.asp"><img src="images/t123.gif" width="118" height="94" border="0" /></a></td>
              <td width="72%" align="left" style="font-size:12px;line-height:18px"><strong><font color="#999999">�����m�����������</font></strong><font color="#999999"><br />
                ��\�� : ��\������В��@���@����<br />
                ���ݒn : �_�ˎs������e�����U���ڂQ�ԂS��<br />
                TEL : 078-851-6398 &nbsp;&nbsp;&nbsp;&nbsp;FAX : 078-851-7998<br />
                ������s : �݂ȂƋ�s�A�O��Z�F��s�@���ɐM���@���̑�</font><font color="#666666">&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.asp"><img src="images/btn_more.gif" width="39" height="14" border="0" /></a></font></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/t3.gif" width="517" height="16" /></td>
        </tr>
        
        <tr>
          <td align="center"><img src="images/44.gif" width="510" height="81" border="0" usemap="#Map2" /></td>
        </tr>
        
        <tr>
          <td height="20" valign="top"><img src="images/product_tit.gif" width="117" height="12" /></td>
        </tr>
        <tr>
          <td><img src="images/product_img_1.gif" width="517" height="11" /></td>
        </tr>
        <tr>
          <td height="120" align="center" background="images/t2.gif"><div id="demo" style="OVERFLOW: hidden; WIDTH: 480px; HEIGHT: 110px">
                      <table height="88" cellspacing="0" width="510" align="center" border="0">
                        <tbody>
                          <tr>
                            <td id="demo1" align="middle">
<%
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from products where flag2=1",conn,1,1
if rs.eof and rs.bof then
%>
<a href="#"><img height="110" src="images/noimg.gif" width="156" align="absmiddle" border="0" /></a>&nbsp;<a href="#"><img height="110" src="images/noimg.gif" width="156" align="absmiddle" border="0" /></a>&nbsp;<a href="#"><img height="110" src="images/noimg.gif" width="156" align="absmiddle" border="0" /></a>&nbsp;<a href="#"><img height="110" src="images/noimg.gif" width="156" align="absmiddle" border="0" /></a>&nbsp;
<%
else
do while not rs.eof
%>
<img height="110" src="<%=rs("smallpic")%>" width="156" align="absmiddle" border="0" />&nbsp;
<%
rs.movenext
loop
end if
rs.close
set rs=nothing
%>
</td>
                            <td id="demo2" valign="top"></td>
                          </tr>
                        </tbody>
                      </table>
                  </div>
            <script>
var speed=30
demo2.innerHTML=demo1.innerHTML
function Marquee(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
demo.scrollLeft-=demo1.offsetWidth
else{
demo.scrollLeft++
}
}
var MyMar3=setInterval(Marquee,speed)
demo.onmouseover=function() {clearInterval(MyMar3)}
demo.onmouseout=function() {MyMar3=setInterval(Marquee,speed)}
              </script></td>
        </tr>
        <tr>
          <td><img src="images/product_img_2.gif" width="517" height="11" /></td>
        </tr>
      </table>
      <br /></td>
      <td align="right" width="175"><a href="fazhan.asp"><img src="images/backmain08_sub01.jpg" width="150" height="403" border="0" /></a></td>
    </tr>
  </tbody>
</table>
<!--#include file="bottom.asp" -->

<map name="Map2"><area shape="rect" coords="5,2,130,80" href="fazhan.asp">
<area shape="rect" coords="145,3,273,77" href="products.asp">
<area shape="rect" coords="289,3,420,80" href="feedback.asp">
<area shape="rect" coords="427,3,505,83" href="news.asp">
</map></body>
</html>
