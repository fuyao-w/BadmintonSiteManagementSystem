<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%--<jsp:useBean id="ab" scope="page" class="com.bean.AfficheBean" /> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir="admin";
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<SCRIPT language=JavaScript src="<%=basePath %>js/echarts.common.min.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script  language="javascript" >
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

<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no 
marginheight="0" marginwidth="0">
<div id="main" style="display: flex;justify-content: center;align-items: center;height: 400px"></div>
<div id="main1" style="display: flex;justify-content: center;align-items: center;height: 400px"></div>


<script>


    var myChart = echarts.init(document.getElementById("main"));
    var myChart1 = echarts.init(document.getElementById("main1"));
    option = {
        backgroundColor: '#2c343c',

        title: {
            text: '场地预订未提交订单统计图',
            left: 'center',
            top: 20,
            textStyle: {
                color: '#ccc'
            }
        },

        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },

        visualMap: {
            show: false,
            min: 80,
            max: 600,
            inRange: {
                colorLightness: [0, 1]
            }
        },
        series : [
            {
                name:'预订信息',
                type:'pie',
                radius : '55%',
                center: ['50%', '50%'],
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:274, name:'联盟广告'},
                    {value:235, name:'视频广告'},
                    {value:400, name:'搜索引擎'}
                ].sort(function (a, b) { return a.value - b.value; }),
                roseType: 'radius',
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#c23531',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },

                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    };
    myChart.setOption(option)
    option1 = {
        backgroundColor: '#2c343c',

        title: {
            text: '场地预订已提交订单统计图',
            left: 'center',
            top: 20,
            textStyle: {
                color: '#ccc'
            }
        },

        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },

        visualMap: {
            show: false,
            min: 80,
            max: 600,
            inRange: {
                colorLightness: [0, 1]
            }
        },
        series : [
            {
                name:'预订信息',
                type:'pie',
                radius : '55%',
                center: ['50%', '50%'],
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:274, name:'联盟广告'},
                    {value:235, name:'视频广告'},
                    {value:400, name:'搜索引擎'}
                ].sort(function (a, b) { return a.value - b.value; }),
                roseType: 'radius',
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#c23531',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },

                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    };


    myChart1.setOption(option1)
    $.ajax({
        contentType : "application/json",
        type : "GET",
        url : "/chart",
        dataType : "json",
        success : function(datas) {


			jsondata=JSON.stringify(datas);
            console.dir(jsondata)
            //创建一个数组，用来装对象传给series.data，因为series.data里面不能直接鞋for循环
            var servicedata=[];
           var servicedata1=[];

            var data;
            data=datas.list1;
            for(var i=0;i<data.length;i++){
                var obj=new Object();
                obj.name=data[i].title;
                obj.value=data[i].courts;
                servicedata[i]=obj;
            }

            var data1;
            data1=datas.list2;
            for(var i=0;i<data1.length;i++){
                var obj=new Object();
                obj.name=data[i].title;
                obj.value=data[i].courts;
                servicedata1[i]=obj;
            }

            myChart.setOption({

                series:[{
                    name:'访问量',
                    type:'pie',
                    radius:'60%',
                    data:servicedata,
                }]

            });
            myChart1.setOption({

                series:[{
                    name:'访问量',
                    type:'pie',
                    radius:'60%',
                    data:servicedata1,
                }]

            });

        }
    });
</script>
</BODY>

</HTML>
