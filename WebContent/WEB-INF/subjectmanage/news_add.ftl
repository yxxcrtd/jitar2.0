<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
  <title>图片新闻、学科动态</title> 
  <link href="${SiteUrl}css/manage.css" rel="stylesheet" type="text/css" />
</head> 
<body> 
<h2>
<#if siteNews??>
修改图片新闻、学科动态
<#else>
添加图片新闻、学科动态
</#if>
</h2>
<form method='post'>
	<table class='listTable' cellspacing='1'> 
	<tr>
		<td align="right" style='width:68px'><b>标题:</b></td> 
		<td>		
			<input type='text' name='news_title' value='<#if siteNews??>${siteNews.title}</#if>' size='120' maxLength="120" /> 
			<font color='red'>*</font> 必须填写图片新闻、学科动态标题.
		</td> 
	</tr>	
	<tr> 
		<td align="right" valign='top'><b>内容:</b></td> 
		<td> 
			<textarea name="content" style='display:none'><#if siteNews??>${siteNews.content?html}</#if></textarea> 
			<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=content&Toolbar=Default"
			width="100%" height="400" frameborder="0" scrolling="no"></iframe> 
    </td> 
	</tr> 
  <tr> 
    <td align='right'><b>图片链接:</b></td> 
    <td> 
      <input type='text' name='picUrl' size='60' value='<#if siteNews??>${siteNews.picture?html}</#if>' />
      <input type='button' value='浏览服务器' onclick='browse_server()' /> 有图片则发布为图片新闻。&nbsp;&nbsp;<span style="color: rgb(255, 0, 0);">图片格式必须是jpg，且文件名不能含中文字符</span>
    </td> 
  <tr> 
    <td></td> 
    <td> 
     <div><img width='132' id='pictureImage' src=""><div> 
   </td> 
  </tr> 
	<tr> 
		<td></td> 
		<td> 
			<input class="button" type="submit" value=" 保  存 " onclick="return validateImage(this.form)" />
		</td> 
	</tr> 
</table> 
</form> 
<script>
function validateImage(fm){
if(fm.news_title.value==""){
 alert("标题必须填写。");
 fm.news_title.focus();
 return false;
}

var img = fm.picUrl.value;
if(img != ""){
 img = img.toLowerCase();
 if(img.indexOf(".") == -1){
  alert("请选择一个有效的jpg文件");
  return false;
 }
 if(img.substr(img.lastIndexOf(".")) != ".jpg"){
  alert("图片文件必须是jpg格式");
  return false;
 }
 if(/[^\x00-\xff]/g.test(img)){
  alert("图片文件不能含有中文");
  return false;
 } 
}
return true;
}
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