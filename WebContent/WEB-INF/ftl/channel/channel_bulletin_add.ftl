<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <title>分类维护</title>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/manage.css" />
</head>
<body>
<form method='post' action="channel.action">
<input type="hidden" name="cmd" value="addbulletin"/>
<input type="hidden" name="channelId" value="${channel.channelId}"/>
<input type="hidden" name="placardId" value="${placard.id}"/>
<table class='listTable' cellspacing='1'>
	<tr>
		<td align="right" style="width:60px"><b>公告标题:</b></td>
		<td>
			<input type='text' name='title' value='<#if placard??>${placard.title?html}</#if>' size='80' />
		</td>
	</tr>
	<tr>
		<td align="right" valign='top'><b>公告内容:</b></td>
		<td colspan="2"> 
			<textarea name="placardContent" style='display:none'><#if placard??>${placard.content?html}</#if></textarea>
			 <iframe id="DHtml_Frame" 
		      src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=placardContent&Toolbar=Default" 
		      width="100%" 
		      height="400" 
		      frameborder="0" 
		      scrolling="no"></iframe>
  		</td>
	</tr>
	<tr>
		<td></td>
		<td>
		    <#if channel.channelId == 0>
			<input class="button" type="submit" value=" 添  加  " />
			<#else>
			<input class="button" type="submit" value=" 修  改 " />
			</#if>
			<input class="button" type="button" value=" 返  回 " onclick="window.history.back()" />
		</td>
	</tr>
  </table>
</form>    
</body>
</html>