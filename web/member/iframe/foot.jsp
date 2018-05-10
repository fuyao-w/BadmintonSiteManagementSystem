<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<SCRIPT language=JavaScript src="<%=basePath %>member/images/SetFocus.js"></SCRIPT>

<STYLE>TD {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
</STYLE>

<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
<%
	String member=(String)session.getAttribute("member");
	String type=(String)session.getAttribute("type");
	if(member==null||type==null){
		response.sendRedirect(path+"/error.jsp");
	}else{
%>
<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>member/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD bgColor=#73a3d4 height=6></TD></TR></TBODY></TABLE>
<TABLE height=28 cellSpacing=0 cellPadding=0 width="100%" bgColor=#3a6592 
border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE height="100%" cellSpacing=2 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=right width=109>
            <DIV id=st title=全屏/半屏 style="CURSOR: hand" 
            onclick=ChangeLeftFrameStatu(); align=center><FONT 
            color=red>×</FONT> 关闭左栏</DIV></TD>
          <TD align=right width=628></TD>
          <TD 
          style="FONT-WEIGHT: bolder; FILTER: shadow(Color=#000000,direction=180)" 
          align=right width=250></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<SCRIPT language=javascript>    var screen=false;i=0;width=0;    function ChangeLeftFrameStatu()    {        if(screen==false)        {            parent.FrameMain.cols='0,*';            screen=true;            self.st.innerHTML = "√ 打开左栏"        }        else if(screen==true)        {            parent.FrameMain.cols='165,*';           screen=false;            self.st.innerHTML = "<font color=red>×</font> 关闭左栏"        }    }</SCRIPT>
</BODY>
<%} %>
</HTML>
