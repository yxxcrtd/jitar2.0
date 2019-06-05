<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>管理</title>
  <link rel="stylesheet" href="../css/manage.css" type="text/css" />
</head>
<body>
<h2>${(contentSpaceArticle.contentSpaceArticleId == 0)?string('添加','修改')}文章</h2>
<form method='post' id='oForm'>
<table class='listTable' cellspacing='1'>
	<tr>
		<td align="right" style='width:60px'><b>文章标题:</b></td>
		<td>
			<input type='text' name='title' value='${contentSpaceArticle.title!?html}' size='80' maxLength="120" />
			<font color='red'>*</font>
		</td>
	</tr>
	<tr>
		<td align="right" valign='top'><b>文章内容:</b></td>
		<td> 
			<textarea name="content" style='display:none'>${contentSpaceArticle.content!?html}</textarea>
			<iframe id="DHtml_Frame" 
		      src="fckeditor/editor/fckeditor.jsp?InstanceName=content&Toolbar=Default" 
		      width="100%" height="400" frameborder="0" scrolling="no"></iframe>
    </td>
	</tr>
  <tr>
    <td align='right'><b>图片链接:</b></td>
    <td>
      <input type='text' name='pictureUrl' size='60' value='${contentSpaceArticle.pictureUrl!?html}' />
      <input type='button' value='浏览服务器' onclick='browse_server()' />&nbsp;&nbsp;<span style="color: rgb(255, 0, 0);">图片格式必须是jpg，且文件名不能含中文字符</span>
    </td>
  <tr>
    <td></td>
    <td>
     <div><img width='132' id='pictureImage' src="${contentSpaceArticle.pictureUrl!}"><div>
   </td>
  </tr>
<tr>
	<td></td>
	<td>
		<input class="button" type="submit" value="${(contentSpaceArticle.contentSpaceArticleId == 0)?string(' 添  加 ',' 修  改 ')} " />
		<input class="button" type="button" value=" 返  回 " onclick="window.history.back()" />
	</td>
</tr>
</table>
</form>

<script>
function browse_server() {
  url = './userfm/index.jsp?Type=Image';
  var left = (window.screen.width - 920)/2;
  var top = (window.screen.height - 540)/2 - 40;
  var winStyle = 'width=720,height=540,location=no,menubar=no,resizable=yes,scrollbars=no,status=yes,toolbar=no';
  winStyle += ',left=' + left + ',top=' + top;
  window.open(url, 'imageBrowser', winStyle);
}
function SetUrl(encodeUrl, url) {
  var f = document.getElementById('oForm');  
  f.pictureUrl.value = url;
  document.getElementById('pictureImage').src = url;
}
</script>
</body>
</html>
