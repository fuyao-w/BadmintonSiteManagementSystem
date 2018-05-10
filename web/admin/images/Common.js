//
function ResumeError()
 {
        return true;
    }
window.onerror = ResumeError;

//验证系统基本设置
function checksite()
{
	if(document.form1.sitename.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入网站名称！");
		document.form1.sitename.focus();
		return false;
	}
	if(document.form1.url.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入网站网址！");
		document.form1.url.focus();
		return false;
	}
	if(document.form1.keyword.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入搜索关键字！");
		document.form1.keyword.focus();
		return false;
	}
	if(document.form1.description.value.replace(/\s+$|^\s+/g,"").length<=0)
   	{
   		alert("请输入网站说明！");
       	document.form1.description.focus();
      	return false;  
   	}
	if(document.form1.email.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入管理员邮箱！");
		document.form1.email.focus();
		return false;
	}
	if(!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(document.form1.email.value)) 
    {
        alert("请输入格式正确的 e-mail 地址！");
        document.form1.email.focus();
        return false;         
    }
    if(document.form1.reasons.value.replace(/\s+$|^\s+/g,"").length<10||document.form1.reasons.value.replace(/\s+$|^\s+/g,"").length>1000)
   	{
   		alert("请输入网站关闭原因，字数在10-1000个字符之间！");
       	document.form1.reasons.focus();
      	return false;  
   	}
    if(document.form1.dir.value.replace(/\s+$|^\s+/g,"").length<=0)
   	{
   		alert("请输入后台访问目录！");
       	document.form1.dir.focus();
      	return false;  
   	}
   	if(document.form1.record.value.replace(/\s+$|^\s+/g,"").length<=0)
   	{
   		alert("请输入网站备案登记号，如未审批完成请填写:备案中");
       	document.form1.record.focus();
      	return false;  
   	}
   	if(document.form1.copyright.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.copyright.value.replace(/\s+$|^\s+/g,"").length>1000)
   	{
   		alert("请输入底部版权信息或联系方式，字数在10-1000个字符之间！");
       	document.form1.copyright.focus();
      	return false;  
   	}
}
//验证增加管理员
function checkUser()
{
	if(document.form1.add.checked)
	{
		if(document.form1.username.value=="")
		{
			alert("请输入管理员名！");
			document.form1.username.focus();
			return false;
		}
		if(document.form1.username.value.length<6||document.form1.username.value.length>10)
		{
			alert("管理员名在6-10位之间！");
			document.form1.username.focus();
			return false;
		}
		if(document.form1.password.value=="")
		{
			alert("请输入管理员登录密码！");
			document.form1.password.focus();
			return false;
		}
		if(document.form1.password.value.length<6||document.form1.password.value.length>16)
		{
			alert("密码在6-16位之间！");
			document.form1.password.focus();
			return false;
		}
		if(document.form1.isuse.value=="")
		{
			alert("请选择设定状态！");
			document.form1.isuse.focus();
			return false;
		}
		document.form1.ra.value="add";
	}
	if(document.form1.update.checked)
	{
		if(document.form1.password.value!="")
		{
			if(document.form1.password.value.length<6||document.form1.password.value.length>16)
			{
				alert("密码在6-16位之间！");
				document.form1.password.focus();
				return false;
			}
		}	
		if(document.form1.isuse.value=="")
		{
			alert("请选择设定状态！");
			document.form1.isuse.focus();
			return false;
		}
		document.form1.ra.value="update";
	}
}
//验证修改管理员密码
function checkPWD()
{
	if(document.form1.oldpwd.value=="")
	{
		alert("请输入旧密码！");
		document.form1.oldpwd.focus();
		return false;
	}
	if(document.form1.newpwd.value=="")
	{
		alert("请输入新密码！");
		document.form1.newpwd.focus();
		return false;
	}
	if(document.form1.newpwd.value.length<6||document.form1.newpwd.value.length>16)
	{
		alert("密码为6-16位之间！");
		document.form1.newpwd.focus();
		return false;
	}
	if(document.form1.repwd.value=="")
	{
		alert("请确认密码！");
		document.form1.repwd.focus();
		return false;
	}
	if(document.form1.repwd.value!=document.form1.newpwd.value)
	{
		alert("对不起，两次输入的密码不相同，请确认密码！");
		document.form1.repwd.focus();
		return false;
	}
}

