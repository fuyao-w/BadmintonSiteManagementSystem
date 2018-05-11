<%@ page language="java" import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>



<%
//List list = sdir.getSiteInfo();
//String str = list.get(0).toString();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站后台管理登录</title>
<style type="text/css">
/*<!--*/
/*.font1 {  font-family: "宋体"; font-size: 12px; line-height: 130%}*/
/*a {  font-family: "宋体"; font-size: 12px}*/
/*a:link {  font-family: "宋体"; font-size: 12px; color: #CFD1E8; text-decoration: underline}*/
/*a:hover {  font-family: "宋体"; font-size: 12px; color: #FFCC00; text-decoration: none}*/
/*a:visited {  font-family: "宋体"; font-size: 12px; color: #CFD1E8; text-decoration: underline}*/
/*.input {  font-family: "宋体"; font-size: 12px; color: #FFFFFF; border: #4047A4; border-style: solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; background-color: #000077}*/
/*-->*/


/* reset */
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,dl,dt,dd,ol,nav ul,nav li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
article, aside, details, figcaption, figure,footer, header, hgroup, menu, nav, section {display: block;}
ol,ul{list-style:none;margin:0px;padding:0px;}
blockquote,q{quotes:none;}
blockquote:before,blockquote:after,q:before,q:after{content:'';content:none;}
table{border-collapse:collapse;border-spacing:0;}
/* start editing from here */
a{text-decoration:none;}
.txt-rt{text-align:right;}/* text align right */
.txt-lt{text-align:left;}/* text align left */
.txt-center{text-align:center;}/* text align center */
.float-rt{float:right;}/* float right */
.float-lt{float:left;}/* float left */
.clear{clear:both;}/* clear float */
.pos-relative{position:relative;}/* Position Relative */
.pos-absolute{position:absolute;}/* Position Absolute */
.vertical-base{	vertical-align:baseline;}/* vertical align baseline */
.vertical-top{	vertical-align:top;}/* vertical align top */
nav.vertical ul li{	display:block;}/* vertical menu */
nav.horizontal ul li{	display: inline-block;}/* horizontal menu */
img{max-width:100%;}
/*end reset*/
/****-----start-body----****/
body{
  background: url(../images/bg2.jpg) no-repeat 0px 0px;
  font-family: 'Open Sans', sans-serif;
  background-size:cover;
  -webkit-background-size:cover;
  -moz-background-size:cover;
  -o-background-size:cover;
}
.wrap{
  margin: 0 auto;
  width: 80%;
}
body a,form li,input[type="submit"],input[type="text"],.sixth-login input[type="submit"],.third-login input[type="submit"]{
  transition: 0.1s all;
  -webkit-transition: 0.1s all;
  -moz-transition: 0.1s all;
  -o-transition: 0.1s all;
}
/*--close--*/
.close{
  background: url('../images/close.png') no-repeat 0px 0px;
  cursor: pointer;
  width: 20px;
  height: 20px;
  position: absolute;
  left: 20px;
  top: 20px;
  -webkit-transition: color 0.2s ease-in-out;
  -moz-transition: color 0.2s ease-in-out;
  -o-transition: color 0.2s ease-in-out;
  transition: color 0.2s ease-in-out;
}
/*--/close--*/
h1 {
  font-family: 'Exo 2', sans-serif;
  text-align: center;
  padding-top: 4em;
  font-weight: 400;
  color: #2B2B36;
  font-size: 2em;
}
.login-form {
  background: #2b2b36;
  position: relative;
  width: 30%;
  margin: 3% auto 0 auto;
  text-align: center;
  border-radius: 15px;
  -webkit-border-radius: 15px;
  -moz-border-radius: 15px;
  -o-border-radius: 15px;
}
.head img {
  width: 100%;
}
.avtar img {
  margin: 2em 0 0;
}
.head-info {
  padding: 5px 0;
  text-align: center;
  font-weight: 600;
  font-size: 2em;
  color: #fff;
  background: #23232e;
  height: 50px;
  border-top-left-radius: 10px;
  -webkit-border-top-left-radius: 10px;
  -moz-border-top-left-radius: 10px;
  -o-border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  -webkit-border-top-right-radius: 10px;
  -moz-border-top-right-radius: 10px;
  -o-border-top-right-radius: 10p
}
input:-webkit-autofill { box-shadow: 0 0 0px 1000px transparent inset !important;}
input[type="text"] {
  width: 70%;
  padding: 1em 2em 1em 3em;
  color: #9199aa;
  font-size: 18px;
  outline: none;
  background: url(../images/adm.png) no-repeat 10px 15px;
  border: none;
  font-weight: 100;
  border-bottom: 1px solid#484856;
  margin-top: 2em;
}
input[type="password"]{
  width: 70%;
  padding: 1em 2em 1em 3em;
  color: #dd3e3e;
  font-size: 18px;
  outline: none;
  background: url(../images/key.png) no-repeat 10px 23px;
  border: none;
  font-weight: 100;
  border-bottom: 1px solid#484856;
  margin-bottom: 3em;
}
.key {
  /*background: url(../images/pass.png) no-repeat 447px 17px;*/
}
input[type="submit"]{
  font-size: 30px;
  color: #fff;
  outline: none;
  border: none;
  background: #3ea751;
  width: 100%;
  padding: 18px 0;
  border-bottom-left-radius: 15px;
  -webkit-border-bottom-left-radius: 15px;
  -moz-border-bottom-left-radius: 15px;
  -o-border-bottom-left-radius: 15px;
  border-bottom-right-radius: 15px;
  -webkit-border-bottom-right-radius: 15px;
  -moz-border-bottom-right-radius: 15px;
  -o-border-bottom-right-radius: 15px;
  cursor: pointer;
}
input[type="submit"]:hover {
  background: #ff2775;
  border-bottom-left-radius: 15px;
  -webkit-border-bottom-left-radius: 15px;
  -moz-border-bottom-left-radius: 15px;
  -o-border-bottom-left-radius: 15px;
  border-bottom-right-radius: 15px;
  -webkit-border-bottom-right-radius: 15px;
  -moz-border-bottom-right-radius: 15px;
  -o-border-bottom-right-radius: 15px;
  transition: 1s all;
  -webkit-transition: 1s all;
  -moz-transition: 1s all;
  -o-transition: 1s all;
}
label.lbl-1 {
  background: #6756ea;
  width: 20px;
  height: 20px;
  display: block;
  float: right;
  border-radius: 50%;
  margin: 16px 10px 0px 0px;
}
label.lbl-2 {
  background: #ea569a;
  width: 20px;
  height: 20px;
  display: block;
  float: right;
  border-radius: 50%;
  margin: 16px 10px 0px 0px;
}
label.lbl-3 {
  background: #f1c85f;
  width: 20px;
  height: 20px;
  display: block;
  float: right;
  border-radius: 50%;
  margin: 16px 10px 0px 0px;
}
/*--start-responsive-design--*/
@media (max-width:1440px){
  .key {
    /*background: url(../images/pass.png) no-repeat 376px 17px;*/
  }

  body {
    min-height: 811px;
  }
}
@media (max-width:1366px){
  .key {
    /*background: url(../images/pass.png) no-repeat 358px 19px;*/
  }
  .copy-rights {
    margin-top: 3em;
  }
  body {
    min-height: 768px;
  }
}
@media (max-width:1280px){
  .key {
    /*background: url(../images/pass.png) no-repeat 336px 18px;*/
  }
  body {
    min-height: 711px;
  }
  .copy-rights {
    margin-top: 0.5em;
  }
}
@media (max-width:1024px){
  .login-form {
    width: 37%;
  }
  .key {
    /*background: url(../images/pass.png) no-repeat 339px 18px;*/
  }
  .copy-rights {
    margin-top: 3em;
  }
  h1 {
    padding-top: 2em;
  }
  body {
    min-height: 675px;
  }
}
@media (max-width:768px){
  .login-form {
    width: 50%;
    margin: 12% auto 0 auto;
  }
  .key {
    /*background: url(../images/pass.png) no-repeat 342px 18px;*/
  }
  body {
    min-height: 929px;
  }
}
@media (max-width:640px){
  .login-form {
    width: 60%;
    margin: 20% auto 0 auto;
  }
  .key {
    /*background: url(../images/pass.png) no-repeat 342px 19px;*/
  }
}
@media (max-width:480px){
  .login-form {
    width: 80%;
  }
}
@media (max-width:320px){
  h1 {
    padding-top: 1em;
    font-size: 1.5em;
  }
  .login-form {
    width: 90%;
    margin: 10% auto 0 auto;
  }
  input[type="text"] {
    width: 62%;
    padding: 1.2em 2em .5em 2.5em;
    font-size: 17px;
    margin-top: .5em;
  }
  input[type="password"] {
    width: 62%;
    padding: 1.2em 2em .5em 2.5em;
    font-size: 17px;
    margin-top: .5em;
    margin-bottom: 2em;
    background: url(../images/key.png) no-repeat 8px 23px;
  }
  .key {
    background: url(../images/pass.png) no-repeat 235px 27px;
  }
  .avtar img {
    margin: 1.1em 0 0;
  }
  .head-info {
    height: 35px;
  }
  label.lbl-1 {
    margin: 8px 10px 0px 0px;
  }
  label.lbl-2 {
    margin: 8px 10px 0px 0px;
  }
  label.lbl-3 {
    margin: 8px 10px 0px 0px;
  }
  .close {
    left: 16px;
    top: 13px;
  }
  .copy-rights {
    margin-top: 2em;
  }
  body {
    min-height: 504px;
  }
  input[type="submit"] {
    font-size: 28px;
    padding: 10px 0;
  }
}
/*--end-responsive-design--*/
</style>
</head>
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
<body>
<div class="login-form" >
  <div class="head-info">
    <label class="lbl-1"> </label>
    <label class="lbl-2"> </label>
    <label class="lbl-3"> </label>
  </div>
  <div class="clear"> </div>
  <form action="/adminLogin"  method="post" autocomplete="off">
    <input type=hidden name=method value="one" />
    <input type="text" name="username" class="text" value="" placeholder="用户名">
    <div class="key">
      <input type="password" name="password" value="" placeholder="口令">
    </div>
    <div class="signin">
      <input type="submit" value="登录" >
    </div>
  </form>

