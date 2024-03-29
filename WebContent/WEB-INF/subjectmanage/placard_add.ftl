<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
  <title>添加/修改公告</title> 
  <link href="${SiteUrl}css/manage.css" rel="stylesheet" type="text/css" />
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
        if(frm.placard_title.value=="")
        {
            alert("请输入公告标题");
            return false;
        }

    if(GetMessageLength("content")=='0')
    {
        alert('请输入公告内容');       
        return false;
    }

        return true;   
    }
  </script>  
</head> 
<body> 
<h2>
<#if placard??>
修改公告
<#else>
添加公告
</#if>
</h2>
<form method='post' onsubmit='return checkData(this);'>
	<table class='listTable' cellspacing='1'> 
	<tr> 
		<td align="right" style='width:100px'><b>公告标题(<font color='red'>*</font>):</b></td> 
		<td>
		<#if placard??>
			<input type='text' name='placard_title' value='${placard.title?html}' size='120' maxLength="120" />
		<#else>
			<input type='text' name='placard_title' value='' size='120' maxLength="120" />
		</#if> 
		</td> 
	</tr>	
	<tr> 
		<td align="right" valign='top'><b>公告内容(<font color='red'>*</font>):</b></td> 
		<td>
		<#if placard??>
			<textarea name="content" style='display:none;'>${placard.content?html}</textarea>
		<#else>
			<textarea name="content" style='display:none;'></textarea>
		</#if>
			<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=content&Toolbar=Default"
			width="100%" height="600" frameborder="0" scrolling="no"></iframe> 
    </td> 
	</tr>
	<tr> 
		<td></td> 
		<td> 
			<input class="button" type="submit" value=" 保  存 " />
		</td> 
	</tr> 
</table> 
</form> 
 
<script> 
function browse_server() {
  url = '${SiteUrl}manage/userfm/index.jsp?Type=Image';
  var left = (window.screen.width - 720)/2;
  var top = (window.screen.height - 540)/2 - 40;
  var winStyle = 'width=720,height=540,location=no,menubar=no,resizable=yes,scrollbars=no,status=yes,toolbar=no';
  winStyle += ',left=' + left + ',top=' + top;
  window.open(url, 'imageBrowser', winStyle);
}
function SetUrl(encodeUrl, url) {
  var form = document.forms[0];  
  form.picUrl.value = url;
  document.getElementById('pictureImage').src = url;
}
</script> 
	
</body> 
</html> 