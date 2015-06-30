<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="ubbcode.asp"-->
<!--#include file="function.asp"-->

<%
dim strFileName,MaxPerPage,ShowSmallClassType
dim totalPut,CurrentPage,TotalPages
dim BeginTime,EndTime
dim founderr, errmsg
dim BigClassName,SmallClassName,SpecialName,keyword,strField
dim rs,sql,sqlArticle,rsArticle,sqlSearch,rsSearch,sqlBigClass,rsBigClass,sqlSpecial,rsSpecial
dim SpecialTotal
BeginTime=Timer
BigClassName=Trim(request("BigClassName"))
SmallClassName=Trim(request("SmallClassName"))
SpecialName=trim(request("SpecialName"))
keyword=trim(request("keyword"))
if keyword<>"" then 
	keyword=replace(replace(replace(replace(keyword,"'","‘"),"<","&lt;"),">","&gt;")," ","&nbsp;")
end if
strField=trim(request("Field"))

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

sqlBigClass="select * from BigClass order by BigClassID"
Set rsBigClass= Server.CreateObject("ADODB.Recordset")
rsBigClass.open sqlBigClass,conn,1,1


'=================================================
'过程名：ShowSmallClass_Tree
'作  用：树形目录方式显示栏目
'参  数：无
'=================================================
sub ShowSmallClass_Tree()
	if rsBigClass.bof and rsBigClass.eof then 
		response.Write "栏目正在建设中……"
	else
		dim sqlClass,rsClass,strTree,BigClassNum,i,j
		rsBigClass.movefirst
		BigClassNum=rsBigClass.recordcount
		i=1
		do while not rsBigClass.eof
			if i<BigClassNum then
				strTree=""
			else
				strTree=""
			end if
			sqlClass="select * from SmallClass where BigClassName='" & rsBigClass("BigClassName") & "' Order by SmallClassID"
			Set rsClass= Server.CreateObject("ADODB.Recordset")
			rsClass.open sqlClass,conn,1,1
				strTree= strTree & "<table width=180 border=0 cellpadding=0 cellspacing=0>"
				strTree= strTree & "<tr>"
				strTree= strTree & "<td width=24 height=22>"
				strTree= strTree & "<div align=center><img src=Img/arrow_2.gif width=13 height=11></div></td>"
				strTree= strTree & "<td width=150>"
				strTree= strTree & "<a href='Product.asp?BigClassName=" & rsBigClass("BigClassName") & "'>"
				 	strTree=strTree & rsBigClass("BigClassName")
				strTree=strTree & "</a></td>"
				'strTree=strTree & "</td>"
				strTree= strTree & "</tr><tr>"
				strTree=strTree & "<TD height=1 colspan=2 background=img/naSzarym.gif>"
				strTree=strTree & "<IMG height=1 src=img/1x1_pix.gif width=10></TD>"
				strTree=strTree & "</TR>"
				strTree=strTree & "</table>"
				SmallClassNum=rsClass.recordcount
				j=1
				do while not rsClass.eof
					rsClass.movenext
					j=j+1
				loop
			response.write strTree
			rsBigClass.movenext
			i=i+1
		loop
		rsClass.close
		set rsClass=nothing
	end if
end sub


'=================================================
'过程名：ShowVote
'作  用：显示网站调查
'参  数：无
'=================================================
sub ShowVote()
	dim sqlVote,rsVote,i
	sqlVote="select top 1 * from Vote where IsSelected=True"
	Set rsVote= Server.CreateObject("ADODB.Recordset")
	rsVote.open sqlVote,conn,1,1
	if rsVote.bof and rsVote.eof then 
		response.Write "&nbsp;没有任何调查"
	else
		response.write "<form name='VoteForm' method='post' action='vote.asp' target='_blank'><td>"
		response.write "&nbsp;&nbsp;&nbsp;&nbsp;" & rsVote("Title") & "<br>"
		if rsVote("VoteType")="Single" then
			for i=1 to 8
				if trim(rsVote("Select" & i) & "")="" then exit for
				response.Write "<input type='radio' name='VoteOption' value='" & i & "'>" & rsVote("Select" & i) & "<br>"
			next
		else
			for i=1 to 8
				if trim(rsVote("Select" & i) & "")="" then exit for
				response.Write "<input type='checkbox' name='VoteOption' value='" & i & "'>" & rsVote("Select" & i) & "<br>"
			next
		end if
		response.write "<br><input name='VoteType' type='hidden'value='" & rsVote("VoteType") & "'>"
		response.write "<input name='Action' type='hidden' value='Vote'>"
		response.write "<input name='ID' type='hidden' value='" & rsVote("ID") & "'>"
		response.write "<div align='center'>"
		response.write "<a href='javascript:VoteForm.submit();'><img src='images/voteSubmit.gif' width='52' height='18' border='0'></a>&nbsp;&nbsp;"
        response.write "<a href='Vote.asp?Action=Show' target='_blank'><img src='images/voteView.gif' width='52' height='18' border='0'></a>"
		response.write "</div></td></form>"
	end if
	rsVote.close
	set rsVote=nothing
end sub