</div>


<%--<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">--%>
  <%--<tr>--%>
    <%--<td align="center">--%>


      <%--<table width="380" border="0" cellspacing="0" cellpadding="0" align="center">--%>
        <%--<tr>--%>
          <%--<td bgcolor="#4047A4" width="1"></td>--%>
          <%--<td>--%>
            <%--<table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
              <%--<tr>--%>
                <%--<td height="36"><br><br><h3><%=str %></h3></td>--%>
              <%--</tr>--%>
            <%--</table><form action="<%=basePath %>Admin.do" name=form1 method=post onSubmit="return checkform(form1)" autocomplete="off">--%>
            <%--<table width="260" border="0" cellspacing="0" cellpadding="0" align="center">--%>

              <%--<tr>--%>
                <%--<td colspan="3" class="news" height="5"><input type=hidden name=method value="one" /></td>--%>
              <%--</tr>--%>

              <%--<tr>--%>
                <%--<td width="5" class="nwes" height="36"></td>--%>
                <%--<td width="106" class="font1" height="36"><font color="#CFD1E8">用户名</font></td>--%>
                <%--<td><input type="text" name="username"  size="15" /></td>--%>
              <%--</tr>--%>
              <%--<tr>--%>
                <%--<td class="nwes" height="36">&nbsp; </td>--%>
                <%--<td class="font1" height="36"><font color="#CFD1E8">口　令</font></td>--%>
                <%--<td><input type="password" name="password" size="15" ></td>--%>
              <%--</tr>--%>

              <%--<tr>--%>
                <%--<td height="5" colspan="3"></td>--%>
              <%--</tr>--%>
              <%--<tr>--%>
                <%--<td>&nbsp; </td>--%>
                <%--<td align="center">&nbsp; </td>--%>
                <%--<td>--%>
                  <%--<input type="image" border="0" name="imageField" src="<%=basePath %><%=dir %>/images/bt_login.gif" width="70" height="16">--%>
                <%--</td>--%>
              <%--</tr>--%>

            <%--</table></form>--%>
            <%--<table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
              <%--<tr>--%>
                <%--<td height="36">&nbsp;</td>--%>
              <%--</tr>--%>
            <%--</table>--%>
          <%--</td>--%>
          <%--<td bgcolor="#4047A4" width="1"></td>--%>
        <%--</tr>--%>
      <%--</table>--%>
      <%--<table width="280" border="0" cellspacing="0" cellpadding="0" align="center">--%>
        <%--<tr>--%>
          <%--<td bgcolor="#4047A4" height="1"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
          <%--<td>&nbsp;</td>--%>
        <%--</tr>--%>
      <%--</table>--%>
    <%--</td>--%>
  <%--</tr>--%>
<%--</table>--%>
</body>
</html>
<script language=Javascript>
	
	// form1.username.focus()
    //
	// function checkform(form)
	// {
	// 	var flag=true;
	// 	if(form("username").value==""){alert("请输入用户名!");form("username").focus();return false};
	// 	if(form("password").value==""){alert("请输入口令!");form("password").focus();return false};
	//
	// 	return flag;
	// }
</script>
