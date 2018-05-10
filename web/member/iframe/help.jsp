<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="<%=basePath %>member/images/Admin_Style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
<%
	String member=(String)session.getAttribute("member");
	String type=(String)session.getAttribute("type");
	if(member==null||type==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
%>
<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>member/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=1 width="100%" 
bgColor=#ecf3fb border=0>
  <TBODY>
  <TR>
    
    <TD class=sortbutton noWrap align=right width="32%"></TD></TR></TBODY></TABLE>
</BODY>
<%} %>
</HTML>
