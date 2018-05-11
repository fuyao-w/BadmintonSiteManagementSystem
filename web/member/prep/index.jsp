<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.function.Predicate" %>
<%@ page import="bean.prep" %>
<%@ page import="java.util.*" %>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%--<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir="admin";
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function del()
{
	pageform.submit();
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
	String member=(String)session.getAttribute("member");
	if(member==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		LinkedList<prep> preps= (LinkedList<prep>) request.getAttribute("preps");
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">编号</td>
      <td  align="center">场地名称</td>
      <td  align="center">预约人数</td>
      <td  align="center">预约时间</td>
      <td  align="center">联系地址</td>
      <td  align="center">联系人</td>
      <td  align="center">联系电话</td>
      <td  align="center">提交时间</td>
      <td  align="center">修改</td>
      <td  align="center">删除</td>
    </tr>
    <%
			if(!preps.isEmpty()){
				for(int i=0;i<preps.size();i++){

			%>

	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='10%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=preps.get(i).getTitle()%></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=preps.get(i).getRs() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=preps.get(i).getSj() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=preps.get(i).getTs() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=preps.get(i).getLxr() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=preps.get(i).getLxfs() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=preps.get(i).getAddtime() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="/chaprep?id=<%=preps.get(i).getId()%>">修改</a></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="/delprep?id=<%=preps.get(i).getId()%>&member=<%=member%>">删除</a></td>
    </tr>
	
<%
	}} 
%>  
</table>
</TD>
</TR>
</TBODY>
</TABLE>
<form action="/addDD?member=<%=preps.get(0).getMember()%>&ddid=<%=preps.get(0).getDdid()%>" method="post" name="form1" >
<p align=center>付款方式：<input type=radio name=fkfs value="银行转账" checked> 银行转账 <input type=radio name=fkfs value="现场支付" > 现场支付
<br><br>
<p align=center>
</form>
<div style="display: flex;justify-content: center;">
<button onclick=""  style="text-align: center;horiz-align: center" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    在线提交订单
</button>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    扫描二维码付款
                </h4>
            </div>
            <div style="display: flex;justify-content: center">
                <img style="text-align: center;padding-left:+.x"  src="<%=basePath%>images/timg.jpg"  alt="二维码" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" onclick="form1.submit();" class="btn btn-primary">
                    提交订单
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</BODY>
<%} %>
</HTML>