//验证导航菜单管理
function checkMENU()
{
	if(document.form1.menuname.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入菜单名称！");
		document.form1.menuname.focus();
		return false;
	}
	if(document.form1.pic.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		} 
		var filestr = document.all.pic.value;
		 var fso,f; 
		 fso=new ActiveXObject("Scripting.FileSystemObject");  
		 f=fso.GetFile(filestr); 
		 if(f.size>80*1024)
		 {
		 	alert("对不起，图片过大，请裁剪后再上传！"); 
		 	return false;
		 }
	}
	if(document.form1.linkurl.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入链接地址！");
		document.form1.linkurl.focus();
		return false;
	}
	if(document.form1.ordernum.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		if(isNaN(document.form1.ordernum.value))
		{
		   	alert("排序请输入数字！");
			document.form1.ordernum.focus();
			return false;	
		}
	}
	form1.submit();
}

//验证友情链接输入
function subFLINK()
{
	if(document.form1.linkname.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入链接名称！");
		document.form1.linkname.focus();
		return false;
	}
	if(document.form1.linkurl.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入链接地址！");
		document.form1.linkurl.focus();
		return false;
	}
/**	if(document.form1.method.value=="addflink")
	{
		if(document.form1.linkpic.value.replace(/\s+$|^\s+/g,"").length<=0)
		{
			alert("请选择LOGO图片！");
			document.form1.linkpic.focus();
			return false;
		}
*/
	if(document.form1.linkpic.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
	//	var fileext=form1.linkpic.value.substring(form1.linkpic.value.length-4,form1.linkpic.value.length); 
	//	fileext=fileext.toLowerCase(); 
	//	if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
	//	{
	//		alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			alert("请填写logo地址！");
			form1.linkpic.focus(); 
			return false; 
	//	} 
	}
		/**
		var filestr = document.all.linkpic.value;
		 var fso,f; 
		 fso=new ActiveXObject("Scripting.FileSystemObject");  
		 f=fso.GetFile(filestr); 
		 if(f.size>80*1024)
		 {
		 	alert("对不起，图片过大，请裁剪后再上传！"); 
		 	return false;
		 }
		 */
//	}	
	if(document.form1.intero.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入链接说明！");
		document.form1.intero.focus();
		return false;
	}
	if(document.form1.ordervalue.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入排序数字！");
		document.form1.ordervalue.focus();
		return false;	
	}
	if(isNaN(document.form1.ordervalue.value))
	{
	   	alert("排序请输入数字！");
		document.form1.ordervalue.focus();
		return false;	
	}
	form1.submit();
}
//验证广告提交数据
function subAD()
{
	if(document.form1.adplace.value=="")
	{
		alert("请选择广告位置！");
		document.form1.adplace.focus();
		return false;
	}
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请填写广告名称！");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.method.value=="AddAD")
	{
		if(document.form1.picurl.value.replace(/\s+$|^\s+/g,"").length<=0)
		{
			alert("请上传广告图片！");
			document.form1.picurl.focus();
			return false;
		}
		if(document.form1.picurl.value.replace(/\s+$|^\s+/g,"").length>0)
		{
			var fileext=form1.picurl.value.substring(form1.picurl.value.length-4,form1.picurl.value.length); 
			fileext=fileext.toLowerCase(); 
			if(!(fileext=='.jpg')&&!(fileext=='.gif')&&!(fileext=='.swf')) 
			{
				alert("对不起，文件格式不对,必须为jpg或gif或swf格式文件!"); 
				form1.picurl.focus(); 
				return false; 
			} 
			/**
			var filestr = document.all.picurl.value;
			 var fso,f; 
			 fso=new ActiveXObject("Scripting.FileSystemObject");  
			 f=fso.GetFile(filestr); 
			 if(f.size>80*1024)
			 {
			 	alert("上传文件过大，请裁剪后再上传！"); 
			 	form1.picurl.focus(); 
			 	return false;
			 }
			 */
		}
	}
	if(document.form1.picurl.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		var fileext=form1.picurl.value.substring(form1.picurl.value.length-4,form1.picurl.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')&&!(fileext=='.swf')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif或swf格式文件!"); 
			form1.picurl.focus(); 
			return false; 
		} 
		/**
		var filestr = document.all.picurl.value;
		 var fso,f; 
		 fso=new ActiveXObject("Scripting.FileSystemObject");  
		 f=fso.GetFile(filestr); 
		 if(f.size>80*1024)
		 {
		 	alert("上传文件过大，请裁剪后再上传！"); 
		 	form1.picurl.focus(); 
		 	return false;
		 }
		 */
	}
	if(document.form1.linkurl.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请填写广告链接地址！");
		document.form1.linkurl.focus();
		return false;
	}
	if(document.form1.intro.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请填写广告说明！");
		document.form1.intro.focus();
		return false;
	}
	if(document.form1.stime.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请填写广告开始时间！");
		document.form1.stime.focus();
		return false;
	}
	if(document.form1.etime.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请填写广告到期时间！");
		document.form1.etime.focus();
		return false;
	}
	form1.submit();
}