'=================================================
'过程名：ShowClassGuide
'作  用：显示栏目导航位置
'参  数：无
'=================================================
sub ShowClassGuide()
	response.write  "|&nbsp;<a href='Products.asp'>产品展示</a>&nbsp;&gt;&gt;"
	if BigClassName="" and SmallClassName="" then
		response.write "&nbsp;所有产品"
	else
		if BigClassName<>"" then
			response.write "&nbsp;<a href='Product.asp?BigClassName=" & BigClassName & "'>" & BigClassName & "</a>&nbsp;&gt;&gt;&nbsp;"
			if SmallClassName<>"" then
				response.write "<a href='Product.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "'>" & SmallClassName & "</a>"
			else
				response.write "所有小类"
			end if
		end if
	end if
end sub

'=================================================
'过程名：ShowArticleTotal
'作  用：显示文章总数
'参  数：无
'=================================================
sub ShowArticleTotal()
	dim sqlTotal
	dim rsTotal
	sqlTotal="select Count(*) from Product where Passed=True "
	if BigClassName<>"" then
		sqlTotal=sqlTotal & " and BigClassName='" & BigClassName & "' "
		if SmallClassName<>"" then
			sqlTotal=sqlTotal & " and SmallClassName='" & SmallClassName & "' "
		end if
	else
		if SpecialName<>"" then
			sqlTotal=sqlTotal & " and SpecialName='" & SpecialName & "' "
		end if
	end if
	Set rsTotal= Server.CreateObject("ADODB.Recordset")
	rsTotal.open sqlTotal,conn,1,1
	if rsTotal.eof and rsTotal.bof then
		totalPut=0
		response.write "共有 0 个产品"
	else
		totalPut=rsTotal(0)
		response.Write "共有 " & totalPut & " 个产品"
	end if
	rsTotal.close
	set rsTotal=nothing
end sub

'=================================================
'过程名：ShowArticle
'=================================================
sub ShowArticle(TitleLen)
	if TitleLen<0 or TitleLen>200 then
		TitleLen=50
	end if
    if currentpage<1 then
	   	currentpage=1
    end if
	if (currentpage-1)*MaxPerPage>totalput then
		if (totalPut mod MaxPerPage)=0 then
	   		currentpage= totalPut \ MaxPerPage
		else
		   	currentpage= totalPut \ MaxPerPage + 1
		end if
   	end if
	if currentPage=1 then
        sqlArticle="select top " & MaxPerPage	
	else
		sqlArticle="select "
	end if

	sqlArticle=sqlArticle & " ArticleID,Product_Id,BigClassName,SmallClassName,IncludePic,Title,DefaultPicUrl,UpdateTime,Hits from Product where Passed=True "
	
	if BigClassName<>"" then
		sqlArticle=sqlArticle & " and BigClassName='" & BigClassName & "' "
		if SmallClassName<>"" then
			sqlArticle=sqlArticle & " and SmallClassName='" & SmallClassName & "' "
		end if
	else
		if SpecialName<>"" then
			sqlArticle=sqlArticle & " and SpecialName='" & SpecialName & "' "
		end if
	end if
	sqlArticle=sqlArticle & " order by articleid desc"
	Set rsArticle= Server.CreateObject("ADODB.Recordset")
	rsArticle.open sqlArticle,conn,1,1
	if rsArticle.bof and  rsArticle.eof then
		response.Write("<br><li>没有任何产品</li>")
	else
		if currentPage=1 then
			call ArticleContent(TitleLen)
		else
			if (currentPage-1)*MaxPerPage<totalPut then
         	   	rsArticle.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rsArticle.bookmark
            	call ArticleContent(TitleLen)
        	else
	        	currentPage=1
           		call ArticleContent(TitleLen)
	    	end if
		end if
	end if
	rsArticle.close
	set rsArticle=nothing
end sub

