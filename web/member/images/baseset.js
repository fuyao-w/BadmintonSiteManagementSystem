var tt='start';
var ii='start';
function turnit(ss,bb) {

  if (ss.style.display=="none") {
    if(tt!='start') tt.style.display="none";
    if(ii!='start') ii.src="";
    ss.style.display="";
    tt=ss;
    ii=bb;
    bb.src="";
  } else {
    ss.style.display="none"; 
    bb.src="";
  }
}


function YinCangDiv(obj){	
	document.all(obj).style.display = "none";		
}

function setroomsettingvalue(){ 
    var objlist = document.all("vallist");
    var i=0;
	var str = "";
    var pobj = document.getElementById("baseset");
             if(objlist)
             {
                 if(objlist.length)
                 {
                     for(i=0; i <= objlist.length-1; i++)
                     {
                         var v1 = objlist[i].value;
				if (objlist[i].checked)  
				{
					if ( "" == str)
					{
						str += objlist[i].value; 
					}
					else
					{
						str += "¡¢" + objlist[i].value; 
					}
				}
                     }
                 }
                 else
                 {
                     var v1 = objlist.value;
			if (objlist.checked)
			{
				if ( "" == str)
				{
					str += objlist.value; 
				}
				else
				{
					str += "¡¢" + objlist.value; 
				}
			}
                 }
             }
             pobj.value = str;
             document.getElementById("resetdiv").style.display = "none";
}


function ShowNopassDiv(obj,objdiv)
{
    var ttop  = obj.offsetTop; 
	var tleft = obj.offsetLeft;
	var theight =obj.offsetHeight;
	var elem = obj;
	while (obj = obj.offsetParent)
	{
		ttop+=obj.offsetTop; 
		tleft+=obj.offsetLeft;
	}
	var parm = document.getElementById(objdiv);	
	parm.style.visibility = "visible";
	parm.style.display = "";
	parm.style.top = ttop+theight;
	parm.style.left = tleft;
	return false;
}