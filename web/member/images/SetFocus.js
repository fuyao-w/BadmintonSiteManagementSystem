 /*
 作用:使MainFrame始终获得焦点
 */
 document.onkeydown=keyDown;
 function keyDown()
 { // alert(typeof(parent.frames['MainFrame'])); 
  if ((event.ctrlKey)||(event.altKey)||(event.keyCode==46))   
   {
     if (typeof(parent.frames['MainFrame'])=='object')
     { 
      parent.frames['MainFrame'].focus();
	  }
    else
     top.frames['MainFrame'].focus();	
  }
 }

//鼠标右键绝对禁止法
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