sub ArticleContent(intTitleLen)
   	dim i,strTemp
    i=0
	do while not rsArticle.eof
		strTemp=""
		'strTemp = strTemp & ""
		strTemp= strTemp & "<table width=100% border=0 cellspacing=3 cellpadding=0>"
                strTemp= strTemp & "<tr>"
                strTemp= strTemp & "<td width=25% rowspan=5>"
                strTemp= strTemp & "<div align=center><a href=ArticleShow.asp?ArticleID=" & rsArticle("articleid") & ">" 
                strTemp= strTemp & "<img border=0 src=" & rsArticle("DefaultPicUrl") & " width=100 height=120>" 
                strTemp= strTemp & "</a></div></td>"
                strTemp= strTemp & "<td width=12% height=18>"
                strTemp= strTemp & "产品名称：</td>"
                strTemp= strTemp & "<td>"
                strTemp= strTemp & "<a href=ArticleShow.asp?ArticleID=" & rsArticle("articleid") & ">" & rsArticle("Title") & ""
                strTemp= strTemp & "</a></td>"
                strTemp= strTemp & "</tr><tr>"
                strTemp= strTemp & "<td height=18>"
                strTemp= strTemp & "产品类别：</td>"
                strTemp= strTemp & "<td><a href=Product.asp?BigClassName=" & rsArticle("BigClassName") & ">" & rsArticle("BigClassName") & "</a> → "
                strTemp= strTemp & "<a href=Product.asp?BigClassName=" & rsArticle("BigClassName") & "&SmallClassName=" & rsArticle("SmallClassName") & ">" & rsArticle("SmallClassName") & ""
                strTemp= strTemp & "</a></td>"
                strTemp= strTemp & "</tr><tr>" 
                strTemp= strTemp & "<td height=18>"
                strTemp= strTemp & "产品编号：</td>"
                strTemp= strTemp & "<td>" & rsArticle("Product_Id") & "</td>"
                strTemp= strTemp & "</tr><tr>"
                strTemp= strTemp & "<td height=18>产品信息：</td>"
                strTemp= strTemp & "<td>"
                strTemp= strTemp & "<a href=ArticleShow.asp?ArticleID=" & rsArticle("articleid") & "><img src=Img/arrow_7.gif border=0></a></td>"
                strTemp= strTemp & "</tr><tr>"
                strTemp= strTemp & "<td colspan=2>"
                strTemp= strTemp & "<table width=100% border=0 cellpadding=0 cellspacing=0>"
                strTemp= strTemp & "<tr>" 
                strTemp= strTemp & "<td width=50% height=18>"
                strTemp= strTemp & "<div align=center></div></td>"
                strTemp= strTemp & "<td width=50% height=18>"
                strTemp= strTemp & "<div align=center><a href=""javascript:eshop('" & rsArticle("Product_Id") & "')""><img border=0 src=img/addtocart.gif width=75 height=18>"
                strTemp= strTemp & "</a></div></td>"
                strTemp= strTemp & "</tr>"
                strTemp= strTemp & "</table>"
                strTemp= strTemp & "</td>"
                strTemp= strTemp & "</tr><tr>" 
                strTemp= strTemp & "<td height=1 colspan=3 bgcolor=#CCCCCC></td>"
                strTemp= strTemp & "</tr>"
                strTemp= strTemp & "</table>"
		response.write strTemp
		rsArticle.movenext
		i=i+1
		if i>=MaxPerPage then exit do	
	loop
end sub 

'=================================================
'过程名：ShowSearchTerm
'作  用：显示搜索条件信息
'参  数：无
'=================================================
sub ShowSearchTerm()
	response.write "|&nbsp;产品搜索&nbsp;&gt;&gt; "
	if BigClassName<>"" then
		response.write "<a href='Default.asp?BigClassName=" & BigClassName & "'>" & BigClassName & "</a>&nbsp;&gt;&gt;&nbsp;"
		if SmallClassName<>"" then
			response.write "<a href='Default.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "'>" & SmallClassName & "</a>&nbsp;&gt;&gt;&nbsp;"
		else
			response.write "所有小类&nbsp;&gt;&gt;&nbsp;"
		end if
	end if
	if keyword<>"" then
	  select case strField
		case "Title"
			response.Write "名称中含有 <font color=red>"&keyword&"</font> 的产品"
		case "Content"
			response.Write "说明含有 <font color=red>"&keyword&"</font> 的产品"
		case else
			response.Write "名称中含有 <font color=red>"&keyword&"</font> 的产品"
	  end select
	else
	  response.write "&nbsp;所有产品"
	end if
end sub

'=================================================
'过程名：SearchResultTotal
'作  用：显示搜索结果总数
'参  数：无
'=================================================
sub SearchResultTotal()
	dim rsTotal,sqlTotal
	sqlTotal="select count(*) from Product where Passed=True "
	if BigClassName<>"" then
		sqlTotal=sqlTotal & " and BigClassName='" & BigClassName & "' "
		if SmallClassName<>"" then
			sqlTotal=sqlTotal & " and SmallClassName='" & SmallClassName & "' "
		end if
	else
		if SpecialName<>"" then
			sqlTotal=sqlTotal & " and SpecialName='" & SpecialName & "' "
		end if
	end if
	if keyword<>"" then
		select case strField
			case "Title"
				sqlTotal=sqlTotal & " and Title like '%" & keyword & "%' "
			case "Content"
				sqlTotal=sqlTotal & " and Content like '%" & keyword & "%' "
			case else
				sqlTotal=sqlTotal & " and Title like '%" & keyword & "%' "
		end select
	end if
	Set rsTotal= Server.CreateObject("ADODB.Recordset")
	rsTotal.open sqlTotal,conn,1,1
	if rsTotal.eof and rsTotal.bof then
		totalPut=0
		response.write "共有 0 个产品"
	else
		totalPut=rsTotal(0)
		response.Write "共找到 " & totalPut & " 个产品"
	end if
end sub