//验证qq悬窗客服数据
function subQQ()
{
	if(document.form1.num.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入QQ号码！");
		document.form1.num.focus();
		return false;
	}
	if(isNaN(document.form1.num.value))
	{
		alert("QQ号码只能为数字！");
		document.form1.num.focus();
		return false;
	}
	if(document.form1.num.value.replace(/\s+$|^\s+/g,"").length<5||document.form1.num.value.replace(/\s+$|^\s+/g,"").length>9)
	{
		alert("QQ号码在5-9位之间！");
		document.form1.num.focus();
		return false;
	}
	if(document.form1.intro.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入文字说明！");
		document.form1.intro.focus();
		return false;
	}
	form1.submit();
}

//验证对联广告数据
function subDUILIAN()
{
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入名称！");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.id.value==0)
	{
		if(document.form1.lefturl.value.replace(/\s+$|^\s+/g,"").length<=0)
		{
			alert("请上传左侧对联图片！");
			document.form1.lefturl.focus();
			return false;
		}
		if(document.form1.lefturl.value.replace(/\s+$|^\s+/g,"").length>0)
		{
			var fileext=form1.lefturl.value.substring(form1.lefturl.value.length-4,form1.lefturl.value.length); 
			fileext=fileext.toLowerCase(); 
			if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
			{
				alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
				form1.lefturl.focus(); 
				return false; 
			} 
			var filestr = document.all.lefturl.value;
			 var fso,f; 
			 fso=new ActiveXObject("Scripting.FileSystemObject");  
			 f=fso.GetFile(filestr); 
			 if(f.size>300*1024)
			 {
			 	alert("对不起，图片过大，请裁剪后再上传！"); 
			 	return false;
			 }
		}
		if(document.form1.righturl.value.replace(/\s+$|^\s+/g,"").length<=0)
		{
			alert("请上传右侧对联图片！");
			document.form1.righturl.focus();
			return false;
		}
		if(document.form1.righturl.value.replace(/\s+$|^\s+/g,"").length>0)
		{
			var fileext=form1.righturl.value.substring(form1.righturl.value.length-4,form1.righturl.value.length); 
			fileext=fileext.toLowerCase(); 
			if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
			{
				alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
				form1.righturl.focus(); 
				return false; 
			} 
			var filestr = document.all.righturl.value;
			 var fso,f; 
			 fso=new ActiveXObject("Scripting.FileSystemObject");  
			 f=fso.GetFile(filestr); 
			 if(f.size>300*1024)
			 {
			 	alert("对不起，图片过大，请裁剪后再上传！"); 
			 	return false;
			 }
		}
	}
	if(document.form1.id.value!=0)
	{
		if(document.form1.lefturl.value.replace(/\s+$|^\s+/g,"").length>0)
		{
			var fileext=form1.lefturl.value.substring(form1.lefturl.value.length-4,form1.lefturl.value.length); 
			fileext=fileext.toLowerCase(); 
			if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
			{
				alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
				form1.lefturl.focus(); 
				return false; 
			} 
			var filestr = document.all.lefturl.value;
			 var fso,f; 
			 fso=new ActiveXObject("Scripting.FileSystemObject");  
			 f=fso.GetFile(filestr); 
			 if(f.size>300*1024)
			 {
			 	alert("对不起，图片过大，请裁剪后再上传！"); 
			 	return false;
			 }
		}
		if(document.form1.righturl.value.replace(/\s+$|^\s+/g,"").length>0)
		{
			var fileext=form1.righturl.value.substring(form1.righturl.value.length-4,form1.righturl.value.length); 
			fileext=fileext.toLowerCase(); 
			if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
			{
				alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
				form1.righturl.focus(); 
				return false; 
			} 
			var filestr = document.all.righturl.value;
			 var fso,f; 
			 fso=new ActiveXObject("Scripting.FileSystemObject");  
			 f=fso.GetFile(filestr); 
			 if(f.size>300*1024)
			 {
			 	alert("对不起，图片过大，请裁剪后再上传！"); 
			 	return false;
			 }
		}
	}
	if(document.form1.leftlink.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入左侧链接地址！");
		document.form1.leftlink.focus();
		return false;
	}
	if(document.form1.rightlink.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入右侧链接地址！");
		document.form1.rightlink.focus();
		return false;
	}
	form1.submit();
}

