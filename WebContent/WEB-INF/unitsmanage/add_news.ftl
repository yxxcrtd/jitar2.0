<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title></title>
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
        if(frm.news_title.value=="")
        {
            alert("请输入标题");
            return false;
        }
        if(frm.news_type.selectedIndex >= 0){
            if(frm.news_type.options[frm.news_type.selectedIndex].value == "0"){  //图片新闻
                if(frm.news_picture.value == ""){
                    alert("请上传图片");
                    return false;
                }else{
                    if(frm.news_picture.value.toLowerCase().slice(-4) != ".jpg"  
                      && frm.news_picture.value.toLowerCase().slice(-4) != ".gif"
                      && frm.news_picture.value.toLowerCase().slice(-4) != ".bmp"
                      && frm.news_picture.value.toLowerCase().slice(-4) != ".png")
                      {
                            alert("请上传图片(.jpg,.gif,.bmp,.png)");
                            return false;
                      }
                }
            }
        } 
    if(GetMessageLength("news_content")=='0')
    {
        alert('请输入内容');       
        return false;
    }

        return true;   
    }
  </script>  
  <script type='text/javascript'>
  function add(news_type)
  {
  	window.location.href='add_news.py?type=' + news_type + '&unitId=${unit.unitId}'
  }
  function openUpload()
  {
    var url = "${SiteUrl}manage/userfm/index.jsp?Type=Image"
    window.open(url,'_blank','width=800,height=600,resizable=1,scrollbars=1')
  }
  
  function SetUrl( url, width, height )
  {
    if(url)
    {
        document.forms[0].news_picture.value = url;
    }
  }
  
  function showHide(oSel)
  {
  	if(oSel.options[oSel.selectedIndex].value=="0")
  	{
  		document.getElementById("logo_url").style.display="";
  	}
  	else
  	{
  		document.getElementById("logo_url").style.display="none";
  	}
  }
  
  </script>
</head>
<body>
<h2>
<#if unitNews?? >
编辑图片新闻、机构公告、最新动态
<#else>
发布图片新闻、机构公告、最新动态
</#if>
</h2>
<form method='post' style='padding-left:20px'  onsubmit='return checkData(this);'>
<#if unitNews?? >
<table class='listTable' cellspacing='1'>
<tr>
<td style='width:100px'>标题(<font color='red'>*</font>)：</td><td><input name='news_title' style='width:99%' value='${unitNews.title?html}' /></td>
</tr>
<tr>
<td>类别(<font color='red'>*</font>)：</td><td><select name='news_type' onchange='showHide(this)'>
					<option value='2'<#if unitNews.itemType == 2 > selected='selected'</#if>>最新动态</option>
					<option value='1'<#if unitNews.itemType == 1 > selected='selected'</#if>>机构公告</option>
					<option value='0'<#if unitNews.itemType == 0 > selected='selected'</#if>>图片新闻</option>
					</select></td>
</tr>
<tr id='logo_url' <#if unitNews.itemType != 0 > style='display:none'</#if>>
<td>图片地址：<br/>(图片新闻需要)</td><td><input name='news_picture'  style='width:99%' value='${unitNews.picture!}' />
<br />
<input type='button' value='上传图片…' onclick='openUpload()' />
</td>
</tr>
<tr>
<td>内容(<font color='red'>*</font>)：</td><td><input name='news_content' style='display:none' value='${unitNews.content!}' />
<iframe src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=news_content&Toolbar=Default"
        width="100%" height="500" frameborder="0" scrolling="no"></iframe>
</td>
</tr>
</table>
<#else>
<table class='listTable' cellspacing='1'>
<tr>
<td style='width:100px'>标题(<font color='red'>*</font>)：</td><td><input name='news_title' style='width:99%' value='' /></td>
</tr>
<tr>
<td>类别(<font color='red'>*</font>)：</td><td><select name='news_type' onchange='showHide(this)'>
					<option value='2'>最新动态</option>
					<option value='1'>机构公告</option>
					<option value='0'>图片新闻</option>
					</select></td>
</tr>
<tr id='logo_url' style='display:none'>
<td>图片地址(<font color='red'>*</font>)：<br/>(图片新闻需要)</td><td><input name='news_picture'  style='width:99%' value='' />
<br />
<input type='button' value='上传图片…' onclick='openUpload()' />
</td>
</tr>
<tr>
<td>内容(<font color='red'>*</font>)：</td><td><input name='news_content' style='display:none'  />
<iframe src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=news_content&Toolbar=Default"
        width="100%" height="500" frameborder="0" scrolling="no"></iframe>
</td>
</tr>
</table>
</#if>

<div style='padding:6px'>

<input class='button' type='submit' value=' 保  存 ' />

</div>
</form>
</body>
</html>