'=================================================
'过程名：ShowSearchResult
'作  用：分页显示搜索结果
'参  数：无
'=================================================
sub ShowSearchResult()
    if currentpage<1 then
	   	currentpage=1
    end if
	if (currentpage-1)*MaxPerPage>totalput then
		if (totalPut mod MaxPerPage)=0 then
	   		currentpage= totalPut \ MaxPerPage
		else
		   	currentpage= totalPut \ MaxPerPage + 1
		end if
   	end if
	if currentPage=1 then
        sqlSearch="select top " & MaxPerPage	
	else
		sqlSearch="select "
	end if

	sqlSearch=sqlSearch & " * from Product where Passed=True "
	if BigClassName<>"" then
		sqlSearch=sqlSearch & " and BigClassName='" & BigClassName & "' "
		if SmallClassName<>"" then
			sqlSearch=sqlSearch & " and SmallClassName='" & SmallClassName & "' "
		end if
	else
		if SpecialName<>"" then
			sqlSearch=sqlSearch & " and SpecialName='" & SpecialName & "' "
		end if
	end if
	if keyword<>"" then
		select case strField
			case "Title"
				sqlSearch=sqlSearch & " and Title like '%" & keyword & "%' "
			case "Content"
				sqlSearch=sqlSearch & " and Content like '%" & keyword & "%' "
			case else
				sqlSearch=sqlSearch & " and Title like '%" & keyword & "%' "
		end select
	end if
	sqlSearch=sqlSearch & " order by articleid desc"
	Set rsSearch= Server.CreateObject("ADODB.Recordset")
	rsSearch.open sqlSearch,conn,1,1
 	if rsSearch.eof and rsSearch.bof then 
       		response.write "<p align='center'><br><br>没有或没有找到任何产品</p>" 
   	else 
   		if currentPage=1 then 
       		call SearchResultContent()
   		else 
       		if (currentPage-1)*MaxPerPage<totalPut then 
       			rsSearch.move  (currentPage-1)*MaxPerPage 
       			dim bookmark 
       			bookmark=rsSearch.bookmark 
       			call SearchResultContent()
      		else 
        		currentPage=1 
       			call SearchResultContent()
      		end if 
	   	end if 
   	end if 
   	rsSearch.close 
   	set rsSearch=nothing   
end sub

sub SearchResultContent()
   	dim i,strTemp,content
	i=1
	do while not rsSearch.eof
		strTemp=""
		strTemp=strTemp & cstr(i) & ".<a href='ArticleShow.asp?ArticleID=" & rsSearch("articleid") & "'>"
		if strField="Title" then
			strTemp=strTemp & "<b>" & replace(rsSearch("title"),""&keyword&"","<font color=red>"&keyword&"</font>") & "</b></font></a>"
		else
			strTemp=strTemp & "<b>" & rsSearch("title") & "</b></a>"
		end if
		strTemp=strTemp & " [" & FormatDateTime(rsSearch("UpdateTime"),1) & "]"
		content=left(nohtml(rsSearch("content")),200)
		if strField="Content" then
			strTemp=strTemp & "<div style='padding:10px 20px'>" & replace(content,""&keyword&"","<font color=red>"&keyword&"</font>") & "……</div>"
		else
			strTemp=strTemp & "<div style='padding:10px 20px'>" & content & "……</div>"
		end if
		'strTemp=strTemp & "</a>"
		response.write strTemp
		i=i+1
		if i>MaxPerPage then exit do
		rsSearch.movenext
	loop
end sub 


'=================================================
'过程名：ShowSearch
'作  用：显示文章搜索表单
'参  数：ShowType ----显示方式。1为纵向，2为横向
'=================================================
sub ShowSearch(ShowType)
	dim count
	if ShowType<>1 and ShowType<>2 then
		ShowType=1
	end if
	set rs=server.createobject("adodb.recordset")
	sql = "select * from SmallClass order by SmallClassID asc"
	rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>");
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
</script>
<table border="0" cellpadding="2" cellspacing="0" align="center">
<form method="Get" name="myform" action="search.asp">
<tr><td height="28">
<select name="Field" size="1">
    <option value="Title" selected>产品名称</option>
    <option value="Content">产品说明</option>
</select>
<%if ShowType=1 then%>
</td></tr>
<tr><td height="28">
<%end if%>
<select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
	<option selected value="">所有大类</option>
<%
if not (rsBigClass.bof and rsBigClass.eof) then
	rsBigClass.movefirst
	do while not rsBigClass.eof
        response.Write "<option value='" & trim(rsBigClass("BigClassName")) & "'>" & trim(rsBigClass("BigClassName")) & "</option>"
	   	rsBigClass.movenext
	loop
end if
%>
</select>
<%if ShowType=1 then%>
</td></tr>
<tr><td height="28">
<%end if%>
<select name="SmallClassName">                  
    <option selected value="">所有小类</option>
</select>
<%if ShowType=1 then%>
</td></tr>
<tr><td height="28">
<%end if%>
<input type="text" name="keyword"  size=15 value="关键字" maxlength="50" onFocus="this.select();">
<input type="submit" name="Submit"  value="搜索">
</td></tr>
</form>
</table>
<%
end sub

'=================================================
'过程名：ShowAllClass
'作  用：显示所有栏目（栏目导航）
'参  数：无
'=================================================
sub ShowAllClass()
	if rsBigClass.bof and rsBigClass.eof then 
		response.Write "&nbsp;没有任何栏目"
	else
		dim sqlClass,rsClass,strClassName
		rsBigClass.movefirst
		do while not rsBigClass.eof
			strClassName= "【<a href='Product.asp?BigClassName=" & rsBigClass("BigClassName") & "'><b>" & rsBigClass("BigClassName") & "</b></a>】<br><br>"
			sqlClass="select * from SmallClass where BigClassName='" & rsBigClass("BigClassName") & "' Order by SmallClassID"
			Set rsClass= Server.CreateObject("ADODB.Recordset")
			rsClass.open sqlClass,conn,1,1
			do while not rsClass.eof
				strClassName=strClassName & "&nbsp;<a href='Product.asp?BigClassName=" & rsClass("BigClassName") & "&SmallClassName=" & rsClass("SmallClassName") & "'>" & rsClass("SmallClassName") & "</a>&nbsp;"
				rsClass.movenext
			loop
			response.write strClassName & "<br><br>"
			rsBigClass.movenext
		loop
		rsClass.close
		set rsClass=nothing
	end if