//验证首页浮动广告
function subFLYAD()
{
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入名称！");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.id.value==0)
	{
		if(document.form1.lefturl.value.replace(/\s+$|^\s+/g,"").length<=0)
		{
			alert("请上传浮动图片！");
			document.form1.lefturl.focus();
			return false;
		}
		if(document.form1.lefturl.value.replace(/\s+$|^\s+/g,"").length>0)
		{
			var fileext=form1.lefturl.value.substring(form1.lefturl.value.length-4,form1.lefturl.value.length); 
			fileext=fileext.toLowerCase(); 
			if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
			{
				alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
				form1.lefturl.focus(); 
				return false; 
			} 
			var filestr = document.all.lefturl.value;
			 var fso,f; 
			 fso=new ActiveXObject("Scripting.FileSystemObject");  
			 f=fso.GetFile(filestr); 
			 if(f.size>300*1024)
			 {
			 	alert("对不起，图片过大，请裁剪后再上传！"); 
			 	return false;
			 }
		}
	}
	if(document.form1.id.value!=0)
	{
		if(document.form1.lefturl.value.replace(/\s+$|^\s+/g,"").length>0)
		{
			var fileext=form1.lefturl.value.substring(form1.lefturl.value.length-4,form1.lefturl.value.length); 
			fileext=fileext.toLowerCase(); 
			if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
			{
				alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
				form1.lefturl.focus(); 
				return false; 
			} 
			var filestr = document.all.lefturl.value;
			 var fso,f; 
			 fso=new ActiveXObject("Scripting.FileSystemObject");  
			 f=fso.GetFile(filestr); 
			 if(f.size>300*1024)
			 {
			 	alert("对不起，图片过大，请裁剪后再上传！"); 
			 	return false;
			 }
		}
	}
	if(document.form1.leftlink.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入链接地址！");
		document.form1.leftlink.focus();
		return false;
	}
	form1.submit();
}

