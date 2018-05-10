<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
 
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/Common.js"></SCRIPT>
<STYLE type=text/css>BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
</STYLE>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
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
//		List list2 = sn.getSiteInfo();
//	    String str = list2.get(0).toString();
%>

<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>admin	/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
 <br><br><br><br><br><p align=center><font color=red><strong>admin</strong></font>
</BODY>
<%} %>
</HTML>
