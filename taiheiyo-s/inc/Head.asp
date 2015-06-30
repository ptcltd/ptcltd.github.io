<HTML><HEAD><TITLE>鑫隆基生化科技有限公司</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="Author" content="Hypo">
<meta name="Contact" content="Hypo@Wz163.com">
<meta name="Copyright" content="Hypo&Zhonghuan Tech">
<style type="text/css">
A:link,A:active,A:visited{TEXT-DECORATION:none ;Color:#000000}
A:hover{Color:#4455aa}
BODY{
FONT-SIZE: 12px;
COLOR: #000000;
FONT-FAMILY:  宋体;
background-color: #999999; 
scrollbar-face-color: #C0C0C0;
scrollbar-highlight-color: #C0C0C0;
scrollbar-shadow-color: #C0C0C0;
scrollbar-3dlight-color: #E0E0E0;
scrollbar-arrow-color:  #000000;
scrollbar-track-color: #E0E0E0;
scrollbar-darkshadow-color: #C0C0C0;
}
TD{
font-family: 宋体;
font-size: 12px;
line-height: 15px;
}
td.TableBody1
{
background-color: #93C7FB;
}
.tableBorder1
{
width:97%;
border: 1px; 
background-color: #A8DEF9;
}
.table { border-collapse: collapse; border-left: 1px solid #000000; border-right: 1px solid #000000; background-color:#ffffff }
INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: #cccccc; PADDING-TOP: 1px; HEIGHT: 18px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc}
</style>
<script Language="JavaScript">
 var h;
 var w;
 var l;
 var t;
 var topMar = 3;
 var leftMar = -10;
 var space = 2;
 var isvisible;
 var MENU_SHADOW_COLOR='#999999';
 var global = window.document
 global.fo_currentMenu = null
 global.fo_shadows = new Array

function HideMenu() 
{
 var mX;
 var mY;
 var vDiv;
 var mDiv;
	if (isvisible == true)
{
		vDiv = document.all("menuDiv");
		mX = window.event.clientX + document.body.scrollLeft;
		mY = window.event.clientY + document.body.scrollTop;
		if ((mX < parseInt(vDiv.style.left)) || (mX > parseInt(vDiv.style.left)+vDiv.offsetWidth) || (mY < parseInt(vDiv.style.top)-h) || (mY > parseInt(vDiv.style.top)+vDiv.offsetHeight)){
			vDiv.style.visibility = "hidden";
			isvisible = false;
		}
}
}

function ShowMenu(vMnuCode,tWidth) {
	vSrc = window.event.srcElement;
	vMnuCode = "<table id='submenu' cellspacing=1 cellpadding=3 style='width:"+tWidth+"' class=tableborder1 onmouseout='HideMenu()'><tr height=23><td nowrap align=left class=tablebody1>" + vMnuCode + "</td></tr></table>";

	h = vSrc.offsetHeight;
	w = vSrc.offsetWidth;
	l = vSrc.offsetLeft + leftMar+4;
	t = vSrc.offsetTop + topMar + h + space-2;
	vParent = vSrc.offsetParent;
	while (vParent.tagName.toUpperCase() != "BODY")
	{
		l += vParent.offsetLeft;
		t += vParent.offsetTop;
		vParent = vParent.offsetParent;
	}

	menuDiv.innerHTML = vMnuCode;
	menuDiv.style.top = t;
	menuDiv.style.left = l;
	menuDiv.style.visibility = "visible";
	isvisible = true;
    makeRectangularDropShadow(submenu, MENU_SHADOW_COLOR, 4)
}

function makeRectangularDropShadow(el, color, size)
{
	var i;
	for (i=size; i>0; i--)
	{
		var rect = document.createElement('div');
		var rs = rect.style
		rs.position = 'absolute';
		rs.left = (el.style.posLeft + i) + 'px';
		rs.top = (el.style.posTop + i) + 'px';
		rs.width = el.offsetWidth + 'px';
		rs.height = el.offsetHeight + 'px';
		rs.zIndex = el.style.zIndex - i;
		rs.backgroundColor = color;
		var opacity = 1 - i / (i + 1);
		rs.filter = 'alpha(opacity=' + (100 * opacity) + ')';
		el.insertAdjacentElement('afterEnd', rect);
		global.fo_shadows[global.fo_shadows.length] = rect;
	}
}
var About= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"About.asp\"><font color="#EEEEEE">公 司 简 介</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Culture.asp\"><font color="#EEEEEE">公 司 文 化</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Organize.asp\"><font color="#EEEEEE">组 织 机 构</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Principle.asp\"><font color="#EEEEEE">精 神 理 念</font></a>&nbsp;'
var News= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"News.asp\"><font color="#EEEEEE">企 业 新 闻</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"yeNews.asp\"><font color="#EEEEEE">产 品 介 绍</font></a>&nbsp;'
var Product= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Product.asp\"><font color="#EEEEEE">产 品 展 示</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Products.asp\"><font color="#EEEEEE">产 品 分 类</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"search.asp\"><font color="#EEEEEE">产 品 搜 索</font></a>&nbsp;'
var Job= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Job.asp\"><font color="#EEEEEE">人 才 招 聘</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Jobs.asp\"><font color="#EEEEEE">人 才 策 略</font></a>&nbsp;'
var sale= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Sale.asp\"><font color="#EEEEEE">代 理 政 策</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Salea.asp\"><font color="#EEEEEE">申 请 代 理</font></a>&nbsp;'
var feedback= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Contact.asp\"><font color="#EEEEEE">联 系 我 们</font></a>&nbsp;'
var server= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Server.asp\"><font color="#EEEEEE">会 员 中 心</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"NetBook.asp\"><font color="#EEEEEE">留 言 中 心</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"E_shop.asp\"><font color="#EEEEEE">订 单 查 询</font></a>&nbsp;'
var index= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Default.asp\"><font color="#EEEEEE">网 站 首 页</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Index.asp\"><font color="#EEEEEE">企业形象页</font></a>&nbsp;'
var img= '&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Honor.asp\"><font color="#EEEEEE">企 业 荣 誉</font></a>&nbsp;<br>&nbsp;<a style=font-size:9pt;line-height:14pt; href=\"Img.asp\"><font color="#EEEEEE">企 业 形 象</font></a>&nbsp;'
</script>
<BODY bgColor=#666666 leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" onmousemove="HideMenu()" background="Img/bg.jpg">
<div id=menuDiv style='Z-INDEX: 2; VISIBILITY: hidden; WIDTH: 1px; POSITION: absolute; HEIGHT: 1px; BACKGROUND-COLOR: #9cc5f8'></div>
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD height=78 background="Images/bg.gif" bgColor=#f2f2f2><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="760" height="78">
        <param name="movie" value="Images/other09.swf">
        <param name="quality" value="high">
		<param name="WMODE" value="TRANSPARENT">
        <embed src="Images/other09.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="760" height="78"></embed>
      </object></TD>
    </TR>
    <TR> 
      <TD background=img/naSzarym.gif><IMG height=1 
            src="img/1x1_pix.gif" width=10></TD>
    </TR>
    <TR> 
      <TD height=40 background="Images/a1.gif" bgColor=137171><TABLE width="100%" border=0 align="center" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR>
              <TD width="4%" valign="bottom">&nbsp;</TD> 
              <TD width="96%" valign="bottom"><a href="Default.asp">首 页 </a>│ <a href="About.asp" onMouseOver='ShowMenu(About)'>企业简介</a> │ <a href="News.asp" onMouseOver='ShowMenu(News)'>新闻资讯 </a>│<a href="Product.asp" onMouseOver='ShowMenu(Product)'> 产品展示</a> │<a href="Honor.asp" onMouseOver='ShowMenu(img)'> 企业荣誉</a> │ <a href="Sale.asp" onMouseOver='ShowMenu(sale)'>代理事宜</a> │<a href="Job.asp" onMouseOver='ShowMenu(Job)'> 人才招聘</a> │ <a href="Went.asp" onMouseOver='ShowMenu(feedback)'>信息反馈 </a>│<a href="Server.asp" onMouseOver='ShowMenu(server)'> 客户中心</a> | <a href="bbs/">交流社区</a></TD>
            </TR>
          </TBODY>
      </TABLE></TD>
    </TR>
    <TR> 
      <TD background=img/bgtop.gif><IMG height=1 
            src="img/1x1_pix.gif" width=10></TD>
    </TR>
  </TBODY>
</TABLE>