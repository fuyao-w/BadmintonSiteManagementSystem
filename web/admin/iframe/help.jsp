<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Language content=zh-cn>

<LINK href="<%=basePath %>admin/images/Admin_Style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/SetFocus.js"></SCRIPT>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
%>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=1 width="100%" bgColor=#ecf3fb border=0>
  <TBODY>
  <TR>  
    <TD class=sortbutton noWrap align=right width="32%">
     </TD>
  </TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
