<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>添加修改群组公告</title>
  <link rel="stylesheet" href="../css/manage.css" type="text/css" />
  <script type="text/javascript" src="js/common.js"></script>
  <script type="text/javascript" src="js/user.js"></script>
  <script type="text/javascript">
//取fck内容的长度
function GetMessageLength(str)
{
    var oEditor = FCKeditorAPI.GetInstance(str) ;
    var oDOM = oEditor.EditorDocument ;
    var iLength ;
    var svalue="";
    if ( document.all )        // If Internet Explorer.
    {
        svalue = oDOM.body.innerText;
        svalue = svalue.replace(/[\s]+/gi,"");
        iLength = svalue.length ;
    }
    else                    // If Gecko.
    {
        var r = oDOM.createRange() ;
        r.selectNodeContents( oDOM.body ) ;
        svalue = r.toString();
        svalue = svalue.replace(/[\s]+/gi,"");
        iLength = svalue.length ;
    }
//    oEditor.InsertHtml('')
return iLength
}  
//取fck内容
function GetMessageContent(str)
{
     var oEditor = FCKeditorAPI.GetInstance(str) ;
     return oEditor.GetXHTML();
}  
  
     function checkData(frm)
    {
        if(frm.title.value=="")
        {
            alert("请输入公告标题");
            return false;
        }
        if(GetMessageLength("placardContent")=='0')
        {
            alert('请输入公告内容');       
            return false;
        }        
        return true;   
    }
</script>    
  </head>
  
<body>
<h2>${(placard.id == 0)?string('添加','修改')}公告</h2>
<div class='funcButton'>
  您现在的位置：<a href='${SiteUrl}manage/' target='_top'>个人控制面板</a>
  &gt;&gt; <a href='userPlacard.action?cmd=list'>个人公告管理</a>
  &gt;&gt; ${(placard.id == 0)?string('添加','修改')}公告
</div>
	
<form name='placardForm' action='userPlacard.py' method='post' onsubmit='return checkData(this);'>
	<#if __referer??>
		<input type='hidden' name='__referer' value='${__referer}' />
 	</#if>
	<table class='listTable' cellspacing='1'>
		<tr>
			<td align="right" width='20%'>
			  <b>公告标题(<font color='red'>*</font>):</b>
			</td>
			<td>
				<input type='text' name="title" value='${placard.title!?html}' size='80' />
			</td>
		</tr>
		<tr>
			<td align="right" valign='top' width='20%'>
			  <b>公告内容(<font color='red'>*</font>):</b>
			</td>
			<td colspan="2"> 
				<textarea id="placardContent" name="placardContent" style='display:none'>${placard.content!?html}</textarea>
				 <iframe id="DHtml_Frame" 
		      src="fckeditor/editor/fckeditor.jsp?InstanceName=placardContent&Toolbar=Basic" 
		      width="100%" 
		      height="200" 
		      frameborder="0" 
		      scrolling="no">
            </iframe>
      		</td>
		</tr>
		
		<tr>
			<td></td>
			<td>
				<input class="button" type='hidden' name='cmd' value='save_placard' />
				<input class="button" type='hidden' name='placardId' value='${placard.id}' />
				<input class="button" type="submit" value="${(placard.id == 0)?string(' 添 加 ',' 修 改 ')} " />
				<input class="button" type="button" value=" 返 回 " onclick="window.history.back()" />
			</td>
		</tr>
	  </table>
	</form> 
</body>
</html>
