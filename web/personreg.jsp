<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ include file="iframe/head.jsp" %>
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

  
            <TABLE class=dragTable  height=75 cellSpacing=0 cellPadding=0 width=100% align=center 
            border=0>
              <TBODY>
              <TR>
                <TD class=head>
                  
                      <FONT color=#000000>您现在的位置：会员申请&gt;&gt; 详细资料</FONT>
					
					</TD>
					</TR>
              <TR>
                <TD vAlign=top align=middle bgColor=#f5f5f5><BR>
                <FORM id="regform" name="regform" action="inpmem" method="post" accept-charset="UTF-8">
                  <TABLE cellSpacing=0 cellPadding=0 width=100% bgColor=#f5f5f5 border=0>
                    
                    <TBODY>
                    <TR>
                      <TD align=left class=white width=100% bgColor=#c8c8c8 height=23>　
					  <SPAN class=black><FONT color=blue><strong>用户注册个人信息: </strong></FONT>　　　　　　　　　　 
                        <FONT color="#FF0000">**</FONT>为必填写字段&nbsp;&nbsp;</SPAN></TD></TR>
                    <TR>
                      <TD vAlign=top align=middle bgColor=#ffffff height=209>
                        <DIV align=center>
         <TABLE  height=237 cellSpacing=0  cellPadding=0 width="100%" border=0 hspace="12">
                          <TBODY>
                          <TR e>
                            <TD vAlign=center align=right  height=12>用 户 名：</TD>
                            <TD width=556 height=24 align=left><INPUT class=inputb maxLength=24 size=30  name="mid" value="<%=request.getAttribute("username") %>" readonly></TD>
							</TR>
                          <TR >
                            <TD vAlign=center align=right  height=24>登陆密码：</TD>
                            <TD width=556 height=24 align=left><INPUT class=inputb maxLength=24 size=30  name="password" value='<%=request.getAttribute("password") %>' readonly></TD></TR>
						  <TR >
						    <TD vAlign=center align=right  height=26>&nbsp;&nbsp;真实姓名：</TD>
						    <TD width=556 height=26 align=left>
							<INPUT class=inputb maxLength=24 size=30 name=realname> <FONT color=#ff0000>**</FONT> </TD></TR>
                          <TR >
                            <TD vAlign=center align=right  height=26>&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：</TD>
                            <TD width=556 height=26 align=left>
							<INPUT type="radio" name="sex" value="m" checked="checked"> 男 <input type="radio" name="sex" value="f" >女</TD></TR>
						  <TR >
						    <TD vAlign=center align=right  height=26>&nbsp;&nbsp;出生日期：</TD>
						    <TD width=556 height=26 align=left>
						    <INPUT class=inputb maxLength=24 size=30 name=bir readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>  
						    格式：2008-01-01</TD></TR>
                          <TR >
                            <TD vAlign=center align=right  height=12>籍&nbsp;&nbsp;&nbsp;&nbsp;贯：</TD>
                            <TD height=12 align=left>                                 
                                  <select style="WIDTH: 80px"  name="sheng" id="sheng" onchange="ProvinceChange(this, regform.city);">
							          <option selected="selected" value="">-请选择-</option>
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
							        <option selected="selected" value="">-请选择-</option>
							        </select>           <FONT color=#ff0000>**</FONT> </TD></TR>              
                          <TR >
                            <TD vAlign=center align=right height=12>详细地址：</TD>
                            <TD height=12 align=left>
							<INPUT class=inputb  name=address maxLength=50 size=30 > <FONT color=#ff0000>**</FONT> 
                              </TD></TR>
                          <TR >
                            <TD vAlign=center align=right  height=12>联系电话：</TD>
                            <TD height=12 align=left>
							<INPUT class=inputb name=telphone maxLength=18 size=30  onkeyup="this.value=this.value.replace(/\D/gi,'')"> <FONT color=#ff0000>**</FONT> </TD></TR>
                          <TR >
                            <TD vAlign=center align=right height=12>E-mail：</TD>
                            <TD height=12 align=left>
							<INPUT class=inputb  name=email maxLength=50 size=30 > <FONT color=#ff0000>**</FONT> 
                              <FONT color=#ff6600>(此电子邮件非常重要，请认真填写！）</FONT></TD></TR>
                          <TR >
                            <TD vAlign=center align=right  
                            height=12>&nbsp;&nbsp;密码提示问题：</TD>
                            <TD width=556 height=12 align=left>
						<INPUT class=inputb maxLength=28 size=30 name=question> <FONT color=#ff0000>**</FONT> 需要找回密码的时候,提示的问题“您叫什么名字？”</TD></TR>
                          <TR >
                            <TD vAlign=center align=right  height=17>&nbsp;&nbsp;问题回答：</TD>
                            <TD width=556 height=17 align=left>
							<INPUT class=inputb maxLength=28 size=30  name=answer> <FONT color=#ff0000>**</FONT> 您自设问题的答案,如您的答案是“小黄” </TD></TR>
                          <TR>
                            <TD vAlign=center align=center width=697 colSpan=2 height=17>
                              <P align=center>
                              <img src=<%=basePath %>images/sub.gif onclick="checkpersonreg()" border=0>
							  </TD>
							  </TR>
							  </TBODY>
							  </TABLE>
							  </DIV>
							  </TD>
							  </TR>
							  </TBODY></TABLE></FORM>
 </TD></TR></TBODY></TABLE>
<%@ include file="iframe/foot.jsp"%>