<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<HTML >
<HEAD>
<TITLE></TITLE>
<META http-equiv=Content-Language content=zh-cn>



<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
<LINK href="<%=basePath %>images/css.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>images/default.css" type=text/css rel=stylesheet>
    <link href="https://cdn.bootcss.com/Swiper/4.2.2/css/swiper.min.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Droid+Serif" rel="stylesheet" type="text/css">
    <style>
        html,
        body {
            height: 100%;
        }
        .swiper-container {
            width: 100%;
            height: 500px;
            margin-top: 66px;
            position: relative;
        }
        #header {
            position: relative;
        }
        .clearfix::after {
            content: '';
            display: block;
            clear: both;
        }
        #header a {
            color: #fff;
        }

        #header a:hover {
            color: #fed136;
        }

        #header .nav {
            width: 100%;
            background-color: #222222;
            position: fixed;
            height: 66px;
            z-index: 99999;
        }

        #header .nav-brand {
            float: left;
            font-size: 24px;
            font-family: "Kaushan Script", "Helvetica Neue", Helvetica, Arial, cursive;
            padding: 16px 1px 1px 30px;
            color: #fed136;
            margin-left: 40px;
        }

        #header .menu {
            float: right;
            padding: 10px 0;
            margin-right: 66px;
        }

        #header .menu>li {
            font-family: Montserrat, "Helvetica Neue", Helvetica, Arial, sans-serif;
            float: left;
            margin-top: 5px;
            padding: 8px 10px 4px 10px;
            transition: all .8s;
        }
         .head-intro {
             z-index: 99998;
            position: absolute;
            left: 50%;
            top: 44%;
            transform: translate(-50%, -50%);
            text-align: center;
            white-space: nowrap;
        }

       .head-intro h2 {
            color: #fff;
            font-size: 32px;
            font-size: Montserrat, "Helvetica Neue", Helvetica, Arial, sans-serif;
        }

         .head-intro h1 {
            color: #fff;
            font-size: 70px;
            font-family: "Kaushan Script", "Helvetica Neue", Helvetica, Arial, cursive;
            padding: 10px 0 40px 0;
        }
    </style>
</HEAD>
<SCRIPT language=JavaScript src="<%=basePath %>images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>images/index.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>images/calendar.js"></SCRIPT>

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
 
<BODY text=#000000  background=images/xh.gif  leftMargin=0 topMargin=0>
<%--<SCRIPT language=JavaScript>--%>
<%--<!--//目的是为了做风格方便--%>
<%--document.write('<div class="wrap">');--%>
<%--//-->--%>
<%--</SCRIPT>--%>
<%--<TABLE id=toplogin cellSpacing=0 cellPadding=0 width="100%" align=center border=0>--%>
  <%--<TBODY>--%>
  <%--<TR>--%>
    <%--<TD vAlign=center align=left>--%>
      <%--<DIV class=jstime style="FLOAT: left; WIDTH: 45%">--%>
      <%--<%String member2=(String)session.getAttribute("member");if(member2==null){ %>--%>
      <%--【<a href="login.jsp">会员登录</a>】【<a href="reg.jsp">免费注册</a>】【<a href="lost.jsp">忘记密码</a>】--%>
      <%--<%}else{   %>--%>
      <%--欢迎您，尊敬的会员：<%=member2 %> <A href="member/index.jsp" target="">【会员中心】</A>--%>
      <%--<%} %>--%>
      <%--</DIV>--%>
      <%--<DIV class=jstime style="FLOAT: right; WIDTH: 45%; TEXT-ALIGN: right">--%>
	  <%--<!--****************时间日历开始****************-->--%>
      <%--<SCRIPT>setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000)</SCRIPT>--%>
      <%--<SPAN id=clock></SPAN>--%>
	  <%--<!--****************时间日历结束****************-->&nbsp;&nbsp; --%>
      <%--<A href="javascript:javascript:window.external.AddFavorite('<%=basePath %>','<%=sysList.get(0).toString() %>');"> </A> --%>
      <%--<A onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%=basePath %>');" href="http://localhost/#"> </A> --%>
	  <%--<A href="mailto:<%=sysList.get(4).toString() %>"> </A> --%>
	  <%--</DIV>--%>
	<%--</TD>--%>
   <%--</TR>--%>
   <%--</TBODY>--%>
<%--</TABLE>--%>

<div id="header">
    <div class="nav clearfix"><div class="nav-brand">羽毛球管理系统</div>
        <ul class="menu">
            <li><a href="/hello">首    页</a></li>
            <li><a href="/cdxx">场地信息</a></li>
            <li><a href="member/index.jsp">会员中心</a></li>
            <li><a href="/admin">管理登陆</a></li>
        </ul>
    </div>
</div>
<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="images/banner2.jpg" width="100%" height="100%" border=0></div>
        <div class="swiper-slide"><img src="images/banner3.jpg" width="100%" height="100%" border=0></div>
    </div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>
</div>
<div class="head-intro">
    <h2>欢迎光临</h2>
    <h1>释放你的活力!</h1>
</div>
<TABLE id=header cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<%--<TBODY>--%>
  <%--<TR>--%>
    <%--<TD><DIV class=ad id=banner><img src="images/a11.jpg" width="950" height="236" border=0></DIV></TD>--%>
  <%--</TR>--%>
 <%--</TBODY>--%>
<%--</TABLE>--%>


<%--<TABLE id=guide cellSpacing=0 cellPadding=0 width="100%" align=center border=0>--%>
<%--<TBODY>--%>
  <%--<TR>--%>
    <%--<TD align=middle>--%>
	<%--<!--****************主菜单开始****************-->--%>
	<%----%>
	<%--<A href="index.jsp" target="">首    页</A> |--%>
	<%--<A href="nhzp.jsp" target="">场地信息</A> |  --%>
	<%--<A href="member/index.jsp" target="">会员中心</A> | --%>
	<%--<A href="admin/login.jsp" target="">管理登陆</A> --%>
	<%--<!--****************主菜单结束****************-->--%>
	<%--</TD>--%>
  <%--</TR>--%>
<%--</TBODY>--%>
<%--</TABLE>--%>
<script src="https://cdn.bootcss.com/Swiper/4.2.2/js/swiper.min.js"></script>
<script>
    var mySwiper = new Swiper ('.swiper-container', {
        direction: 'horizontal',
        loop: true,
        autoplay: true,

        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },

    })
</script>



