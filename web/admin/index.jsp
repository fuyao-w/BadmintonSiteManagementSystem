<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%
//List list = sn.getSiteInfo();
//String str = list.get(0).toString();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<HTML><HEAD><TITLE>网站后台管理---admin</TITLE>

<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		//String dir=sn.getDir();
%>
<frameset border=0 frameSpacing=0 rows=65,*,33 frameBorder=0>

	<frame name=FrameTop src="<%=basePath %>admin/iframe/top.jsp" frameBorder=no noResize scrolling=no>
	<frameset border=0 name=FrameMain frameSpacing=0 frameBorder=0 cols=165,*>
		<frame name=LeftFrame marginWidth=0 marginHeight=0 src="<%=basePath %>admin/iframe/left.jsp" frameBorder=no scrolling=no>
		<frameset border=0 frameSpacing=0 rows=*,26 frameBorder=0>
			<frame name=MainFrame marginWidth=0 marginHeight=0 src="<%=basePath %>admin/iframe/main.jsp" frameBorder=no noResize scrolling=yes>
			<frame name=BottomFrame marginWidth=0 marginHeight=0 src="<%=basePath %>admin/iframe/help.jsp" frameBorder=no scrolling=no>
		</frameset>
	</frameset>
	<frame name=FrameBottom marginWidth=0 marginHeight=0 src="<%=basePath %>admin/iframe/foot.jsp" frameBorder=no noResize scrolling=no>
</frameset>
<%} %>
</HTML>
