<%--
  Created by IntelliJ IDEA.
  User: 扶摇
  Date: 2018/5/11
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%--<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String dir=sn.getDir();
%>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<HTML><HEAD><TITLE>后台操作区</TITLE>
    <LINK href="<%=basePath %>admin/images/Admin_Style.css" type=text/css rel=stylesheet>
    <LINK href="<%=basePath %>admin/images/style.css" type=text/css rel=stylesheet>
    <SCRIPT language=JavaScript src="<%=basePath %>admin/images/Common.js"></SCRIPT>

    <script src="<%=basePath%>js/jqPaginator.js"></script>
    <STYLE type=text/css>
        BODY {
            MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
        }
        .center {
            text-align: center;
        }
        .STYLE1 {color: #ECE9D8}
    </STYLE>
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

<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD align="left" vAlign=top >
            <table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
                <tr  class="head">
                    <td width="10%" class="center">编号</td>
                    <td  align="center" width="10%" class="center">会员账号</td>
                    <td  align="center" width="10%" class="center">评论时间</td>
                    <td  align="center" width="10%" class="center">场地名</td>
                    <td  align="center" width="50%" class="center">内容</td>

                    <td  align="center" width="10%" class="center">删除</td>

                </tr>
                <table width="100%" id="blog"></table>




            </table>
        </TD>
    </TR>
    </TBODY>
</TABLE>
<ul id="aaa"  class="pagination" style="display: flex;justify-content: center;">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
<script>

    $('#aaa').jqPaginator({
        totalPages: 1,
        visiblePages: 1,
        currentPage: 1,
        first: '<li> <a href="javascript:void(0);">首页</a></li>',
        prev: '<li ><a href="javascript:void(0);">上一页</a></li>',
        next: '<li ><a href="javascript:void(0);">下一页</a></li>',
        last: '<li ><a href="javascript:void(0);">末页</a></li>',
        page: '<li class="active"><a href="javascript:void(0);">{{page}}</a></li>',
        onPageChange: function (num, type) {


            blogFilter(num);
        }
    });


    function blogFilter(num) {

        var json = 'curPage='+num;

        var blogmes=''

        $.ajax({
            type: 'GET',
            contentType: 'application/x-www-form-urlencoded',//注意类型
            /**
             *(默认: true) 默认情况下，通过data选项传递进来的数据，如果是一个对象(技术上讲只要不是字符串)，
             * 都会处理转化成一个查询字符串，以配合默认内容类型 "application/x-www-form-urlencoded"。
             * 如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
             */
            processData: false,
            url: '/review',
            dataType: 'json',
            data: json,
            success: function (data) {
                console.dir(JSON.stringify(data))


                if (data.pages==0){
                    $('#aaa').html("暂无数据")
                    return;
                } else{
                }
                $('#aaa').jqPaginator('option', {
                    totalPages: data.pages,
                    visiblePages: (data.pages>10)?10:data.pages
                });
                var blogdata = data.list;
                blogmes=''
                $("#blog").html("");
                for (i=0;i<blogdata.length;i++){
                    blogmes = blogmes+'<tr  class="trA" onMouseOver="this.className="trB" onMouseOut="this.className="trA">\n' +
                        '      <td width="10%"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].id+'</td>\n' +
                        '      <td width="10%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].username+'</td>\n' +
                        '      <td width="10%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center"> '+blogdata[i].times+'</td>\n' +
                        '      <td  width="10%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].title+'</td>\n' +
                        '      <td width="50%"  bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center">'+blogdata[i].content+'</td>\n' +
                        '      <td width="10%" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;" class="center"><a href="/delrev?id=' + blogdata[i].id + '" >删除</a></td>\n' +
                        '    </tr>'
                }


                $("#blog").html(blogmes);


            },
            error: function () {
                alert('请求错误');

            }

        })
    }


</script>


</BODY>
<%--<%} %>--%>
</HTML>

