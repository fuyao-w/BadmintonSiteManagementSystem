<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="iframe/head.jsp"%>
<jsp:useBean id="code" scope="page" class="util.CheckCode" />
<SCRIPT language=javascript>
    //检验表单的合法性
    function checklogin() {
        if (document.form1.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
            alert("\请输入您的用户名！");
            document.form1.username.focus();
        }
        else if (document.form1.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
            alert("\请输入您的密码！");
            document.form1.password.focus();
        }
        else if(document.form1.checkcode.value.replace(/\s+$|^\s+/g,"").length<=0) {
            alert("\请输入验证码！");
            document.form1.checkcode.focus();
        }
        else if (document.form1.checkcode.value != document.form1.yzm.value) {
            alert("\验证码错误！");
            document.form1.checkcode.focus();
        }
        else{
            form1.submit();
        }
    }
</SCRIPT>
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
    String yzm=code.getCheckCode();
%>
<DIV id=body-width>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD height=230>
                <FORM id=form1 name=form1 action=/login method=post style="display: flex;
    justify-content: center;">
                    <TABLE id=Table7 width=400 border=0>
                        <TBODY>
                        <TR height=40>
                            <TD vAlign=center align=middle colSpan=3 style="font-size: 15px">
                                <FONT face=宋体></FONT><BR><FONT color=#ff7700><STRONG>欢迎登陆</STRONG></FONT>
                            </TD></TR>
                        <TR>
                            <%--<TD colSpan=3>--%>
                            <%--<HR class=hui align=center width="98%" SIZE=1>--%>
                            <%--</TD></TR>--%>
                        <TR height=60>

                            <TD noWrap align=middle width=171>
                                <TABLE width="100%" border=0>
                                    <TBODY>
                                    <TR>
                                        <TD width="35%" height=24>用户名：</TD>
                                        <TD>
                                            <INPUT class=input_new id=username style="WIDTH: 110px" size=15 maxLength=10 name=username onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                                   onkeyup="value=value.replace(/[\W]/g,'')"  value=<%=request.getAttribute("reg_user")==null?"":request.getAttribute("reg_user") %>>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD height=25>密　码：</TD>
                                        <TD height=25>
                                            <INPUT class=input_new id=password style="WIDTH: 110px" type=password size=15  maxLength=16 name=password onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                                   onkeyup="value=value.replace(/[\W]/g,'')">
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD height=25>验证码：</TD>
                                        <TD height=25><input type="hidden" name="yzm" value="<%=yzm %>" >
                                            <INPUT class=input_new id=checkcode size=5 maxlength="4" name=checkcode onKeyUp="this.value=this.value.replace(/\D/gi,'')"> <%=yzm %>
                                        </TD>
                                    </TR>
                                    </TBODY>
                                </TABLE>
                            </TD>
                            <TD width=81>
                                <LABEL><br>
                                    <input type=button value="登陆" onClick="checklogin()">
                                </LABEL>
                            </TD>
                        </TR>
                        <TR>
                            <TD vAlign=center height=20>
                                <DIV id=Login1_ValidationSummary2 style="DISPLAY: none; COLOR: red" showmessagebox="True" showsummary="False"></DIV></TD>
                            <TD class=red1 vAlign=center>
                                <A class=dhx12 href=""></A>
                            </TD>
                            <TD vAlign=center>
                                <A href="lost.jsp">找回密码</A> <A href="<%=basePath %>reg.jsp">注册会员</A>
                            </TD>
                        </TR>
                        <%--<TR>--%>
                        <%--<TD vAlign=center colSpan=3 height=22>--%>
                        <%--<HR class=hui align=center width="98%" SIZE=1>--%>
                        <%--</TD></TR>--%>
                        <%--<TR height=40>--%>
                        <%--<TD class=buttomtxt align=middle colSpan=3 height=21>--%>
                        <%--<%=sysList.get(0).toString() %>--%>
                        <%--</TD>--%>
                        <%--</TR>--%>
                        </TBODY>
                    </TABLE>
                </FORM>
            </TD></TR></TBODY></TABLE>
</DIV>
<%@ include file="iframe/foot.jsp"%>
