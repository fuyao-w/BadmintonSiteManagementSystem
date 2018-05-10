<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %>admin/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>admin/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/jqPaginator.js"></script>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.center {
	text-align: center;
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script  language="javascript" >
<%--function top(){--%>
   	<%--form3.action="<%=basePath%>admin/member/person.jsp?page=1";--%>
    <%--form3.submit();--%>
<%--}--%>
<%--function last(){--%>
    <%--if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页--%>
    <%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page=1";--%>
    <%--form3.submit();--%>
	<%--}else{--%>
	<%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+form3.pageCount.value;--%>
    	<%--form3.submit();--%>
	<%--}--%>
<%--}--%>
<%--function pre(){--%>
  <%--var page=parseInt(form3.page.value);--%>
  <%--if(page<=1){--%>
    <%--alert("已至第一页");--%>
  <%--}else{--%>
    <%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+(page-1);--%>
    <%--form3.submit();--%>
  <%--}--%>
<%--}--%>

<%--function next(){--%>
  <%--var page=parseInt(form3.page.value);--%>
  <%--var pageCount=parseInt(form3.pageCount.value);--%>
  <%--if(page>=pageCount){--%>
    <%--alert("已至最后一页");--%>
  <%--}else{--%>
    <%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+(page+1);--%>
    <%--form3.submit();--%>
  <%--}--%>
<%--}--%>
<%--function bjump(){--%>
  	<%--var pageCount=parseInt(form3.pageCount.value);--%>
  	<%--if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){--%>
		<%--alert("跳转文本框中只能输入数字!");--%>
		<%--form3.busjump.select();--%>
		<%--form3.busjump.focus();--%>
		<%--return false;--%>
	<%--}--%>
	<%--if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页--%>
	  <%--if(pageCount==0){	--%>
	  <%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page=1";--%>
	  <%--form3.submit();--%>
	<%--}--%>
	<%--else{--%>
		<%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+pageCount;--%>
		<%--form3.submit();--%>
	<%--}--%>
<%--}--%>
<%--else if(form3.busjump.value<=pageCount){--%>
<%--var page=parseInt(form3.busjump.value);--%>
   <%--if(page==0){--%>
      <%--page=1;//如果你输入的是0，那么就让它等于1--%>
      <%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+page;--%>
      <%--form3.submit();--%>
   <%--}else{--%>
      <%--form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+page;--%>
      <%--form3.submit();--%>
   <%--}--%>

<%--}--%>

<%--}--%>
<%--//****判断是否是Number.--%>
<%--function fIsNumber (sV,sR){--%>
<%--var sTmp;--%>
<%--if(sV.length==0){ return (false);}--%>
<%--for (var i=0; i < sV.length; i++){--%>
<%--sTmp= sV.substring (i, i+1);--%>
<%--if (sR.indexOf (sTmp, 0)==-1) {return (false);}--%>
<%--}--%>
<%--return (true);--%>
<%--}--%>

<%--function del()--%>
<%--{--%>
	<%--pageform.submit();--%>
<%--}--%>
<%--function search()--%>
<%--{--%>
	<%--if(document.sform.id.value.replace(/\s+$|^\s+/g,"").length<=0&&document.sform.name.value.replace(/\s+$|^\s+/g,"").length<=0)--%>
	<%--{--%>
		<%--alert("请输入查询条件：ID或者会员名！");--%>
		<%--document.sform.id.focus();--%>
		<%--return false;--%>
	<%--}--%>
	<%--sform.submit();--%>
<%--}--%>
<%--function ts()--%>
<%--{--%>
	<%--if(document.sform.stime.value.replace(/\s+$|^\s+/g,"").length<=0)--%>
	<%--{--%>
		<%--alert("请输入起始时间！");--%>
		<%--document.sform.stime.focus();--%>
		<%--return false;--%>
	<%--}--%>
	<%--if(document.sform.etime.value.replace(/\s+$|^\s+/g,"").length<=0)--%>
	<%--{--%>
		<%--alert("请输入截止时间！");--%>
		<%--document.sform.etime.focus();--%>
		<%--return false;--%>
	<%--}--%>
	<%--document.sform.method.value="TIMESEARCH";--%>
	<%--sform.submit();--%>
<%--}--%>
</script>
<%--<%--%>
<%--String message = (String)request.getAttribute("message");--%>
	<%--if(message == null){--%>
		<%--message = "";--%>
	<%--}--%>
	<%--if (!message.trim().equals("")){--%>
		<%--out.println("<script language='javascript'>");--%>
		<%--out.println("alert('"+message+"');");--%>
		<%--out.println("</script>");--%>
	<%--}--%>
	<%--request.removeAttribute("message");--%>