end sub


'=================================================
'过程名：ShowArticleContent
'作  用：显示文章具体的内容，可以分页显示
'参  数：无
'=================================================
sub ShowArticleContent()
	dim ArticleID,strContent,CurrentPage
	dim ContentLen,MaxPerPage,pages,i,lngBound
	dim BeginPoint,EndPoint
	ArticleID=rs("ArticleID")
	strContent=rs("Content")
	ContentLen=len(strContent)
	CurrentPage=trim(request("ArticlePage"))
	if ShowContentByPage="No" or ContentLen<=200000 then
		response.write strContent
		if ShowContentByPage="Yes" then
			response.write "</p><p align='center'></p>"
		end if
	else
		if CurrentPage="" then
			CurrentPage=1
		else
			CurrentPage=Cint(CurrentPage)
		end if
		pages=ContentLen\MaxPerPage_Content
		if MaxPerPage_Content*pages<ContentLen then
			pages=pages+1
		end if
		lngBound=MaxPerPage_Content          '最大误差范围
		if CurrentPage<1 then CurrentPage=1
		if CurrentPage>pages then CurrentPage=pages

		dim lngTemp
		dim lngTemp1,lngTemp1_1,lngTemp1_2,lngTemp1_1_1,lngTemp1_1_2,lngTemp1_1_3,lngTemp1_2_1,lngTemp1_2_2,lngTemp1_2_3
		dim lngTemp2,lngTemp2_1,lngTemp2_2,lngTemp2_1_1,lngTemp2_1_2,lngTemp2_2_1,lngTemp2_2_2
		dim lngTemp3,lngTemp3_1,lngTemp3_2,lngTemp3_1_1,lngTemp3_1_2,lngTemp3_2_1,lngTemp3_2_2
		dim lngTemp4,lngTemp4_1,lngTemp4_2,lngTemp4_1_1,lngTemp4_1_2,lngTemp4_2_1,lngTemp4_2_2
		dim lngTemp5,lngTemp5_1,lngTemp5_2
		dim lngTemp6,lngTemp6_1,lngTemp6_2
		
		if CurrentPage=1 then
			BeginPoint=1
		else
			BeginPoint=MaxPerPage_Content*(CurrentPage-1)+1
			
			lngTemp1_1_1=instr(BeginPoint,strContent,"</table>",1)
			lngTemp1_1_2=instr(BeginPoint,strContent,"</TABLE>",1)
			lngTemp1_1_3=instr(BeginPoint,strContent,"</Table>",1)
			if lngTemp1_1_1>0 then
				lngTemp1_1=lngTemp1_1_1
			elseif lngTemp1_1_2>0 then
				lngTemp1_1=lngTemp1_1_2
			elseif lngTemp1_1_3>0 then
				lngTemp1_1=lngTemp1_1_3
			else
				lngTemp1_1=0
			end if
							
			lngTemp1_2_1=instr(BeginPoint,strContent,"<table",1)
			lngTemp1_2_2=instr(BeginPoint,strContent,"<TABLE",1)
			lngTemp1_2_3=instr(BeginPoint,strContent,"<Table",1)
			if lngTemp1_2_1>0 then
				lngTemp1_2=lngTemp1_2_1
			elseif lngTemp1_2_2>0 then
				lngTemp1_2=lngTemp1_2_2
			elseif lngTemp1_2_3>0 then
				lngTemp1_2=lngTemp1_2_3
			else
				lngTemp1_2=0
			end if
			
			if lngTemp1_1=0 and lngTemp1_2=0 then
				lngTemp1=BeginPoint
			else
				if lngTemp1_1>lngTemp1_2 then
					lngtemp1=lngTemp1_2
				else
					lngTemp1=lngTemp1_1+8
				end if
			end if

			lngTemp2_1_1=instr(BeginPoint,strContent,"</p>",1)
			lngTemp2_1_2=instr(BeginPoint,strContent,"</P>",1)
			if lngTemp2_1_1>0 then
				lngTemp2_1=lngTemp2_1_1
			elseif lngTemp2_1_2>0 then
				lngTemp2_1=lngTemp2_1_2
			else
				lngTemp2_1=0
			end if
						
			lngTemp2_2_1=instr(BeginPoint,strContent,"<p",1)
			lngTemp2_2_2=instr(BeginPoint,strContent,"<P",1)
			if lngTemp2_2_1>0 then
				lngTemp2_2=lngTemp2_2_1
			elseif lngTemp2_2_2>0 then
				lngTemp2_2=lngTemp2_2_2
			else
				lngTemp2_2=0
			end if
			
			if lngTemp2_1=0 and lngTemp2_2=0 then
				lntTemp2=BeginPoint
			else
				if lngTemp2_1>lngTemp2_2 then
					lngtemp2=lngTemp2_2
				else
					lngTemp2=lngTemp2_1+4
				end if
			end if

			lngTemp3_1_1=instr(BeginPoint,strContent,"</ur>",1)
			lngTemp3_1_2=instr(BeginPoint,strContent,"</UR>",1)
			if lngTemp3_1_1>0 then
				lngTemp3_1=lngTemp3_1_1
			elseif lngTemp3_1_2>0 then
				lngTemp3_1=lngTemp3_1_2
			else
				lngTemp3_1=0
			end if
			
			lngTemp3_2_1=instr(BeginPoint,strContent,"<ur",1)
			lngTemp3_2_2=instr(BeginPoint,strContent,"<UR",1)
			if lngTemp3_2_1>0 then
				lngTemp3_2=lngTemp3_2_1
			elseif lngTemp3_2_2>0 then
				lngTemp3_2=lngTemp3_2_2
			else
				lngTemp3_2=0
			end if
					
			if lngTemp3_1=0 and lngTemp3_2=0 then
				lngTemp3=BeginPoint
			else
				if lngTemp3_1>lngTemp3_2 then
					lngtemp3=lngTemp3_2
				else
					lngTemp3=lngTemp3_1+5
				end if
			end if
			
			if lngTemp1<lngTemp2 then
				lngTemp=lngTemp2
			else
				lngTemp=lngTemp1
			end if
			if lngTemp<lngTemp3 then
				lngTemp=lngTemp3
			end if

			if lngTemp>BeginPoint and lngTemp<=BeginPoint+lngBound then
				BeginPoint=lngTemp
			else
				lngTemp4_1_1=instr(BeginPoint,strContent,"</li>",1)
				lngTemp4_1_2=instr(BeginPoint,strContent,"</LI>",1)
				if lngTemp4_1_1>0 then
					lngTemp4_1=lngTemp4_1_1
				elseif lngTemp4_1_2>0 then
					lngTemp4_1=lngTemp4_1_2
				else
					lngTemp4_1=0
				end if
				
				lngTemp4_2_1=instr(BeginPoint,strContent,"<li",1)
				lngTemp4_2_1=instr(BeginPoint,strContent,"<LI",1)
				if lngTemp4_2_1>0 then
					lngTemp4_2=lngTemp4_2_1
				elseif lngTemp4_2_2>0 then
					lngTemp4_2=lngTemp4_2_2
				else
					lngTemp4_2=0
				end if
				
				if lngTemp4_1=0 and lngTemp4_2=0 then
					lngTemp4=BeginPoint
				else
					if lngTemp4_1>lngTemp4_2 then
						lngtemp4=lngTemp4_2
					else
						lngTemp4=lngTemp4_1+5
					end if
				end if
				
				if lngTemp4>BeginPoint and lngTemp4<=BeginPoint+lngBound then
					BeginPoint=lngTemp4
				else					
					lngTemp5_1=instr(BeginPoint,strContent,"<img",1)
					lngTemp5_2=instr(BeginPoint,strContent,"<IMG",1)
					if lngTemp5_1>0 then
						lngTemp5=lngTemp5_1
					elseif lngTemp5_2>0 then
						lngTemp5=lngTemp5_2
					else
						lngTemp5=BeginPoint
					end if
					
					if lngTemp5>BeginPoint and lngTemp5<BeginPoint+lngBound then
						BeginPoint=lngTemp5
					else
						lngTemp6_1=instr(BeginPoint,strContent,"<br>",1)
						lngTemp6_2=instr(BeginPoint,strContent,"<BR>",1)
						if lngTemp6_1>0 then
							lngTemp6=lngTemp6_1
						elseif lngTemp6_2>0 then
							lngTemp6=lngTemp6_2
						else
							lngTemp6=0
						end if
					
						if lngTemp6>BeginPoint and lngTemp6<BeginPoint+lngBound then
							BeginPoint=lngTemp6+4
						end if
					end if
				end if
			end if
		end if

		if CurrentPage=pages then
			EndPoint=ContentLen
		else
		  EndPoint=MaxPerPage_Content*CurrentPage
		  if EndPoint>=ContentLen then
			EndPoint=ContentLen
		  else
			lngTemp1_1_1=instr(EndPoint,strContent,"</table>",1)
			lngTemp1_1_2=instr(EndPoint,strContent,"</TABLE>",1)
			lngTemp1_1_3=instr(EndPoint,strContent,"</Table>",1)
			if lngTemp1_1_1>0 then
				lngTemp1_1=lngTemp1_1_1
			elseif lngTemp1_1_2>0 then
				lngTemp1_1=lngTemp1_1_2
			elseif lngTemp1_1_3>0 then
				lngTemp1_1=lngTemp1_1_3
			else
				lngTemp1_1=0
			end if
							
			lngTemp1_2_1=instr(EndPoint,strContent,"<table",1)
			lngTemp1_2_2=instr(EndPoint,strContent,"<TABLE",1)
			lngTemp1_2_3=instr(EndPoint,strContent,"<Table",1)
			if lngTemp1_2_1>0 then
				lngTemp1_2=lngTemp1_2_1
			elseif lngTemp1_2_2>0 then
				lngTemp1_2=lngTemp1_2_2
			elseif lngTemp1_2_3>0 then
				lngTemp1_2=lngTemp1_2_3
			else
				lngTemp1_2=0
			end if
			
			if lngTemp1_1=0 and lngTemp1_2=0 then
				lngTemp1=EndPoint
			else
				if lngTemp1_1>lngTemp1_2 then
					lngtemp1=lngTemp1_2-1
				else
					lngTemp1=lngTemp1_1+7
				end if
			end if

			lngTemp2_1_1=instr(EndPoint,strContent,"</p>",1)
			lngTemp2_1_2=instr(EndPoint,strContent,"</P>",1)
			if lngTemp2_1_1>0 then
				lngTemp2_1=lngTemp2_1_1
			elseif lngTemp2_1_2>0 then
				lngTemp2_1=lngTemp2_1_2
			else
				lngTemp2_1=0
			end if
						
			lngTemp2_2_1=instr(EndPoint,strContent,"<p",1)
			lngTemp2_2_2=instr(EndPoint,strContent,"<P",1)
			if lngTemp2_2_1>0 then
				lngTemp2_2=lngTemp2_2_1
			elseif lngTemp2_2_2>0 then
				lngTemp2_2=lngTemp2_2_2
			else
				lngTemp2_2=0
			end if
			
			if lngTemp2_1=0 and lngTemp2_2=0 then
				lngTemp2=EndPoint
			else
				if lngTemp2_1>lngTemp2_2 then
					lngTemp2=lngTemp2_2-1
				else
					lngTemp2=lngTemp2_1+3
				end if
			end if

			lngTemp3_1_1=instr(EndPoint,strContent,"</ur>",1)
			lngTemp3_1_2=instr(EndPoint,strContent,"</UR>",1)
			if lngTemp3_1_1>0 then
				lngTemp3_1=lngTemp3_1_1
			elseif lngTemp3_1_2>0 then
				lngTemp3_1=lngTemp3_1_2
			else
				lngTemp3_1=0
			end if
			
			lngTemp3_2_1=instr(EndPoint,strContent,"<ur",1)
			lngTemp3_2_2=instr(EndPoint,strContent,"<UR",1)
			if lngTemp3_2_1>0 then
				lngTemp3_2=lngTemp3_2_1
			elseif lngTemp3_2_2>0 then
				lngTemp3_2=lngTemp3_2_2
			else
				lngTemp3_2=0
			end if
					
			if lngTemp3_1=0 and lngTemp3_2=0 then
				lngTemp3=EndPoint
			else
				if lngTemp3_1>lngTemp3_2 then
					lngtemp3=lngTemp3_2-1
				else
					lngTemp3=lngTemp3_1+4
				end if
			end if
			
			if lngTemp1<lngTemp2 then
				lngTemp=lngTemp2
			else
				lngTemp=lngTemp1
			end if
			if lngTemp<lngTemp3 then
				lngTemp=lngTemp3
			end if

			if lngTemp>EndPoint and lngTemp<=EndPoint+lngBound then
				EndPoint=lngTemp
			else
				lngTemp4_1_1=instr(EndPoint,strContent,"</li>",1)
				lngTemp4_1_2=instr(EndPoint,strContent,"</LI>",1)
				if lngTemp4_1_1>0 then
					lngTemp4_1=lngTemp4_1_1
				elseif lngTemp4_1_2>0 then
					lngTemp4_1=lngTemp4_1_2
				else
					lngTemp4_1=0
				end if
				
				lngTemp4_2_1=instr(EndPoint,strContent,"<li",1)
				lngTemp4_2_1=instr(EndPoint,strContent,"<LI",1)
				if lngTemp4_2_1>0 then
					lngTemp4_2=lngTemp4_2_1
				elseif lngTemp4_2_2>0 then
					lngTemp4_2=lngTemp4_2_2
				else
					lngTemp4_2=0
				end if
				
				if lngTemp4_1=0 and lngTemp4_2=0 then
					lngTemp4=EndPoint
				else
					if lngTemp4_1>lngTemp4_2 then
						lngtemp4=lngTemp4_2-1
					else
						lngTemp4=lngTemp4_1+4
					end if
				end if
				
				if lngTemp4>EndPoint and lngTemp4<=EndPoint+lngBound then
					EndPoint=lngTemp4
				else					
					lngTemp5_1=instr(EndPoint,strContent,"<img",1)
					lngTemp5_2=instr(EndPoint,strContent,"<IMG",1)
					if lngTemp5_1>0 then
						lngTemp5=lngTemp5_1-1
					elseif lngTemp5_2>0 then
						lngTemp5=lngTemp5_2-1
					else
						lngTemp5=EndPoint
					end if
					
					if lngTemp5>EndPoint and lngTemp5<EndPoint+lngBound then
						EndPoint=lngTemp5
					else
						lngTemp6_1=instr(EndPoint,strContent,"<br>",1)
						lngTemp6_2=instr(EndPoint,strContent,"<BR>",1)
						if lngTemp6_1>0 then
							lngTemp6=lngTemp6_1+3
						elseif lngTemp6_2>0 then
							lngTemp6=lngTemp6_2+3
						else
							lngTemp6=EndPoint
						end if
					
						if lngTemp6>EndPoint and lngTemp6<EndPoint+lngBound then
							EndPoint=lngTemp6
						end if
					end if
				end if
			end if
		  end if
		end if
		response.write mid(strContent,BeginPoint,EndPoint-BeginPoint)
		
		response.write "</p><p align='center'><b>"
		if CurrentPage>1 then
			response.write "<a href='ArticleShow.asp?ArticleID=" & ArticleID & "&ArticlePage=" & CurrentPage-1 & "'>上一页</a>&nbsp;&nbsp;"
		end if
		for i=1 to pages
			if i=CurrentPage then
				response.write "<font color='red'>[" & cstr(i) & "]</font>&nbsp;"
			else
				response.write "<a href='ArticleShow.asp?ArticleID=" & ArticleID & "&ArticlePage=" & i & "'>[" & i & "]</a>&nbsp;"
			end if
		next
		if CurrentPage<pages then
			response.write "&nbsp;<a href='ArticleShow.asp?ArticleID=" & ArticleID & "&ArticlePage=" & CurrentPage+1 & "'>下一页</a>"
		end if
		response.write "</b></p>"
	end if

