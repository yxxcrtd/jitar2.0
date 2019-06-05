<form method='post'>
<table style='width:100%'>
<tr>
<td style='width:68px;font-weight:bold;'>讨论标题<span style='color:#f00'>*</span>:</td><td><input name='ttitle' style='width:100%;' /></td>
</tr>
<tr>
<td style='font-weight:bold;'>讨论内容<span style='color:#f00'>*</span>:</td><td>
  <input name='tcontent' id='tcontent' style='display:none' />
  <iframe id="tcontent__Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=tcontent&Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="300"></iframe>
</td>
</tr>
<tr>
<td></td><td>
<#if loginUser??>
	<input type='submit' value=' 提  交 ' />
<#else>
	请<a href='${SiteUrl}login.jsp' style='font-weight:bold;'>登录</a>后参与讨论。
</#if>
</td>
</tr>
</table>
</form>