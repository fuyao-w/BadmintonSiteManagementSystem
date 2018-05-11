<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.admin" %>
<%--<%@ page import="com.bean.*" %>--%>
<%--<jsp:useBean id="lb" scope="page" class="com.bean.AdminBean" />--%>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %>admin/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>admin/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/Common.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
//		List list=(List)session.getAttribute("list");
		LinkedList<admin> list2 = (LinkedList<admin>)request.getAttribute("admins");
	%>

<script type="text/javascript">
function checkUser33()
{
	if(document.form1.username.value=="")
	{
		alert("请输入登录名！ ");
		document.form1.username.focus();
		return false;
	}
	if(document.form1.password.value=="")
	{
		alert(" 请输入登陆密码！");
		document.form1.password.focus();
		return false;
	}
}
</script>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>admin/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>

  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
	<form action="/delorinsert" method="post" name="form1" onSubmit="return checkUser33()">
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY>
		  <TR align="center" class=head>
			<TD height=23>序号</TD>
			<TD>管理员名</TD>
			<TD>创建时间</TD>
			<TD>登录次数</TD>
			<TD>删除</TD>
		  </TR>
		<%
		if(list2!= null && list2.size()!=0){
			for(int i = 0; i<list2.size(); i++){
				admin list3 = (admin) list2.get(i);
		%>
		  <TR onClick=OnclikeTable(this) align="center" bgColor=#ffffff>
			<TD width="30" id=map><%=i+1 %></TD>
			<TD id=map><%=list3.getUsername() %></TD>
			<TD id=map><%=list3.getCreattime() %></TD>
			<TD id=map><%=list3.getIsuse() %></TD>
			  <%--<%=basePath %>Admin.do?method=delm&id=<%=list3.getId()%>--%>
			<TD id=map><%if(list3.getId()==1){out.print("删除");}else{%><a name="delete" href="/deladmin?username=<%=list3.getUsername()%>">删除</a><%} %></TD>
		  </TR>
		<%}}else{%>	
		  <TR align="center" bgColor=#ffffff>
			<TD colspan=8 align=center id=map>当前还没有添加管理员</TD>
		  </TR>
		<%} %>  
		  </TBODY>
	   </TABLE><br>
	   <TABLE width="40%" border=0 align="center" cellPadding=3 cellSpacing=1>
	   <TR><TD>
	   <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY>
		  <TR align="center" class=head>
			<TD height=23 colspan="2">增加/修改管理员</TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width="40%" align="right" id=map>管理员名：</TD>
			<TD width="60%" align="left" id=map><input type="text" name="username" value="<%=request.getAttribute("username")==null?"":request.getAttribute("username")%>" maxlength="10" size="18" class=input  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"/>&nbsp;字母或数字6-10位</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD align="right" id=map>登录密码：</TD>
			<TD align="left" id=map><input type="password" name="password" maxlength="16" size="18" class=input  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"/>&nbsp;字母或数字6-16位</TD>
		  </TR>
		  
		  <TR align="center" bgColor=#ffffff>
			<TD colspan="2" align="center" id=map><input type="submit" value="确定">&nbsp;&nbsp;<input type="reset" value="重填"></TD>
			</TR>
		  </TBODY>
	   </TABLE>
	   </TD></TR></table><br>
	   
	  </form>
    </TD>
  </TR>
  </TBODY>
</TABLE>
</BODY>
<% } %>
</HTML>