<%--%>--%>
<%--<%--%>
	<%--String username=(String)session.getAttribute("user");--%>
	<%--if(username==null){--%>
		<%--response.sendRedirect(basePath+"/error.jsp");--%>
	<%--}--%>
	<%--else{--%>
<%--%>--%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>admin/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<%--<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>--%>
  <%--<TBODY>--%>
  <%--<TR>--%>
    <%--<TD align="left" vAlign=top >--%>
<%--<form action="<%=basePath %>MemberManage.do?method=DELMEMBER" method="post" name="pageform">--%>
       <%--<TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>--%>
		  <%--<TBODY>--%>
		  <%--<TR align="center" class=head>--%>
			<%--<TD height=23>序号</TD>--%>
			<%--<TD>会员名</TD>--%>
			<%--<TD>注册时间</TD>--%>
			<%--<TD>登陆次数</TD>--%>
			<%--<TD>上次登陆时间</TD>--%>
			<%--<TD>上次登陆IP</TD>--%>
			<%--<TD>状态</TD>--%>
			<%--<TD>选择</TD>--%>
		  <%--</TR>--%>
		<%--<%--%>
			<%--mb.setEVERYPAGENUM(10);--%>
			<%--int cou = mb.getMessageCount();//得到信息总数			        --%>
			<%--String page1=request.getParameter("page");--%>
			<%--if(page1==null){--%>
				<%--page1="1";--%>
			<%--}--%>
			<%--session.setAttribute("busMessageCount", cou + "");--%>
			<%--session.setAttribute("busPage", page1);--%>
			<%--List pagelist1 = mb.getMessage(Integer.parseInt(page1)); //带进一个页数，并返回该页所要显示的信息 --%>
			<%--session.setAttribute("qqq", pagelist1);--%>
			<%--int pageCount = mb.getPageCount(); //得到页数  --%>
			<%--session.setAttribute("busPageCount", pageCount + ""); --%>
			<%--List pagelist3=(ArrayList)session.getAttribute("qqq");--%>
			<%--%>--%>
	<%--<script type="text/JavaScript">--%>
	<%--function allch()--%>
	<%--{--%>
		<%--for(i=0;i<<%=pagelist3.size()%>;i++)--%>
		<%--{--%>
			<%--document.pageform.checkit(i).checked=document.pageform.checkall.checked;--%>
		<%--}--%>
	<%--}--%>
	<%--</script>--%>
		 <%----%>
			<%--<%--%>
				<%--for(int i=0;i<pagelist3.size();i++){--%>
					<%--List pagelist2 =(ArrayList)pagelist3.get(i);--%>
			<%--%>   --%>
		  <%--<TR align="center" bgColor=#ffffff>--%>
		    <%--<TD id=map><%=i+1 %></TD>--%>
			<%--<TD id=map>--%>
			<%--<a title="点击查看详细信息" href="javascript:" onclick="window.showModelessDialog('<%=basePath+dir %>/member/pminfo.jsp?id=<%=pagelist2.get(0).toString()%>','newwin','dialogHeight:400px;   dialogWidth:   600px;   dialogTop:0px;   dialogLeft:   5px;   edge:   Raised;   center:   Yes;   help:   Yes;   resizable:   Yes;   status:yes;');">					--%>
			<%--<%=pagelist2.get(1).toString() %>--%>
			<%--</a>--%>
			<%--</TD>--%>
			<%--<TD id=map><%=pagelist2.get(2).toString() %></TD>--%>
			<%--<TD id=map><%=pagelist2.get(4).toString() %></TD>--%>
			<%--<TD id=map><%=pagelist2.get(5).toString() %></TD>--%>
			<%--<TD id=map><%=pagelist2.get(6).toString() %></TD>--%>
			<%--<TD id=map><a href="<%=basePath%>MemberManage.do?method=CLOSE&id=<%=pagelist2.get(0).toString()%>">--%>
			<%--<%if(Integer.parseInt(pagelist2.get(3).toString())==1){%><font color=blue>在用</font><%}else{%><font color=red>冻结</font><%} %>--%>
			<%--</a></TD>--%>
			<%--<TD id=map><input type="checkbox" name="checkit" value="<%=pagelist2.get(0).toString()%>"></TD>--%>
		  <%--</TR>--%>
		<%--<%}%>    	--%>
		  <%--<TR align="right" >--%>
			 <%--<TD colspan="10" id=map>--%>
			 <%--<input type="checkbox" name="checkall" onClick="allch()" >&nbsp;全选--%>
			 <%--</TD>--%>
			 <%--</TR>--%>
		<%----%>
		  <%--</TBODY>--%>
      <%--</TABLE></form>--%>
       <%--</TD>--%>
		<%--</TR>--%>
	     <%--<TR>--%>
    	   <%--<TD align="right" vAlign=top >--%>
             <%--<TABLE width="100%" border=0 align="right" cellPadding=3 cellSpacing=1>--%>
		     <%--<TBODY>--%>
		     <%--<TR align="right" class=head>--%>
			 <%--<TD >--%>
			 <%--<form action="" method="post" name="form3">	--%>
			 <%--<input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->--%>
			 <%--<input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         --%>
							<%--<a href="#" onClick="top()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;--%>
				<%--<a href="#" onClick="pre()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;--%>
				 <%--共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;--%>
				<%--<a href="#" onClick="next()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;--%>
				<%--<a href="#" onClick="last()"><img src="<%=basePath %>images/last.gif" border="0" /></a>--%>
			 <%--第<input name="busjump" type="text" size="3" />页<a href="#" onClick="bjump()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;--%>
			 <%--</form>--%>
             <%--</TD>--%>
             <%--</TR>--%>
			 <%--</TBODY>--%>
			 <%--</TABLE>--%>
		  <%--</TD>--%>
		<%--</TR>--%>
		<%--<TR>--%>
    	   <%--<TD align="center" vAlign=top >--%>
             <%--<TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1>--%>
		     <%--<TBODY>--%>
		     <%--<TR align="center" class=head>--%>
			 <%--<TD >--%>
			 <%--<input type="button" name="button" value="删除" onClick="del()" >--%>
			 <%--</TD>--%>
			 <%--</TR>--%>
			 <%--</TBODY>--%>
			 <%--</TABLE>--%>
		  <%--</TD>--%>
		 <%--</TR>--%>
  <%--</TBODY>--%>
<%--</TABLE>--%>


<TBODY>
<TR>
<TD align="left" vAlign=top >

<TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
<TBODY>
<TR align="center" class=head ID="blog">
<TD height=23 WIDTH="10%" class="center">序号</TD>
<TD WIDTH="10%" class="center">会员名</TD>
<TD WIDTH="10%" class="center">注册时间</TD>
<TD WIDTH="10%" class="center">登陆次数</TD>
<TD WIDTH="15%" class="center">上次登陆时间</TD>
<TD WIDTH="15%" class="center">上次登陆IP</TD>
<TD WIDTH="10%" class="center">状态</TD>
<TD WIDTH="10%" class="center">选择</TD>
</TR>

</TBODY>
</TABLE>
    <%--<div id="blog"></div>--%>
	<ul id="aaa"  class="pagination" style="display: flex;justify-content: center;">
		<li><a href="#">&laquo;</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">&raquo;</a></li>
	</ul>

	<script>
        $('#aaa').jqPaginator({
            totalPages: 1,
            visiblePages: 1,
            currentPage: 1,
            first: '<li> <a href="javascript:void(0);">首页</a></li>',
            prev: '<li ><a href="javascript:void(0);">上一页</a></li>',
            next: '<li ><a href="javascript:void(0);">下一页</a></li>',
            last: '<li ><a href="javascript:void(0);">末页</a></li>',
            page: '<li class="active"><a href="javascript:void(0);">{{page}}</a></li>',
            onPageChange: function (num, type) {


                blogFilter(num);
            }
        });


        function blogFilter(num) {

            var json = 'curPage='+num;

            var blogmes=''

            $.ajax({
                type: 'GET',
                contentType: 'application/x-www-form-urlencoded',//注意类型
                /**
                 *(默认: true) 默认情况下，通过data选项传递进来的数据，如果是一个对象(技术上讲只要不是字符串)，
                 * 都会处理转化成一个查询字符串，以配合默认内容类型 "application/x-www-form-urlencoded"。
                 * 如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
                 */
                processData: false,
                url: '/getmenbers',
                dataType: 'json',
                data: json,
                success: function (data) {
                    console.dir(JSON.stringify(data))

                    if (data.pages==0){
                        $('#aaa').html("暂无数据")
                        return;
                    } else{
                    }
                    $('#aaa').jqPaginator('option', {
                        totalPages: data.pages,
                        visiblePages: (data.pages>10)?10:data.pages
                    });
                    var blogdata = data.list;
                    blogmes=''
                    $("#blog").after("");

                    var use = new Array();
                    for (i=0;i<blogdata.length;i++){
                        if (blogdata[i].ifuse==1){
                            console.dir("在用")
                            use[i] = "在用"
                        }
                        else{
                            console.dir("冻结")
                            use[i]= "冻结"}

					}
                    for (i=0;i<blogdata.length;i++){
                        blogmes = blogmes+'<tr  class="trA" onMouseOver="this.className="trB" onMouseOut="this.className="trA">\n' +
                            '      <td width="10%"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].id+'</td>\n' +
                            '      <td width="10%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].username+'</td>\n' +
                            '      <td width="10%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center"> '+blogdata[i].password+'</td>\n' +
                            '      <td  width="10%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].regtime+'</td>\n' +
                            '      <td width="10%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].lasttime+'</td>\n' +
                            '      <td width="20%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].lastip+'</td>\n' +
                            '      <td width="20%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">' +
							'<a href="/setuse?ifuse='+blogdata[i].ifuse+'&id='+blogdata[i].id+'">'+use[i]+ '</a> </td>\n' +

                            '      <td width="10%" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center"><a href="/delmen?id='+blogdata[i].id+'" >删除</a></td>\n' +
                            '    </tr>'
                    }


                    $("#blog").after(blogmes);


                },
                error: function () {
                    alert('请求错误');

                }

            })
        }

	</script>
</BODY>
<%--<%} %>--%>
</HTML>
