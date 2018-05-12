<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%--<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
    <TITLE>系统管理</TITLE>
    <META http-equiv=Content-Language content=zh-cn>

    <LINK href="<%=basePath %>admin/images/Admin_Style.css" rel=stylesheet>
    <META content="MSHTML 6.00.2900.3243" name=GENERATOR>
</HEAD>
<SCRIPT language="JavaScript" type="text/JavaScript">
    <!--
    var array = new Array();//数字顺延
    array[0]=1;array[1]=2;array[2]=3;array[3]=4;array[4]=5;array[5]=6;array[6]=7;
    function expand(id_value){
        var tmp;
        eval("tmp=document.getElementById('id_"+id_value+"').style.display");
        if(tmp==''){
            eval("document.getElementById('id_"+id_value+"').style.display='none'");
        }else{
            for(i=0;i<array.length;i++){
                eval("document.getElementById('id_"+array[i]+"').style.display='none'");
            }
            eval("document.getElementById('id_"+id_value+"').style.display=''");
        }
    }
    //-->
</SCRIPT>
<%
    String username=(String)session.getAttribute("user");
    if(username==null){
        response.sendRedirect(path+"/error.jsp");
    }
    else{
//        List list=(List)session.getAttribute("list");
//        String QX=list.get(4).toString();
//        String temp[]=QX.split("/");
%>
<BODY   oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %>admin/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE style="background: #3ba1a7" bgColor=#eef8fe class=HeaderTdStyle height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD vAlign=top align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD align=middle ><IMG height=17 src="<%=basePath %>admin/images/sys.gif" width=21>
                        <a href="<%=basePath %>admin/iframe/main.jsp" target="MainFrame">管理首页</a>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
            <TABLE  bgColor=#eef8fe   height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD vAlign=top height="100%">
                        <DIV style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 96%" align=center>
                            <TABLE  bgColor=#eef8fe cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
                                <TBODY>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(1)>
                                            <TR>
                                                <TD height="31" background="<%=basePath %>admin/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="<%=basePath %>admin/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;管理员管理</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_1 style="display:none">
                                            <TR>
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default">
      <a href="<%=basePath %>/alladmin" target="MainFrame">管理员管理</a></SPAN></TD></TR>
                                            <TR>
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default">
      <a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">修改登录密码</a></SPAN></TD></TR>

                                        </TABLE>
                                    </TD>
                                </TR>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(2)>
                                            <TR>
                                                <TD height="31" background="<%=basePath %>admin/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="<%=basePath %>admin/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;图表统计查看</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_2 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="/charts" target="MainFrame">图表统计</a></SPAN></TD></TR><TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="/jk" target="MainFrame">监控</a></SPAN></TD></TR>


                                        </TABLE>
                                    </TD>
                                </TR>


                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(3)>
                                            <TR>
                                                <TD height="31" background="<%=basePath %>admin/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="<%=basePath %>admin/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;场地信息管理</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_3 style="display:none">

                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %>admin/hzp/index.jsp" target="MainFrame">场地信息管理</a></SPAN></TD></TR>
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %>admin/hzp/add.jsp?method=addlvyou" target="MainFrame">添加场地信息</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(4)>
                                            <TR>
                                                <TD height="31" background="<%=basePath %>admin/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="<%=basePath %>admin/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;注册会员管理</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_4 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %>menbersadmin" target="MainFrame">注册会员管理</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(5)>
                                            <TR>
                                                <TD height="31" background="<%=basePath %>admin/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="<%=basePath %>admin/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;预约信息管理</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_5 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %>prepadmin" target="MainFrame">预约信息管理</a></SPAN></TD></TR>
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %>fhadmin" target="MainFrame">已处理预约信息</a></SPAN></TD></TR>

                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %>admin/prep/review.jsp " target="MainFrame">评论信息</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>

                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(6)>
                                            <TR>
                                                <TD height="31" background="<%=basePath %>admin/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="<%=basePath %>admin/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;管理人员管理</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_6 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="/gettds" target="MainFrame">管理人员管理</a></SPAN></TD></TR>
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="/setGl" target="MainFrame">增加管理人员</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(7)>
                                            <TR>
                                                <TD height="31" background="<%=basePath %>admin/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="<%=basePath %>admin/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;退出登陆</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_7 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="<%=basePath %>admin/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath%>hello" target=_top>退出登陆</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>

                                </TBODY>
                            </TABLE>
                        </DIV>

                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD></TR>
    </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
