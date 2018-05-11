<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@page isELIgnored="false"%>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" /> --%>
<%--<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir="admin";
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="<%=path %>FCKeditor/fckeditor.js"></script> 
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function sub()
{//hm xm dh zz  zj sj sjzj lx bz  
	if(document.form1.xm.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.sfz.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dh.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dz.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.bz.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有内容必须填写！");
		//document.form1.title.focus();
		return false;
	}
	 
	 
	form1.submit();
}
</script>
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
//		String method=request.getParameter("method");
//
//		String xm="";String xb="";String sfz="";String dh=""; String dz=""; String bz="";
//		String id="";
//
//		if(method.equals("upGL")){
//			id=request.getParameter("id");
//			List newsList=cb.get1Com("select * from td where id='"+id+"'",7);
//			xm=newsList.get(1).toString();
//			xb=newsList.get(2).toString();
//			sfz=newsList.get(3).toString();
//			dh=newsList.get(4).toString();
//			dz=newsList.get(5).toString();
//			bz=newsList.get(6).toString();
//		}
		 
%>
<BODY >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="subgl" method="post" accept-charset="UTF-8" >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value=""> <input type="hidden" name="id" value="${td.getId()}">
    <td width='30%'><div align="right">人员姓名：</div></td>
    <td ><input name="xm" type="text" size="15" maxlength="100" value="${td.getXm()}"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">性别：</div></td>
    <td ><input name="xb" type="radio" value="1" checked> 男 <input name="xb" type="radio" value="0"  > 女 </td>
  </tr>
   <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">身份证号码：</div></td>
    <td ><input name="sfz" type="text"  size="20" maxlength="100" value="${td.getSfz()}"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">联系电话：</div></td>
    <td ><input name="dh" type="text"  size="20" maxlength="100" value="${td.getDh()}"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">联系地址：</div></td>
    <td ><input name="dz" type="text"  size="20" maxlength="100" value="${td.getDz()}"></td>
  </tr>
   <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">详细信息：</div></td>
    <td ><TEXTAREA NAME="bz" ROWS="6" COLS="30">${td.getBz()}</TEXTAREA></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交数据' onclick='sub()'>
      </td>
    </tr>
	
</table></form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
