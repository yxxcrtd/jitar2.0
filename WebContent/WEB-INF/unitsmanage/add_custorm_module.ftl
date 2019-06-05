<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title></title>
  <link href="${SiteUrl}css/manage.css" rel="stylesheet" type="text/css" />  
</head>
<body>
<h2>
添加自定义模块
</h2>
<form method='post' style='padding-left:20px'>
<table class='listTable' cellspacing='1'>
<tr>
<td style='width:100px'>模块名称：</td><td>
<input name='moduleName' style='width:99%' value='${unitWebpart.moduleName!}' />
</td>
</tr>
<tr>
<td>模块区域：</td><td>
<select name='webpartZone'>
<option value='1'<#if unitWebpart.webpartZone?? && unitWebpart.webpartZone == 1> selected='selected'</#if>>顶部</option>
<option value='2'<#if unitWebpart.webpartZone?? && unitWebpart.webpartZone == 2> selected='selected'</#if>>下部</option>
<option value='3'<#if unitWebpart.webpartZone?? && unitWebpart.webpartZone == 3> selected='selected'</#if>>左</option>
<option value='4'<#if unitWebpart.webpartZone?? && unitWebpart.webpartZone == 4> selected='selected'</#if>>中</option>
<option value='5'<#if unitWebpart.webpartZone?? && unitWebpart.webpartZone == 5> selected='selected'</#if>>右</option>
</select>
</td>
</tr>
<tr>
<td>模块内容：</td><td>
<input name='content' style='width:99%;display:none' value='${unitWebpart.content!?html}' />
<iframe src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=content&amp;Toolbar=Default" scrolling="no" width="100%" frameborder="0" height="500"></iframe>
</td>
</tr>
</table>
<div style='padding:6px'>
<input class='button' type='submit' value=' 保  存 ' />
</div>
</form>
</body>
</html>
