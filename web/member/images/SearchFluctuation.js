//Search For Kesion CMS
//Version 3.0
//Powered By Kesion.Com
var normal='slategray';   //color;
var zindex=10000;         //z-index;
var openTF=false;
var width=165,height=window.document.body.offsetHeight-5;
var left=0,top=0,title='搜索小助理';
var SearchBodyStr=''
                   +'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
				   +'<form name="searchform" target="MainFrame" method="post">'
                   +'<tr> '
                   +'<td height="25"><strong>按下面任意或全部条件进行搜索</strong></td>'
                   +' </tr>'
                   +'<tr><td height="25">全部或部分关键字</td></tr>'
                   +'<tr><td height="25"><input style="width:95%" type="text" name="KeyWord"></td></tr>'
                   +'  <tr><td height="25">搜索范围</td></tr>'
                   +'  <tr><td height="25"> <select style="width:95%" name="SearchArea" onchange="SetSearchTypeOption(this.value)">'
                   +'     </select></td></tr>' 
				   +'<tr><td height="25">搜索类型</td></tr>'
                   +'<tr><td height="25"><select style="width:95%" name="SearchType">'
                   +'</select></td></tr>'
				   +'  <tr id="DateArea" onclick="setstatus(this)" style="cursor:hand"><td height="25"><strong>什么时候修改的?</strong></td></tr>'
				   +'  <tr style="display:none"><td height="25">开始日期<input type="text" readonly style="width:80%" name="StartDate" id="StartDate">'
                   +'  <span style="cursor:hand" onClick=OpenThenSetValue("Include/DateDialog.asp",160,170,window,document.all.StartDate);document.all.StartDate.focus();><img src="Images/date.gif" width="20" height="20" border="0" align="absmiddle" title="选择日期"></span></td></tr>'
				   +'  <tr style="display:none"><td height="25">结束日期<input type="text" readonly style="width:80%" name="EndDate" id="EndDate">'
                   +'  <span style="cursor:hand" onClick=OpenThenSetValue("Include/DateDialog.asp",160,170,window,document.all.EndDate);document.all.EndDate.focus();><img src="Images/date.gif" width="20" height="20" border="0" align="absmiddle" title="选择日期"></span></td></tr>'
                   +'  <tr><td height="40" align="center"><input type="submit" name="SearchButton" value="开始搜索" onclick="return(SearchFormSubmit())"></td></tr>'
				   +'</form>'
				   +'  <tr><td><strong>使用说明:</strong></td></tr>'
				   +'  <tr><td> ① 您可以利用本搜索助理来搜索文章、图片、下载Flash、专题、标签、JS等,但不能搜索（目录）诸如频道名称、栏目名称，标签目录等</td></tr>'
				   +'  <tr><td> ② 按 <font color=red>Ctrl+F</font> 可以快速进行打开或关闭搜索小助理</td></tr>'
                   +'</table>'
        var str=""
               +"<div id='SearchBox' "
               + "style='display:none;"
               + "z-index:" + zindex + ";"
               + "width:" + width + ";"
               + "height:" + height + ";"
               + "left:" + left + ";"
               + "top:" + top + ";"
               + "background-color:" + normal + ";"
               + "color:black;"
               + "font-size:12px;"
               + "font-family:Verdana, Arial, Helvetica, sans-serif;"
               + "position:absolute;"
               + "cursor:default;"
               + "border:3px solid " + normal + ";"
               + "'"
               + ">"
                       + "<div "
                       + "style='"
                       + "background-color:" + normal + ";"
                       + "width:" + (width) + ";"
                       + "height:23;"
                       + "color:white;"
                       + "' "
					   + ">"
                               + "<span style='width:" + (width-2*12-4) + ";padding-left:3px;'>" + title + "</span>"
                               + "<span id='Close' style='width:20;border-width:0px;color:white;font-family:webdings;' onclick='CloseSearchBox(this)'>r</span>"
                       + "</div>"
                               + "<div style='"
                               + "width:158;overflow:auto;"
                               + "height:" + (height-20-4) + ";"
                               + "background-color:white;"
                               + "line-height:14px;"
                               + "word-break:break-all;"
                               + "padding:3px;"
                               + "'>" + SearchBodyStr + "</div>"
               + "</div>"
               + "<div style='display:none;"
               + "width:" + width + ";"
               + "height:" + height + ";"
               + "top:" + top + ";"
               + "left:" + left + ";"
               + "z-index:" + (zindex-1) + ";"
               + "position:absolute;"
               + "background-color:black;"
               + "filter:alpha(opacity=40);"
               + "'></div>";
