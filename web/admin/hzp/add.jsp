<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%--<%@ page language="java" import="com.fredck.FCKeditor.*" %> --%>
<%--<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %> --%>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%--<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />--%>
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
{
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.pic.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dz.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.yb.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dh.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.jd.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有项目必须填写！");
		return false;
	}
	if(document.form1.pic.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		} 
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
//	String username=(String)session.getAttribute("user");
//	if(username==null){
//		response.sendRedirect(path+"/error.jsp");
//	}
//	else{
//		String method=request.getParameter("method");
//		if(method==null){
//			method="addlvyou";
//		}
//		String title = "";
//		String dz="";
//		String yb="";
//		String dh="";
//		String jd="";
//		String content="";
//		String id="";
//		//String s="如无缩略图请保持为空";
//		if(method.equals("uplvyou")){
//			id=request.getParameter("id").trim();
//			List newsList=tb.getOneTrave(Integer.parseInt(id));
//			title=newsList.get(1).toString();
//			dz=newsList.get(3).toString();
//			yb=newsList.get(4).toString();
//			dh=newsList.get(5).toString();
//			jd=newsList.get(6).toString();
//			content=newsList.get(7).toString();
//		}

%>
<BODY onload="document.form1.infoContent.value=document.form1.content.value" >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
        <form name="form1" action="/upcourt" method="post" accept-charset="UTF-8" enctype="multipart/form-data" >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
<tr class="head"> 
      <td colspan="2">     
<%--<%--%>
	<%--if(method.trim().equals("addlvyou")){--%>
<%--%>--%>
        <%--添加信息 （内容不能超过5000个字符）--%>
<%--<%}else{%>--%>
	   <%--修改信息 （内容不能超过5000个字符）--%>
<%--<%} %>--%>
      </td>
    </tr>
	
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value=""> <input type="hidden" name="id" value="">
    <td width='30%'><div align="right">场地名称：</div></td>
    <td ><input name="title" type="text" id="title" size="40" maxlength="100" value=""></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">缩&nbsp;略&nbsp;图：</div></td>
    <td ><input name="pic" type="file"   size="40" maxlength="150" >&nbsp;<font color=red>300K以下gif或jpg格式图片</font></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='30%'><div align="right">出租价位：</div></td>
    <td ><input name="dz" type="text" id="dz" size="10" maxlength="100" value=""  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元/小时</td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">负 责 人：</div></td>
    <td ><input  name="yb" type="text" id="yb" size="15" maxlength="100" value=""></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">咨询电话：</div></td>
    <td ><input name="dh" type="text" id="dh" size="20" maxlength="100" value=""> </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">容纳人数：</div></td>
    <td ><input name="jd" type="text" id="jd" size="10" maxlength="100" value="" > </TD>
  </tr>
  <tr bgcolor='#FFFFFF' align=center> 
    <td colspan="2" valign="top"><TEXTAREA style="display:none" NAME="content" ROWS="20" COLS="70"></TEXTAREA>
	  <%--<FCK:editor id="infoContent" basePath="/ymq/FCKeditor/"--%>
              <%--width="600"--%>
              <%--height="400"--%>
              <%--skinPath="/ymq/FCKeditor/editor/skins/silver/"--%>
              <%--defaultLanguage="zh-cn"--%>
              <%--tabSpaces="8"--%>
              <%--imageBrowserURL="/ymq/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"--%>
              <%--linkBrowserURL="/ymq/FCKeditor/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"--%>
              <%--flashBrowserURL="/ymq/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"--%>
              <%--imageUploadURL="/ymq/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Image"--%>
              <%--linkUploadURL="/ymq/FCKeditor/editor/filemanager/upload/simpleuploader?Type=File"--%>
              <%--flashUploadURL="/ymq/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Flash">--%>
      <%--</FCK:editor>	--%>
     </td>
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
<%--<%} %>--%>
</HTML>
