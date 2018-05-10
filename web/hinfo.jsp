<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@page isELIgnored="false"%>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<LINK href="http://localhost:8081/images/default.css" type=text/css rel=stylesheet>
	<LINK href="http://localhost:8081/images/css.css" type=text/css rel=stylesheet>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<STYLE type=text/css>
		/*.ycbt {*/
		/*BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-COLOR: #EAF2EF; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px*/
		/*}*/
		/*.xsbt {*/
		/*BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-IMAGE: url(images/head1.gif); BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px*/
		/*}*/
		/*.xsnr {*/
		/*DISPLAY: block*/
		/*}*/
		/*.ycnr {*/
		/*DISPLAY: none*/
		/*}*/
		.rightpicture {
			/*background-position: 50% 0;*/
			background-size: cover;
			background-repeat: no-repeat;
			/*background-attachment: fixed;*/
			min-height: 593px;
		}

		.leftpicture {
			background-position: 50% 0;
			background-size: cover;
			background-repeat: no-repeat;
			background-attachment: fixed;
			min-height: 593px;
			background-image: url(../img/bg3.jpg);
		}

		section article {
			padding-left: 14%;
			padding-right: 90px;
			padding-top: 94px;
		}

		section article h2 {
			font-size: 31px;
			line-height: 36px;
			font-weight: 300;
			color: #000;
			padding-bottom: 12px;
		}

		section article a {
			line-height: 27px;
			color: #5e5e64;
			padding-bottom: 17px;
			font-weight: 500;
			padding-top: 10px;
			font-size: 15px;
			text-decoration: underline !important;
		}

		section article ul li {
			list-style: square;
			padding: 5px 10px;
			margin-left: 30px;
		}
		hr {
			margin: 10px 0;
			height: 2px;
			border: none;
			background-color: #f6fbff;
			background-image: repeating-linear-gradient(-45deg,#6b92d6,#fff 4px,transparent 4px,transparent 8px);
		}
		.person-info {
			display: flex;
			justify-content: space-between;
		}
		.comment-info {
			border-bottom: 1px solid #DEDEDE;
			padding-bottom: 10px;
		}
		.comment-content {
			margin-top: 6px;
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
	<SCRIPT language=JavaScript src="http://localhost:8081/images/inc.js"></SCRIPT>
	<SCRIPT language=JavaScript src="http://localhost:8081/images/default.js"></SCRIPT>
	<SCRIPT language=JavaScript src="http://localhost:8081/images/swfobject.js"></SCRIPT>
	<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>
    <!--//目的是为了做风格方便
    // document.write('<div class="wrap">');
    //-->
</SCRIPT>

<section class="clearfix" height:1186px" id="AREA">
<%--<%--%>
	<%--String id=request.getParameter("id").trim();--%>
	<%--List hotlist=tb.getOneTrave(Integer.parseInt(id));--%>
	<%--if(!hotlist.isEmpty()){--%>
<%--%>--%>
<div class="col-md-6">
	<article>
		<c:if test="${sale != null}">

			<h2>场地信息</h2>
			<a href="/prepinfo?id=${sale.getId()}&title=${sale.getTitle()}">->我要预订场地.（如果您还没有登录，请先登录再进行预订操作！）</a>
			<ul style="margin-top: 20px">
				<li>场地名称：${sale.getTitle()}</li>
				<li>出租价位：${sale.getDz()} 元/小时</li>
				<li>负 责 人：${sale.getDh()}</li>
				<li>负 责 人：${sale.getJd()}</li>
				<li>咨询电话：${sale.getDh()}</li>
				<li>发布时间：${sale.getAddtime()}</li>
			</ul>

		</c:if>

		<textarea id="mes" style="width: 100%;height: 43px;"></textarea>
		<div style="display: flex;justify-content: flex-end;margin-top: 10px">
			<button id="sub" style="width: 58px;height: 20px">评论</button>
		</div>

		<hr />
		<div class="comment-info">
			<div class="person-info">
				<span>
					<i class="fa fa-comment-o" aria-hidden="true"></i
				</span>
				<span id="time">
         ${comment.time}
				</span>
			</div>
			<div class="comment-content">
				<div id="comment"> ${comment.mes} </div>
			</div>
		</div>
	</article>
</div>
<div class="col-md-6">
	<div class="rightpicture" style="background-image: url(${sale.getUrl()})">

	</div>
</div>

</section>

<script>
    $("button").click(function () {
        var json = 'comment='+ $("#mes").val();




        $.ajax({
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',//注意类型
            /**
             *(默认: true) 默认情况下，通过data选项传递进来的数据，如果是一个对象(技术上讲只要不是字符串)，
             * 都会处理转化成一个查询字符串，以配合默认内容类型 "application/x-www-form-urlencoded"。
             * 如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
             */
            processData: false,
            url: '/comment',
            dataType: 'json',
            data: json,
            success: function (data) {
                a = data.mes;
                console.dir(JSON.stringify(data))
              $("#comment").text(a.mes);
              $("#time").text(a.time);


            },
            error: function () {
                alert('请求错误');

            }

        })

    })


</script>
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