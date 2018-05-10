<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" isErrorPage="true" %>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="iframe/head.jsp" %>
<%@page isELIgnored="false"%>
<HTML >

<HEAD>
	<LINK href="http://localhost:8081/images/default.css" type=text/css rel=stylesheet>
	<LINK href="http://localhost:8081/images/css.css" type=text/css rel=stylesheet>
	<link href="http://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Droid+Serif" rel="stylesheet" type="text/css">
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		ul,
		ol {
			list-style: none;
		}

		a {
			text-decoration: none;
		}


		/*common css*/

		.layout {
			width: 1000px;
			margin: 0 auto;
		}

		.clearfix::after {
			content: '';
			display: block;
			clear: both;
		}

		.btn {
			display: inline-block;
			text-align: center;
			margin: 0 auto;
			line-height: 55px;
			font-size: 16px;
			padding: 0 53px;
			color: #FFF;
			background-color: #6bb551;
			border-radius: 4px;
			text-transform: uppercase;
			transition: all .5s;
		}

		.btn:hover {
			background-color: #5ea246;
		}

		body {
			font: 14px/1.5 Arial;
			color: #666;
			min-width: 1000px;
			position: relative;
		}

		.col-md-4 {
			float: left;
			width: 33.3333333%;
			text-align: center;
			padding: 0 15px;
		}

		.col-md-6 {
			float: left;
			width: 50%;
		}

		.altitude {
			height: 100%;
			position: relative;
		}

		.haeding-title {
			font-size: 40px;
			margin-top: 0;
			margin-bottom: 15px;
			font-family: Arial, sans-serif;
			text-transform: uppercase;
			font-weight: 700;
			color: #000;
		}

		.heading-content {
			margin-bottom: 75px;
			font-style: italic;
			font-size: 15px;
			font-family: "Droid Serif", "Helvetica Neue", Helvetica, Arial, sans-serif;
		}
		.services {
			text-align: center;
			padding: 150px 0;
		}
		figure {
			margin: 0 auto;
			border-radius: 100%;
			width: 100px;
			height: 100px;
			border: 2px solid #6bb551;
			text-align: center;
			line-height: 98px;
			color: #6bb551;
			font-size: 40px;
			transition: all .5s;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		figure:hover {
			background-color: #6bb551;
			color: #fff;
		}

		/*ABOUT*/

		.about {
			text-align: center;
			padding: 140px 0 30px 0;
		}

		.timeline {
			padding: 0;
			position: relative;
		}

		.timeline>li {
			position: relative;
			margin-bottom: 170px;
			min-height: 100px;
		}

		.timeline .img-circle {
			border-radius: 50%;
			position: absolute;
			width: 170px;
			height: 170px;
			left: 50%;
			margin-left: -85px;
			border: 5px solid #f1f1f1;
			transition: all .5s;
		}

		.timeline .img-circle:hover {
			webkit-transform: rotate(360deg) scale(1.1);
			moz-transform: rotate(360deg) scale(1.1);
			ms-transform: rotate(360deg) scale(1.1);
			transform: rotate(360deg) scale(1.1);
			box-shadow: 0 6px 10px 0 rgba(0, 0, 0, .2), 0 -6px -10px 0 rgba(0, 0, 0, .2);
		}

		.timeline-panel {
			margin-left: 20px;
			width: 350px;
			text-align: right;
		}

		li:nth-of-type(2n) .timeline-panel {
			margin-left: 640px;
			width: 350px;
			text-align: left;
		}

		.timeline:before {
			content: '';
			position: absolute;
			left: 50%;
			height: 100%;
			border-left: 2px solid #f1f1f1;
		}

		.timeline-panel>.subheading {
			font-size: 24px;
			color: #000;
			font-family: "Kaushan Script", "Helvetica Neue", Helvetica, Arial, cursive;
		}

		.timeline-body {
			padding: 10px 10px 10px 0;
		}

		.timeline-body>.text {
			font-family: "Droid Serif", "Helvetica Neue", Helvetica, Arial, sans-serif;
		}

		.circle {
			display: flex;
			justify-content: center;
			align-items: center;
			position: absolute;
			width: 170px;
			height: 170px;
			border-radius: 50%;
			padding-top: 32px;
			padding-bottom: 40px;
			font-size: 24px;
			font-weight: 700;
			left: 50%;
			background-color: #fed136;
			text-align: center;
			margin-left: -85px;
			color: #fff;
			border: 5px solid #f1f1f1;
		}
	</style>

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
	<SCRIPT language=JavaScript src="http://localhost:8081/images/inc.js"></SCRIPT>
	<SCRIPT language=JavaScript src="http://localhost:8081/images/default.js"></SCRIPT>
	<SCRIPT language=JavaScript src="http://localhost:8081/images/swfobject.js"></SCRIPT>
	<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
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
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>
    <!--//目的是为了做风格方便
    document.write('<div class="wrap">');
    //-->
</SCRIPT>
<%--<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>--%>
<%--<TBODY>--%>
<%--<TR>--%>

<%----%>
<%--<TD class=Side vAlign=top align=left width="75%" height=200>--%>
<%--<!--*******************************新闻资讯开始*******************************-->--%>
<%--<TABLE  class=dragTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>--%>
<%--<TBODY>--%>
<%--<TR>--%>
<%--<TD align="center"><img src="http://localhost:8081/images/s.jpg" width=705 height=238 border=0></TD>--%>
<%--</TR>--%>
<%--</TBODY>--%>
<%--</TABLE>--%>
<%--<!--*******************************新闻资讯结束*******************************-->--%>
<%--</TD>--%>
<%--<TD class=Side vAlign=top align=right width="25%">--%>
<%--<!--*******************************滚动公告开始*******************************-->--%>
<%--<TABLE width="100%" height="240" border=0 cellPadding=0 cellSpacing=0 class=dragTable>--%>
<%--<TBODY>--%>
<%--<TR>--%>
<%--<TD class=head>--%>
<%--<SPAN class=TAG>--%>
<%--<P>网站公告</P>--%>
<%--</SPAN>--%>
<%--</TD>--%>
<%--</TR>--%>
<%--<TR>--%>
<%--<TD class=middle align=left>--%>
<%--<MARQUEE onmouseover=if(document.all!=null){this.stop()} onmouseout=if(document.all!=null){this.start()} scrollAmount=1 scrollDelay=1 direction=up height=180>--%>
<%--<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>--%>
<%--<TBODY>--%>
<%--<%if(!affList.isEmpty()){--%>
<%--for(int aff=0;aff<affList.size();aff++){--%>
<%--List affList2=(List)affList.get(aff);--%>
<%--%>--%>
<%--<TR>--%>
<%--<TD width="100%">--%>
<%--<%=affList2.get(1).toString() %>---<%=affList2.get(2).toString() %><BR>--%>
<%--</TD>--%>
<%--</TR>--%>
<%--<%--%>
<%--}--%>
<%--}--%>
<%--%>--%>
<%----%>
<%--</TBODY>--%>
<%--</TABLE>--%>
<%--</MARQUEE>--%>
<%--</TD>--%>
<%--</TR>--%>
<%--</TBODY>--%>
<%--<!--*******************************滚动公告结束*******************************-->--%>
<%--</TABLE>--%>
<%--</TD>--%>
<%--</TR>--%>
<%--</TBODY>--%>
<%--</TABLE>--%>

<section class="altitude layout">
	<div class="services" style="border-bottom: 1px solid #ccc">
		<h3 class="haeding-title">首页</h3>
		<p class="heading-content">我们能提供的服务</p>
		<div class="clearfix">
			<div class="col-md-4">
				<figure><i class="fa fa-rocket" aria-hidden="true"></i></figure>
				<h4 style="margin:15px 0;font-size:18px;color:#000">高效的服务</h4>
				<p style="word-break:break-all">场地信息</p>
			</div>
			<div class="col-md-4">
				<figure><i class="fa fa-paper-plane" aria-hidden="true"></i></figure>
				<h4 style="margin:15px 0;font-size:18px;color:#000">提供信息</h4>
				<p style="word-break:break-all">提供场地信息.</p>
			</div>
			<div class="col-md-4">
				<figure><i class="fa fa-lock" aria-hidden="true"></i></figure>
				<h4 style="margin:15px 0;font-size:18px;color:#000">安全性</h4>
				<p style="word-break:break-all">我们慎重的承诺保证客户数据和隐私安全</p>
			</div>
		</div>
	</div>
</section>

<section class="layout clearfix" id="ABOUT">
	<div class="about">
		<h3 class="haeding-title">场地信息</h3>
		<p class="heading-content">介绍一些场地.</p>
	</div>
	<ul class="timeline">





		<c:if test="${sales.size()>0}">
			<c:forEach  var="i" begin="0" end="${sales.size()-1}">
				<li><a href="/court?id=${sales.get(i).getId()}"><img class="img-circle" src="${sales.get(i).getUrl()}" alt=""></a>
					<div class="timeline-panel">
						<h4 class="subheading">点击图片查看场地信息</h4>
						<div class="timeline-body">
							<p class="text">${sales.get(i).getTitle()}</p>
						</div>
					</div>
				</li>
			</c:forEach>

		</c:if>


		<li>
			<div class="circle"> 完</div>
		</li>
	</ul>
</section>
<!--*******************************最新开始*******************************-->
<%--<TABLE class=MainTable style="MARGIN-TOP: 0px" cellSpacing=0 cellPadding=0 width="100%" align=center border=0>--%>
<%--<TBODY>--%>
<%--<TR>--%>
<%--<TD class=Main vAlign=top height=100>--%>
<%--<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>--%>
<%--<TBODY>--%>
<%--<TR>--%>
<%--<TD class=head>--%>
<%--<SPAN class=TAG>场地信息</SPAN>--%>

<%--</TD>--%>
<%--</TR>--%>
<%--<TR>--%>
<%--<TD class=middle>--%>
<%--<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>--%>
<%--<TBODY>--%>
<%--<TR>--%>
<%--<%--%>
<%--List resList=tb.get10PTrave();--%>
<%--if(!resList.isEmpty()){--%>
<%--for(int res=0;res<resList.size();res++)--%>
<%--{--%>
<%--List resList2=(List)resList.get(res);--%>
<%--%>--%>
<%--<TD width="14%">--%>
<%--<DIV >--%>
<%--<P class=img>--%>
<%--<a href="http://localhost:8081/hinfo.jsp?id=<%=resList2.get(0).toString()%>"><IMG height=150 src="<%="http://localhost:8081/"+resList2.get(2).toString()%>" width=180 onload=makesmallpic(this,180,150); border=0></A>--%>
<%--</P>--%>
<%--<P class=title style="TEXT-ALIGN: center">--%>
<%--<a href="http://localhost:8081/hinfo.jsp?id=<%=resList2.get(0).toString()%>"><%=resList2.get(1).toString()%></a>--%>
<%--</P>--%>
<%--</DIV>--%>
<%--</TD>--%>
<%--<%--%>
<%--}--%>
<%--}--%>
<%--%>--%>

<%--</TR>--%>
<%--</TBODY>--%>
<%--</TABLE>--%>
<%--</TD>--%>
<%--</TR>--%>
<%--</TBODY>--%>
<%--</TABLE>--%>
<%--</TD>--%>
<%--</TR>--%>
<%--</TBODY>--%>
<%--</TABLE>--%>



<!--*******************************信息栏目下通栏广告开始AF01*******************************-->


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
</HTML>

<%@ include file="iframe/foot.jsp"%>