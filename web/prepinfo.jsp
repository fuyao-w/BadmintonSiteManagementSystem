<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="iframe/head.jsp" %>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<LINK href="images/default.css" type=text/css rel=stylesheet>
	<LINK href="images/css.css" type=text/css rel=stylesheet>

	<STYLE type=text/css>
		.ycbt {
			BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-COLOR: #EAF2EF; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
		}
		.xsbt {
			BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-IMAGE: url(images/head1.gif); BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
		}
		.xsnr {
			DISPLAY: block
		}
		.ycnr {
			DISPLAY: none
		}
	</STYLE>
	<SCRIPT type=text/javascript>
        function tb_xs(t,m,n){
            for(var i=1;i<=m;i++){
                if (i != n){
                    document.getElementById("tb"+t+ "_bt" + i).className= "ycbt";
                    document.getElementById("tb"+t+ "_nr" + i).className= "ycnr";}
                else{
                    document.getElementById("tb"+t+ "_bt" + i).className= "xsbt";
                    document.getElementById("tb"+t+ "_nr" + i).className= "xsnr";}}}
	</SCRIPT>
	<SCRIPT language=JavaScript>
        <!--//屏蔽出错代码
        function killErr(){
            return true;
        }
        window.onerror=killErr;
        //-->
	</SCRIPT>
	<SCRIPT language=JavaScript>
        <!--//处理大分类一行两个小分类
        function autoTable(div){
            fs=document.getElementById(div).getElementsByTagName("TABLE");
            for(var i=0;i<fs.length;i++){
                fs[i].style.width='49.5%';
                if(i%2==1){
                    if (document.all) {
                        fs[i].style.styleFloat="right";
                    }else{
                        fs[i].style.cssFloat="right;";
                    }
                }else{
                    if (document.all) {
                        fs[i].style.styleFloat="left";
                    }else{
                        fs[i].style.cssFloat="left;";
                    }
                }
            }
        }
        //-->
	</SCRIPT>
	<SCRIPT language=JavaScript src="images/inc.js"></SCRIPT>
	<SCRIPT language=JavaScript src="images/default.js"></SCRIPT>
	<SCRIPT language=JavaScript src="images/swfobject.js"></SCRIPT>
	<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<script type="text/javascript">
    function f1()
    {//rs  sj ts lxr lxfs
        if(document.form1.rs.value=="")
        {
            alert("请填写预定人数！");
            document.form1.rs.focus();
            return false;
        }
        if(isNaN(document.form1.rs.value))
        {
            alert("人数只能为整数！");
            document.form1.rs.focus();
            return false;
        }
        if(document.form1.sj.value=="")
        {
            alert("请填写预定时间！");
            document.form1.sj.focus();
            return false;
        }if(document.form1.ts.value=="")
    {
        alert("请填写联系地址！");
        document.form1.ts.focus();
        return false;
    }if(document.form1.lxr.value=="")
    {
        alert("请填写联系人！");
        document.form1.lxr.focus();
        return false;
    }if(document.form1.lxfs.value=="")
    {
        alert("请填写联系方式！");
        document.form1.lxfs.focus();
        return false;
    }
        form1.submit();
    }
</script>
<%String member=(String)session.getAttribute("member");
	if(member==null){response.sendRedirect("login.jsp");}else{

%>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>
    <!--//目的是为了做风格方便
    document.write('<div class="wrap">');
    //-->
</SCRIPT>
<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
	<TR>
		<TD class=head >
			<SPAN class=TAG>我要预约</SPAN>

		</TD>
	</TR>
	<TR>
		<TD  class=middle align="center" >
			<form action="/addprep" method="post" accept-charset="UTF-8"  name="form1" >
				<TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>

					<TR><input type=hidden name=member value=<%=member%>><input type=hidden name=sid value=<%=request.getParameter("id")%>><input type=hidden name=title value=${sale.getTitle()}>
						<TD width=45% align=right>场地名称：</TD><TD align=left>${sale.getTitle()}</TD>
					</TR>
					<TR>
						<TD width=45% align=right>预约人数：</TD><TD align=left><input type=text name=rs ></TD>
					</TR>
					<TR>
						<TD  align=right>预约时间：</TD><TD align=left><input type=text name=sj  ></TD>
					</TR>
					<TR>
						<TD  align=right>联系地址：</TD><TD align=left><input type=text name=ts  ></TD>
					</TR>
					<TR>
						<TD  align=right>联 系 人：</TD><TD align=left><input type=text name=lxr ></TD>
					</TR>
					<TR>
						<TD  align=right>联系电话：</TD><TD align=left><input type=text name=lxfs  ></TD>
					</TR>
					<TR>
						<TD  align=center colspan=2><br><input type=button onclick="f1()" value="提交预订"></TD>
					</TR>
					</TBODY>
				</TABLE>
			</form>
		</TD>
	</TR>
	</TBODY>
</TABLE>

<SCRIPT language=JavaScript>
    <!--//目的是为了做风格方便
    document.write('</div>');
    //-->
</SCRIPT>
<SCRIPT language=JavaScript>
    <!--
    clickEdit.init();
    //-->
</SCRIPT>
</BODY>
<%} %>
</HTML>

<%@ include file="iframe/foot.jsp"%>