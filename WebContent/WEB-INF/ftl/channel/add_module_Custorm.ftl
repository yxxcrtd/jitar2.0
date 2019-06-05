<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title></title>
  <link href="${SiteUrl}css/manage.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form method="POST">
<#if module??>
<table class='listTable' cellspacing='1' id='listTable'>
<tr>
<th style="width:80px">模块名称：</th><td><input name="moduleDisplayName" value="${module.displayName!?html}" />（模块名称是唯一标识，不能与其它模块名称重复。若修改模块名称，请同时修改频道模板中使用的相应名称。）</td>
</tr>
<tr style="vertical-align:top">
<th>模块内容：</th><td><textarea name="moduleContent" style="display:none">${module.content!?html}</textarea>
<iframe src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=moduleContent&amp;Toolbar=Default" scrolling="no" width="100%" frameborder="0" height="480"></iframe>
</td>
</tr>
<tr>
<td>&nbsp;</td><td>
<input type="submit" value="保存模块" />
</td>
</tr>
</table>
<#else>
<table>
<tr>
<th>模块名称：</th><td><input name="moduleDisplayName" value="" />（模块名称是唯一标识，不能与其它模块名称重复。若修改模块名称，请同时修改频道模板中使用的相应名称。）
</td>
</tr>
<tr style="vertical-align:top">
<th>模块内容：</th><td><textarea name="moduleContent" style="display:none"></textarea>
<iframe src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=moduleContent&amp;Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="480"></iframe>
</td>
</tr>
<tr>
<td>&nbsp;</td><td>
<input type="submit" value="添加模块" />
</td>
</tr>
</table>
</#if>
</form>
</body>
</html>