//网站投票（站内调查）验证
function subVote()
{
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入调查主题！");
		document.form1.title.focus();
		return false;
	}
	
	if(document.form1.item1.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入选项一！");
		document.form1.item1.focus();
		return false;
	}
	if(document.form1.tick1.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		if(isNaN(document.form1.tick1.value))
		{
			alert("请正确输入票数！");
			document.form1.tick1.focus();
			return false;
		}
	}
	if(document.form1.item2.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入选项二！");
		document.form1.item2.focus();
		return false;
	}
	if(document.form1.tick2.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		if(isNaN(document.form1.tick2.value))
		{
			alert("请正确输入票数！");
			document.form1.tick2.focus();
			return false;
		}
	}
	if(document.form1.item3.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入选项三！");
		document.form1.item3.focus();
		return false;
	}
	if(document.form1.tick3.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		if(isNaN(document.form1.tick3.value))
		{
			alert("请正确输入票数！");
			document.form1.tick3.focus();
			return false;
		}
	}
	if(document.form1.item4.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入选项四！");
		document.form1.item4.focus();
		return false;
	}
	if(document.form1.tick4.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		if(isNaN(document.form1.tick4.value))
		{
			alert("请正确输入票数！");
			document.form1.tick4.focus();
			return false;
		}
	}
	if(document.form1.item5.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入选项五！");
		document.form1.item5.focus();
		return false;
	}
	if(document.form1.tick5.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		if(isNaN(document.form1.tick5.value))
		{
			alert("请正确输入票数！");
			document.form1.tick5.focus();
			return false;
		}
	}
	if(document.form1.item6.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入选项六！");
		document.form1.item6.focus();
		return false;
	}
	if(document.form1.tick6.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		if(isNaN(document.form1.tick6.value))
		{
			alert("请正确输入票数！");
			document.form1.tick6.focus();
			return false;
		}
	}
	form1.submit();
}

//房产 二手 交友 分类 招聘分类验证
function infoClass()
{
	if(document.form1.classname.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入信息分类");
		document.form1.classname.focus();
		return false;
	}
	form1.submit();
}
/*
if (window.Event) 
document.captureEvents(Event.MOUSEUP); 
function nocontextmenu() 
{
event.cancelBubble = true
event.returnValue = false;
return false;
}
function norightclick(e) 
{
if (window.Event) 
{
if (e.which == 2 || e.which == 3)
return false;
}
else
if (event.button == 2 || event.button == 3)
{
event.cancelBubble = true
event.returnValue = false;
return false;
}
}
document.oncontextmenu = nocontextmenu; // for IE5+
document.onmousedown = norightclick; // for all others
*/
function OnclikeTableInfoCLASS(tr){

	var frm = document.form1[0];
	var vlu = new Array();
	for( i = 0 ; i < 5 ; i++ ){
		vlu[i] = tr.childNodes[i].childNodes[0].nodeValue;
		if(vlu[i]==null){
			vlu[i] = "";
		}
	}
	form1.classname.value = vlu[1];
	form1.id2.value = vlu[0];
	form1.action.value="up";

}
function OnclikeTable(tr){

	var frm = document.form1[0];
	var vlu = new Array();
	for( i = 0 ; i < 6 ; i++ ){
		vlu[i] = tr.childNodes[i].childNodes[0].nodeValue;
		if(vlu[i]==null){
			vlu[i] = "";
		}
	}
	form1.username.value = vlu[1];
	form1.username.readonly=true;
	//alert(vlu[3]);
	form1.isuse.value = vlu[3];
	form1.add.checked=false;
	form1.add.disabled=true;
	form1.update.checked=true;
	form1.update.disabled=false;
}
function OnclikeTableitem(tr){

	var frm = document.form1[0];
	var vlu = new Array();
	for( i = 0 ; i < 2 ; i++ ){
		vlu[i] = tr.childNodes[i].childNodes[0].nodeValue;
		if(vlu[i]==null){
			vlu[i] = "";
		}
	}
	
	form1.id.value = vlu[0];
	form1.itemname.value = vlu[1];
}

