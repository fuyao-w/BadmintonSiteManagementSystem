<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.pmember" %>
<%--<jsp:useBean id="mb" scope="page" class="com.bean.MemberBean"></jsp:useBean>--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML><HEAD>
<LINK href="<%=basePath %>member/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>member/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>images/css/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>member/images/calendar.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<SCRIPT language=JavaScript src="<%=basePath %>member/images/city.js"></SCRIPT>
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
	String type=(String)session.getAttribute("type");
	if(member==null||type==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		pmember pmember = (bean.pmember) request.getAttribute("pmember");
//		List list = mb.getRegInfo(member);
		String str="checked";String str2="";
//		if(list.get(2).toString().trim().equals("f")){
//			str=""; str2="checked";
//		}
%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>member/images/MainBg.gif topMargin=0 scroll=yes marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
	<form action="/submem" method="post" name="regform" onSubmit="return checkpersonreg()" accept-charset="UTF-8">
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY>
		  <TR align="center" class=head>
			<TD colspan="2" height=23>修改会员资料  <FONT color="#FF0000">**</FONT>为必填写字段</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >真实姓名：</TD>
			<TD width="70%" align="left" id=map>
				<INPUT class=inputb maxLength=24 size=30 name=mid value=<%=member %>>
				<INPUT class=inputb maxLength=24 size=30 name=realname value=<%=pmember.getRealname() %>> <FONT color=#ff0000>**</FONT>
			</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >性&nbsp;&nbsp;&nbsp;&nbsp;别：</TD>
			<TD width="70%" align="left" id=map>
			<INPUT type="radio" name="sex" value="m" <%=str %>> 男 <input type="radio" name="sex" value="f" <%=str2 %>>女
			</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >出生日期：</TD>
			<TD width="70%" align="left" id=map>
			<INPUT class=inputb maxLength=24 size=30 name=bir value="<%=pmember.getBir() %>"  readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>
			</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >籍&nbsp;&nbsp;&nbsp;&nbsp;贯：</TD>
			<TD width="70%" align="left" id=map>
			<select style="WIDTH: 80px"  name="sheng" id="sheng" onchange="ProvinceChange(this, regform.city);">
							          <option selected="selected" value="<%=pmember.getCity() %>"><%=pmember.getSheng() %></option>
							          <option value="北京">北京</option>
							          <option value="天津">天津</option>
							          <option value="辽宁">辽宁</option>
							          <option value="吉林">吉林</option>
							          <option value="黑龙江">黑龙江</option>
							          <option value="河北">河北</option>
							          <option value="山西">山西</option>
							          <option value="内蒙古">内蒙古</option>
							          <option value="上海">上海</option>
							          <option value="江苏">江苏</option>
							          <option value="浙江">浙江</option>
							          <option value="安徽">安徽</option>
							          <option value="福建">福建</option>
							          <option value="江西">江西</option>
							          <option value="山东">山东</option>
							          <option value="河南">河南</option>
							          <option value="湖北">湖北</option>
							          <option value="湖南">湖南</option>
							          <option value="广东">广东</option>
							          <option value="广西">广西</option>
							          <option value="海南">海南</option>
							          <option value="重庆">重庆</option>
							          <option value="四川">四川</option>
							          <option value="贵州">贵州</option>
							          <option value="云南">云南</option>
							          <option value="西藏">西藏</option>
							          <option value="陕西">陕西</option>
							          <option value="甘肃">甘肃</option>
							          <option value="青海">青海</option>
							          <option value="宁夏">宁夏</option>
							          <option value="新疆">新疆</option>
							          <option value="台湾">台湾</option>
							          <option value="香港">香港</option>
							          <option value="澳门">澳门</option>
							        </select>
							        <select style="WIDTH: 80px" name="city" id="city" >
							        <option selected="selected" value="<%= pmember.getCity()%>"><%=pmember.getCity() %></option>
							        </select> <FONT color=#ff0000>**</FONT>
							        </TD>
		  <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >联系电话：</TD>
			<TD width="70%" align="left" id=map>
			<INPUT class=inputb name=telphone maxLength=18 size=30  onkeyup="this.value=this.value.replace(/\D/gi,'')" value="<%=pmember.getTelphone()%>"> <FONT color=#ff0000>**</FONT>
			</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >E-mail：</TD>
			<TD width="70%" align="left" id=map>
			<INPUT class=inputb  name=email maxLength=50 size=30  value="<%=pmember.getEmail() %>"> <FONT color=#ff0000>**</FONT> <FONT color=#ff6600>(此电子邮件非常重要，请认真填写！）</FONT>
			</TD>
		  </TR>
		   <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >密码提示问题：</TD>
			<TD width="70%" align="left" id=map>
			<INPUT class=inputb maxLength=28 size=30 name=question  value="<%=pmember.getQuestion() %>"> <FONT color=#ff0000>**</FONT> 需要找回密码的时候,提示的问题“您叫什么名字？”
			</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >问题回答：</TD>
			<TD width="70%" align="left" id=map>
			<INPUT class=inputb maxLength=28 size=30  name=answer value="<%=pmember.getAnswer()%>"> <FONT color=#ff0000>**</FONT> 您自设问题的答案,如您的答案是“小黄”
			</TD>
		  </TR>
		   <TR align="center" bgColor=#ffffff>
			<TD width="30%" align="right" >详细地址：</TD>
			<TD width="70%" align="left" id=map>
			<INPUT class=inputb  name=address maxLength=50 size=30  value="<%=pmember.getAddress() %>"> <FONT color=#ff0000>**</FONT>
			</TD>
		  </TR>
		  <TR align="center" bgColor=#ffffff>
			<TD colspan="2" align="center" ><input type="submit" value="提交">&nbsp;&nbsp;<input type="reset" value="重填"></TD>
		  </TR>
		</TBODY>
	   </TABLE>
	  </form>
    </TD>
  </TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