//关闭;
function CloseSearchBox(el)
{   if (el.id=='Close')
	  { var twin = el.parentNode.parentNode;
        var shad = twin.nextSibling;
	   	   	twin.style.display = "none";
            shad.style.display = "none";
			openTF=false;
			SearchBodyStr=null;
			str=null;
       }
}
function initial()
{
if (!openTF)
 {
 document.body.insertAdjacentHTML("beforeEnd",str);
 openTF=true;
 }
}
//初始化;
function initializeSearch(SearchArea)
{
 initial();
 initialSearchAreaOption(SearchArea);
if (document.all.SearchBox.style.display=='none')
 {
  document.all.SearchBox.style.display='';
  if (document.forms[0].disabled==false) document.forms[0].focus();
 }
 else
 document.all.SearchBox.style.display='none';
}
function initialSearchAreaOption(SearchArea)
{	 var EF=false;
     var TextArr=new Array('文章中心','图片中心','下载中心','动漫中心','商城中心','影视中心','供求信息','专题中心','友情链接站点','系统函数标签','自定义函数标签','自定义静态标签','系统 JS','自由 JS','管理员')
     var valueArr=new Array('Article','Picture','DownLoad','Flash','Shop','Movie','Supply','Special','Link','SysLabel','DIYFunctionLabel','FreeLabel','SysJS','FreeJS','Manager')
	  for(var i=0;i<valueArr.length;++i)
	   if (SearchArea==valueArr[i]) 
	    { 
		  EF=true;
		  break;
		 }
	  if (!EF) return false; 
	  document.all.KeyWord.value='';
	  document.all.SearchArea.length=0;
      for (var i=0;i<TextArr.length;++i)
    	{
		    document.all.SearchArea.options[document.all.SearchArea.length] = new Option(TextArr[i],valueArr[i]);
		    if (SearchArea==valueArr[i])
	        document.all.SearchArea.options(i).selected=true;
		} 
	//进行权限检查,对没有权限的搜索模块,进行屏蔽	
	 var n=0;
	for (var i=0;i<TextArr.length;++i)
	   {   var removeTF=false;
	       if (valueArr[i]!=SearchArea)
	   	  { if (valueArr[i]=='Article' && SearchArticlePower=='False')
			   removeTF=true;
			if (valueArr[i]=='Picture' && SearchPicturePower=='False')
			   removeTF=true;  
			if (valueArr[i]=='DownLoad' && SearchDownLoadPower=='False')
			   removeTF=true; 
			if (valueArr[i]=='Flash' && SearchFlashPower=='False')
			   removeTF=true; 
			if (valueArr[i]=='Shop' && SearchShopPower=='False')
			   removeTF=true; 
			if (valueArr[i]=='Movie' && SearchMoviePower=='False')
			   removeTF=true; 
			if (valueArr[i]=='Supply' && SearchSupplyPower=='False')
			   removeTF=true; 
	   	    if (valueArr[i]=='Special' && SearchSpecialPower=='False')  
			   removeTF=true;
	   	    if (valueArr[i]=='Link' && SearchLinkPower=='False')  
			   removeTF=true;
			if (valueArr[i]=='SysLabel' && SearchSysLabelPower=='False')
			   removeTF=true;
			if (valueArr[i]=='DIYFunctionLabel' && SearchDIYFunctionLabelPower=='False')
			   removeTF=true;
			if (valueArr[i]=='FreeLabel' && SearchFreeLabelPower=='False')
			   removeTF=true;
			if (valueArr[i]=='SysJS' && SearchSysJSPower=='False')
			   removeTF=true;
			if (valueArr[i]=='FreeJS' && SearchFreeJSPower=='False')
			   removeTF=true;
			if (valueArr[i]=='Manager' && SearchAdminPower=='False')
			   removeTF=true;
		   }
		  if (removeTF==true)  
		    {document.all.SearchArea.options.remove(i-n);
			 n++;
			}	
	   }
	SetSearchTypeOption(SearchArea); 
}
function SetSearchTypeOption(AreaType)
{	 //Remove all Option
    var TextArr=new Array();
    document.all.SearchType.options.length=0
  switch (AreaType)
  {
    case 'Article':
	     if (SearchArticlePower=='False')          //搜索文章权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('文章(副)标题','文章内容','文章关键字','文章作者','文章录入')
	      }
		  break;
    case 'Special':
	     if (SearchSpecialPower=='False')        //搜索专题权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('专题名称','简要说明')
	     }
		 break;
    case 'Picture':
	     if (SearchPicturePower=='False')          //搜索图片权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('图片名称','图片简介','图片关键字','图片作者','图片录入')
	      }
		  break;
    case 'DownLoad':
	     if (SearchDownLoadPower=='False')          //搜索下载权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('下载名称','下载简介','下载关键字','下载作者/开发商','下载录入')
	      }
		  break; 
	case 'Flash':
	     if (SearchFlashPower=='False')          //搜索Flash权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('动漫名称','动漫简介','动漫关键字','动漫作者','动漫录入')
	      }
		  break; 
	case 'Shop':
	     if (SearchShopPower=='False')          //搜索商品权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('商品名称','商品介绍','商品关键字','厂商','价格')
	      }
		  break; 
    case 'Movie':
	     if (SearchMoviePower=='False')          //搜索影片权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('影片名称','影片介绍','影片关键字','主要演员','添加者')
	      }
		  break;
	case 'Supply':
	     if (SearchSupplyPower=='False')          //搜索影片权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('信息主题','信息介绍','添加者')
	      }
		  break;
	case 'Special':
	     if (SearchSpecialPower=='False')       //搜索专题权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('专题名称','简要说明')
	     }
		 break;
	case 'Link':
	     if (SearchLinkPower=='False')       //搜索友情链接站点权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	      document.all.DateArea.style.display="";
	      TextArr=new Array('站点名称','站点描述')
	     }
		 break;
	case 'SysLabel':
	     if (SearchSysLabelPower=='False')       //搜索系统标签权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	     document.all.DateArea.style.display="";
	     TextArr=new Array('系统标签名称','系统标签描述')
		 }
	     break;
	case 'DIYFunctionLabel':
	     if (SearchDIYFunctionLabelPower=='False')       //搜索自定义函数标签权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	     document.all.DateArea.style.display="";
	     TextArr=new Array('自定义函数标签名称','自定义函数标签描述')
		 }
	     break;
	case 'FreeLabel':
	     if (SearchFreeLabelPower=='False')       //搜索自定义静态标签权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
	     document.all.DateArea.style.display="";
		 TextArr=new Array('自定义静态标签名称','自定义静态标签描述','自定义静态标签内容')
		 }
	     break;
	case 'SysJS':
	     if (SearchSysJSPower=='False')       //搜索系统JS权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
	     document.all.DateArea.style.display="";
		 TextArr=new Array('系统JS 名称','系统JS 描述','系统JS 文件名')
		 }
		 break;
    case 'FreeJS' :
		 if (SearchFreeJSPower=='False')       //搜索自由JS权限检查
		 {
		   DisabledSearchFluctuation(true);
		   return;
		 }
		 else
		 {
	     document.all.DateArea.style.display="";
		 TextArr=new Array('自由JS 名称','自由JS 描述','自由JS 文件名')
		 }
		 break;
	case 'Manager':	 
		  if (SearchAdminPower=='False')          //搜索管理员权限检查
		 {
		  DisabledSearchFluctuation(true);
		  return;
		 }
		 else
		 {
		  DisabledSearchFluctuation(false);
	     document.all.DateArea.style.display="none";
		 TextArr=new Array('管理员名称','管理员简介')
		}
	    break;
  }
  for (var i=0;i<TextArr.length;++i)
	document.all.SearchType.options[document.all.SearchType.length] = new Option(TextArr[i], i);
}
function setstatus(Obj)
  {var today=new Date()
    if (Obj.nextSibling.style.display=='none')
     {
	  Obj.nextSibling.style.display='';
	  document.all.StartDate.value=today.getYear()+'-'+eval(today.getMonth()+1)+'-'+today.getDate();
	 }
	else 
	{
     Obj.nextSibling.style.display='none';
	 document.all.StartDate.value='';
	 }
	if (Obj.nextSibling.nextSibling.style.display=='none')
	{
     Obj.nextSibling.nextSibling.style.display='';
	  document.all.EndDate.value=today.getYear()+'-'+eval(today.getMonth()+1)+'-'+today.getDate();
	}
	else 
     {
	 Obj.nextSibling.nextSibling.style.display='none';
	 document.all.EndDate.value='';
	 }
  }
 function SearchFormSubmit()
  { var form=document.forms[0];
    if (form.elements[0].value=='')
	 {
	   alert('请输入关键字!')
	   form.elements[0].focus();
	   return false;
	 }
   switch (form.elements[1].value)
    {
	  case 'Article':
	       form.action="Admin_Article.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=文章管理 >> <font color=red>搜索文章结果</font>&ButtonSymbol=ArticleSearch';
		   break;
	  case 'Picture':
	       form.action="Admin_Picture.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=图片管理 >> <font color=red>搜索图片结果</font>&ButtonSymbol=PictureSearch';
		   break;
	  case 'DownLoad':
	       form.action="Admin_Down.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=下载管理 >> <font color=red>搜索下载结果</font>&ButtonSymbol=DownSearch';
		   break;	
	 case 'Flash':
	       form.action="Admin_Flash.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=动漫管理 >> <font color=red>搜索Flash结果</font>&ButtonSymbol=FlashSearch';
		   break;
	 case 'Shop':
	       form.action="Admin_Shop.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=商城管理 >> <font color=red>搜索商品结果</font>&ButtonSymbol=ProductSearch';
		   break;
	  case 'Movie':
	       form.action="Admin_Movie.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=影视管理 >> <font color=red>搜索影片结果</font>&ButtonSymbol=MovieSearch';
		   break;	
	  case 'Supply':
	       form.action="Admin_GQ.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=供求管理 >> <font color=red>搜索信息结果</font>&ButtonSymbol=Disabled';
		   break;
	  case 'Special':
	       form.action="Admin_Special.asp?ChannelID="+ChannelID;
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=专题管理 >> <font color=red>搜索专题结果</font>&ButtonSymbol=SpecialSearch';
		   break;
	  case 'Link':
	       form.action="Admin_FriendLink.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=常规管理 >> 友情链接管理 >> <font color=red>搜索友情链接站点结果</font>&ButtonSymbol=LinkSearch';
		   break;
	  case 'SysLabel'  :
	       form.action="Include/Label_Main.asp?LabelType=0";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=标签管理 >> <font color=red>搜索系统函数标签结果</font>&ButtonSymbol=SysLabelSearch';
		   break;
	 case 'DIYFunctionLabel'  :
	       form.action="Include/Label_Main.asp?LabelType=5";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=标签管理 >> <font color=red>搜索自定义函数标签结果</font>&ButtonSymbol=DIYFunctionSearch';
		   break;
	  case 'FreeLabel'  :
	       form.action="Include/Label_Main.asp?LabelType=1";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=标签管理 >> <font color=red>搜索自由标签结果</font>&ButtonSymbol=FreeLabelSearch';
		   break;
	  case 'SysJS'     :
	  	   form.action="Include/JS_Main.asp?JSType=0";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=JS管理 >> <font color=red>搜索系统JS结果</font>&ButtonSymbol=SysJSSearch';
		   break;
	  case 'FreeJS'     :
	  	   form.action="Include/JS_Main.asp?JSType=1";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=JS管理 >> <font color=red>搜索自由JS结果</font>&ButtonSymbol=FreeJSSearch';
		   break;
	  case 'Manager'     :
	  	   form.action="Admin_Admin.asp";
		   parent.frames['BottomFrame'].location.href='Split.asp?OpStr=管理员管理 >> <font color=red>搜索管理员结果</font>&ButtonSymbol=ManagerSearch';
		   break;
	}
	form.submit();
  }
function DisabledSearchFluctuation(Flag)
{ if (Flag==true)
   document.all.KeyWord.value='对不起,权限不足!'; 
  var AllBtnArray=document.body.getElementsByTagName('INPUT'),CurrObj=null;
	for (var i=0;i<AllBtnArray.length;i++)
	{
		CurrObj=AllBtnArray[i];
		CurrObj.disabled=Flag;
	}
	AllBtnArray=document.body.getElementsByTagName('SELECT'),CurrObj=null;
		for (var i=0;i<AllBtnArray.length;i++)
	{
		CurrObj=AllBtnArray[i];
		CurrObj.disabled=Flag;
	}
}