function OnclikeTableitemClass(tr){

	var frm = document.form1[0];
	var vlu = new Array();
	for( i = 0 ; i < 2 ; i++ ){
		vlu[i] = tr.childNodes[i].childNodes[0].nodeValue;
		if(vlu[i]==null){
			vlu[i] = "";
		}
	}
	
	form1.id.value = vlu[0];
	form1.classname.value = vlu[1];
}
 //
function changecheck()
{
	form1.add.checked=true;
	form1.update.checked=false;
}
function changecheck2()
{
	form1.add.checked=false;
	form1.update.checked=true;
} 

function is_zw(str)
{
	//exp=/[0-9a-zA-Z_.,#@!$%^&*()-+=|\?/<>]/g;
	//if(str.search(exp) != -1)
	//{
	//	return false;
	//}
	//return true;
}
//
function CheckBadChar(Obj,AlertStr)
{
	exp=/[,]/g;
	if(Obj.value.search(exp) != -1)
	{   alert(AlertStr);
	    Obj.value="";
		Obj.focus();
		return false;
	}
	return true;
}
//
function IsExt(FileName, AllowExt){
		var sTemp;
		var s=AllowExt.toUpperCase().split("|");
		for (var i=0;i<s.length ;i++ ){
			sTemp=FileName.substr(FileName.length-s[i].length-1);
			sTemp=sTemp.toUpperCase();
			s[i]="."+s[i];
			if (s[i]==sTemp){
				return true;
				break;
			}
		}
		return false;
}
//
function is_number(str)
{
	exp=/[^0-9()-]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}
//
function CheckNumber(Obj,DescriptionStr)
{
	if (Obj.value!='' && (isNaN(Obj.value) || Obj.value<0))
	{
		alert(DescriptionStr);
		Obj.value="";
		Obj.focus();
		return false;
	}
	return true;
}
//
function is_email(str)
{ if((str.indexOf("@")==-1)||(str.indexOf(".")==-1)){
	
	return false;
	}
	return true;
}
function CheckAll(form)
{
				  for (var i=0;i<form.elements.length;i++)
				  {
					var e = form.elements[i];
					if (e.Name != 'chkAll'&&e.disabled==false)
					   e.checked = form.chkAll.checked;
					}
 } 
function OpenWindow(Url,Width,Height,WindowObj)
{
	var ReturnStr=showModalDialog(Url,WindowObj,'dialogWidth:'+Width+'pt;dialogHeight:'+Height+'pt;status:no;help:no;scroll:no;status:0;help:0;scroll:0;');
	return ReturnStr;
}
function WinPop(url, width, height)
{
  window.showModelessDialog(url,"",'dialogWidth=' + width + 'px; dialogHeight=' + height + 'px; resizable=no; help=no; scroll=no; status=no;resizable=0; help=0; scroll=0; status=0;'); 
}
function OpenThenSetValue(Url,Width,Height,WindowObj,SetObj)
{
	var ReturnStr=showModalDialog(Url,WindowObj,'dialogWidth:'+Width+'pt;dialogHeight:'+Height+'pt;status:no;help:no;scroll:no;status:0;help:0;scroll:0;');
	if (ReturnStr!='') SetObj.value=ReturnStr;
	return ReturnStr;
}
function OpeneditorWindow(Url,WindowName,Width,Height)
{
	window.open(Url,WindowName,'toolbar=0,location=0,maximize=1,directories=0,status=1,menubar=0,scrollbars=0,resizable=1,top=50,left=50,width='+Width+',height='+Height);
}

