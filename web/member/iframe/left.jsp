<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>会员管理中心</TITLE>
<META http-equiv=Content-Language content=zh-cn>

<LINK href="<%=basePath %>member/images/Admin_Style.css" rel=stylesheet>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
<SCRIPT language="JavaScript" type="text/JavaScript">
<!--
var array = new Array();//数字顺延
array[0]=1;array[1]=2;array[2]=3;

function expand(id_value){
  var tmp;
  eval("tmp=document.getElementById('id_"+id_value+"').style.display");
  if(tmp==''){
    eval("document.getElementById('id_"+id_value+"').style.display='none'");
  }else{
   for(i=0;i<array.length;i++){
      eval("document.getElementById('id_"+array[i]+"').style.display='none'");
  }
    eval("document.getElementById('id_"+id_value+"').style.display=''");
  }  
 }
 
//-->
</SCRIPT>

<%
	String member=(String)session.getAttribute("member");
	String type=(String)session.getAttribute("type");
	if(member==null||type==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	    String url="info.jsp";
	    if(type.trim().equals("co"))url="coinfo.jsp";
%>
<BODY   oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>member/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE style="background: #315fa7" bgColor=#eef8fe class=HeaderTdStyle height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE  height=24 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle ><IMG height=17 src="<%=basePath %>member/images/sys.gif" width=21>
          <a href="<%=basePath %>member/iframe/main.jsp" target="MainFrame">管理首页</a></TD></TR></TBODY></TABLE>
      <TABLE  bgColor=#eef8fe   height="100%" cellSpacing=0 cellPadding=0 width="100%" 
      border=0>
        <TBODY>
        <TR>
          <TD vAlign=top height="100%">
          <DIV style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 96%" align=center>
<TABLE  bgColor=#eef8fe cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  <TBODY>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(1)>
    <TR>
    <TD height="31" background="<%=basePath %>member/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %>member/images/linkbg1.gif" > <a href="<%=basePath %>" target="_blank">返回网站首页</a></TD></TR>
    </TABLE>
  </TD>
  </TR> 
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(1)>
    <TR>
    <TD height="31" background="<%=basePath %>member/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %>member/images/linkbg1.gif" > <a href="<%=basePath %>member/info/editpwd.jsp" target="MainFrame">修改登陆密码</a></TD></TR>
    </TABLE>
  </TD>
  </TR>
    <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(1)>
    <TR>
    <TD height="31" background="<%=basePath %>member/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %>member/images/linkbg1.gif" ><a href="/infos?mid=<%=member%>" target="MainFrame">修改详细资料</a></TD></TR>
    </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(2)>
  <TR>
    <TD height="31" background="<%=basePath %>member/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %>member/images/linkbg1.gif" ><a href="/memprep?member=<%=member%>" target="MainFrame">我的预订信息</a></TD></TR>
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(2)>
  <TR>
    <TD height="31" background="<%=basePath %>member/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %>member/images/linkbg1.gif" ><a href="/stj?member=<%=member%>" target="MainFrame">已提交订单</a></TD></TR>
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(2)>
  <TR>
    <TD height="31" background="<%=basePath %>member/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %>member/images/linkbg1.gif" ><a href="/sfh?member=<%=member%>" target="MainFrame">已处理订单</a></TD></TR>
  </TABLE>
  </TD>
  </TR> 
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(3)>
  <TR>
    <TD height="31" background="<%=basePath %>member/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %>member/images/linkbg1.gif" ><a href="/hello" target="_top">退出登陆状态</a></TD></TR>
  </TABLE>
  
  </TD>
  </TR>
   </TABLE>
  </TD>
  </TR>
  </TBODY>
</TABLE>
    </TD>
    </TR>
    </TBODY>
    </TABLE>
</BODY>
<%} %>
</HTML>