end sub

'=================================================
'过程名：ShowUserLogin
'作  用：显示用户登录表单
'参  数：无
'=================================================
sub ShowUserLogin()
	dim strLogin
	If Session("UserName")="" Then
    	strLogin= "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
		strLogin=strLogin & "<form action='UserLogin.asp' method='post' name='UserLogin' onSubmit='return CheckForm();'>"
        strLogin=strLogin & "<tr><td height='25' align='right'>用户名：</td><td height='25'><input name='UserName' type='text' id='UserName' size='10' maxlength='20'></td></tr>"
        strLogin=strLogin & "<tr><td height='25' align='right'>密&nbsp;&nbsp;码：</td><td height='25'><input name='Password' type='password' id='Password' size='10' maxlength='20'></td></tr>"
        strLogin=strLogin & "<tr align='center'><td height='25' colspan='2'><input name='Login' type='submit' id='Login' value=' 登录 '> <input name='Reset' type='reset' id='Reset' value=' 清除 '>"
        strLogin=strLogin & "</td></tr>"
        strLogin=strLogin & "<tr><td height='20' align='center' colspan='2'><a href='UserReg.asp' target='_blank'>新用户注册</a>&nbsp;&nbsp;<a href='GetPassword.asp' target='_blank'>忘记密码？</a></td></tr>"      
        strLogin=strLogin & "</form></table>"
		response.write strLogin