function CheckEnglishStr(Obj,DescriptionStr)
{
	var TempStr=Obj.value,i=0,ErrorStr='',CharAscii;
	if (TempStr!='')
	{
		for (i=0;i<TempStr.length;i++)
		{
			CharAscii=TempStr.charCodeAt(i);
			if (CharAscii>=255||CharAscii<=31)
			{
				ErrorStr=ErrorStr+TempStr.charAt(i);
			}
			else
			{
				if (!CheckErrorStr(CharAscii))
				{
					ErrorStr=ErrorStr+TempStr.charAt(i);
				}
			}
		}
		if (ErrorStr!='')
		{
			alert("\n\n"+DescriptionStr+''+ErrorStr);
			Obj.focus();
			return false;
		}
		if (!(((TempStr.charCodeAt(0)>=48)&&(TempStr.charCodeAt(0)<=57))||((TempStr.charCodeAt(0)>=65)&&(TempStr.charCodeAt(0)<=90))||((TempStr.charCodeAt(0)>=97)&&(TempStr.charCodeAt(0)<=122))))
		{
			alert(DescriptionStr);
			Obj.focus();
			return false;
		}
	}
	return true;
}
function CheckErrorStr(CharAsciiCode)
{
	var TempArray=new Array(34,47,92,42,58,60,62,63,124);
	for (var i=0;i<TempArray.length;i++)
	{
		if (CharAsciiCode==TempArray[i]) return false;
	}
	return true;
}
//
function SelectObjItem(Obj,OpStr,ButtonSymbol,MainUrl)
{   if (OpStr!='')
    {window.parent.parent.frames['BottomFrame'].location.href='../help.jsp'}
	if(MainUrl!='')
	{window.parent.parent.frames['MainFrame'].location.href=MainUrl;
	}
	if (Obj!='')
	 {
	   for (var i=0;i<document.all.length;i++)
	   {
		if (document.all(i).className=='FolderSelectItem') document.all(i).className='FolderItem';
	    }
	   Obj.className='FolderSelectItem';
	}
}
//
function SelectObjItem1(Obj,OpStr,ButtonSymbol,MainUrl)
{   if (OpStr!='')
    {window.parent.parent.frames['BottomFrame'].location.href='help.jsp'}
	if(MainUrl!='')
	{window.parent.parent.frames['MainFrame'].location.href=MainUrl;
	}
	if (Obj!='')
	 {
	   for (var i=0;i<document.all.length;i++)
	   {
		if (document.all(i).className=='FolderSelectItem') document.all(i).className='FolderItem';
	    }
	   Obj.className='FolderSelectItem';
	}
}
function FolderClick(Obj,el)
{   	var i=0;
  for (var i=0;i<document.all.length;i++)
	   {
		if (document.all(i).className=='FolderSelected') document.all(i).className='';
	    }
	         Obj.className='FolderSelected';
	  
              for (i=0;i<DocElementArr.length;i++)
			{
				if (el==DocElementArr[i].Obj)
				{
					if (DocElementArr[i].Selected==false)
					{
						DocElementArr[i].Obj.className='FolderSelectItem';
						DocElementArr[i].Selected=true;
					}
					else
					{
						DocElementArr[i].Obj.className='FolderItem';
						DocElementArr[i].Selected=false;
					}
				}
			}
}
function InsertKeyWords(obj,KeyWords)
{
	if (KeyWords!='')
	{
		if (obj.value.search(KeyWords)==-1)
		{
			if (obj.value=='') obj.value=KeyWords;
			else obj.value=obj.value+'|'+KeyWords;
			
		}
	}
	if (KeyWords == 'Clean')
	{
		obj.value = '';
	}
	return;
}
function Getcolor(img_val,Url,input_val){
	var arr = showModalDialog(Url, "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
	if (arr != null){
		document.getElementById(input_val).value = arr;
		img_val.style.backgroundColor = arr;
		}
}
//
function SendFrameInfo(MainUrl,LeftUrl,ControlUrl)
{
	location.href=MainUrl;
    parent.frames['LeftFrame'].LeftInfoFrame.location.href=LeftUrl;
	 parent.frames['BottomFrame'].location.href=ControlUrl;
}