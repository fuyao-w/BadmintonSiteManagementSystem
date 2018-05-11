<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>

<STYLE type=text/css>BODY {
	SCROLLBAR-FACE-COLOR: #73a2d6; SCROLLBAR-HIGHLIGHT-COLOR: #73a2d6; SCROLLBAR-SHADOW-COLOR: #73a2d6; SCROLLBAR-3DLIGHT-COLOR: #73a2d6; SCROLLBAR-ARROW-COLOR: #ffffff; SCROLLBAR-TRACK-COLOR: #aabfec; SCROLLBAR-DARKSHADOW-COLOR: #73a2d6
}
.logo {
	FONT-WEIGHT: bold; FONT-SIZE: 36px; COLOR: #73a2d6; FONT-FAMILY: Georgia, "Times New Roman", Times, serif
}
.font_text {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
.font_nav_active {
	FONT-WEIGHT: bold; FONT-SIZE: 14px; BACKGROUND-IMAGE: url(images/topnav_active.jpg); COLOR: #ffffff; LINE-HEIGHT: 20px; HEIGHT: 31px; TEXT-DECORATION: none
}
.font_nav_unactive {
	BORDER-RIGHT: 0px solid; BORDER-TOP: #adbbc7 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 14px; BORDER-LEFT: 0px solid; CURSOR: hand; COLOR: #436e9d; LINE-HEIGHT: 20px; BORDER-BOTTOM: #5085c5 1px solid; HEIGHT: 27px; BACKGROUND-COLOR: #f6f8f9; TEXT-DECORATION: none
}
.br_nav {
	BORDER-RIGHT: 0px solid; BORDER-TOP: #adbbc7 1px solid; FONT-SIZE: 14px; BORDER-LEFT: 0px solid; CURSOR: hand; COLOR: #436e9d; LINE-HEIGHT: 20px; BORDER-BOTTOM: #5085c5 1px solid; HEIGHT: 27px; BACKGROUND-COLOR: #f6f8f9; TEXT-DECORATION: none
}
A.white:link {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:active {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:visited {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:hover {
	FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
.button {
	BORDER-RIGHT: #436e9d 1px double; BORDER-TOP: #436e9d 1px double; FONT-SIZE: 12px; BACKGROUND-IMAGE: url(images/bg.gif); BORDER-LEFT: #436e9d 1px double; CURSOR: hand; COLOR: #333333; LINE-HEIGHT: 16px; BORDER-BOTTOM: #436e9d 1px double; TEXT-DECORATION: none
}
A:link {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:active {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:visited {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: 12px; COLOR: #f29422; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:link {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:active {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:visited {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:hover {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: underline
}
</STYLE>
<SCRIPT language=javascript>		
function out(src){
	if(confirm("确定要退出吗？"))	{
		return true;	
	}
	return false;
}
</SCRIPT>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
<!-- 判断session里用户属性是否为空，为空则跳转到错误页面 -->
<%
	String member=(String)session.getAttribute("member");
	String type=(String)session.getAttribute("type");
	if(member==null||type==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
//	    List list = sn.getSiteInfo();
//	    String str = list.get(0).toString();
%>
<SCRIPT language=javascript><!--
parent.window.defaultStatus="当前用户：<%=member %>  IP地址：<%=request.getRemoteAddr() %>";
//-->
</SCRIPT>
<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>member/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE style="background: #3ea751" align=center cellSpacing=0 cellPadding=0 width="100%" bgColor=#3a6592 border=0>
  <TBODY>
  <TR>
    <TD height=120 align=center><h1>网站会员中心</h1></TD>
                </TR></TBODY></TABLE></BODY>
<%		
	}
%>    
</HTML>
