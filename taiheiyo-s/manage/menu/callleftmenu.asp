<HTML>
<HEAD>
<TITLE>控制左菜单显隐</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../images/css.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript>

var LEFT_MENU_VIEW=0;

function leftmenu_open()
{
   LEFT_MENU_VIEW=0;
   leftmenu_ctrl();
}

function leftmenu_ctrl()
{
   if(LEFT_MENU_VIEW==0)
   {
      parent.frame2.cols="185,8,*";
      LEFT_MENU_VIEW=1;
      myarrow.src="../images/arrow_l.gif";
   }
   else
   {
      parent.frame2.cols="0,8,*";
      LEFT_MENU_VIEW=0;
      myarrow.src="../images/arrow_r.gif";
   }
}

function setPointer(theRow, thePointerColor)
{
    if (typeof(theRow.style) == 'undefined' || typeof(theRow.cells) == 'undefined')
    {
        return false;
    }

    var row_cells_cnt=theRow.cells.length;
    for (var c = 0; c < row_cells_cnt; c++)
    {
        theRow.cells[c].bgColor = thePointerColor;
    }

    return true;
}

</SCRIPT>

<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 onload=leftmenu_ctrl()>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" align=center 
background=../images/bg_blue.gif>
  <TBODY>
  <TR>
    <TD>
      <TABLE height=50 cellSpacing=0 borderColorDark=#ffffff cellPadding=0 
      width="100%" bgColor=#eeeeee borderColorLight=#000000 border=1>
        <TBODY>
        <TR onmouseover="setPointer(this, '#D3E5FF')" onclick=leftmenu_ctrl() 
        onmouseout="setPointer(this, '#EEEEEE')">
          <TD style="CURSOR: hand"><IMG id=myarrow 
            src="../images/arrow_l.gif"> 
  </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