%>
<script language=javascript>
	function CheckForm()
	{
		if(document.UserLogin.UserName.value=="")
		{
			alert("请输入用户名！");
			document.UserLogin.UserName.focus();
			return false;
		}
		if(document.UserLogin.Password.value == "")
		{
			alert("请输入密码！");
			document.UserLogin.Password.focus();
			return false;
		}
	}
</script>
<%
	Else 
		response.write "欢迎您！" & Session("UserName") & "<br><br>"
		response.write "<b>用户控制面板：</b><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='Server.asp'><b>会员管理中心</b></a><br><br>"
	end if
end sub

'=================================================
'过程名：ShowUserLogina
'作  用：显示用户登录表单
'参  数：无
'=================================================
sub ShowUserLogina()
	dim strLogin
	If Session("UserName")="" Then
    	strLogin= "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
		strLogin=strLogin & "<form action='UserLogina.asp' method='post' name='UserLogin' onSubmit='return CheckForm();'>"
        strLogin=strLogin & "<tr><td height='25' align='right'>用户名：</td><td height='25'><input name='UserName' type='text' id='UserName' size='10' maxlength='20'></td></tr>"
        strLogin=strLogin & "<tr><td height='25' align='right'>密&nbsp;&nbsp;码：</td><td height='25'><input name='Password' type='password' id='Password' size='10' maxlength='20'></td></tr>"
        strLogin=strLogin & "<tr align='center'><td height='25' colspan='2'><input name='Login' type='submit' id='Login' value=' 登录 '> <input name='Reset' type='reset' id='Reset' value=' 清除 '>"
        strLogin=strLogin & "</td></tr>"
        strLogin=strLogin & "<tr><td height='20' align='center' colspan='2'><a href='UserReg.asp' target='_blank'>新用户注册</a>&nbsp;&nbsp;<a href='GetPassword.asp' target='_blank'>忘记密码？</a></td></tr>"      
        strLogin=strLogin & "</form></table>"
		response.write strLogin
%>
<script language=javascript>
	function CheckForm()
	{
		if(document.UserLogin.UserName.value=="")
		{
			alert("请输入用户名！");
			document.UserLogin.UserName.focus();
			return false;
		}
		if(document.UserLogin.Password.value == "")
		{
			alert("请输入密码！");
			document.UserLogin.Password.focus();
			return false;
		}
	}
</script>
<%
	Else 
		response.write "欢迎您！" & Session("UserName") & "<br><br>"
		response.write "<b>用户控制面板：</b><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='Server.asp'><b>会员管理中心</b></a><br><br>"
	end if
end sub
%>
