<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>添加修改群组公告</title>
  <link rel="stylesheet" href="../css/manage.css" type="text/css" />
  <script type='text/javascript' src='${SiteUrl}js/jquery.js'></script>
<style>
  .commentReply {
    border: 1px solid gray;
    background-color: #ececec;
    margin:6px 20px 6px 6px;
    padding: 2px;
}
</style>
</head>
<body style="margin-top: 20px;">
	<h2>${(placard.id == 0)?string('添加','修改')}公告</h2>
	
	<form action='admin_placard.action' method='post'>
		<#if __referer??>
			<input type='hidden' name='__referer' value='${__referer}' />
 		</#if>
		<table class='listTable' cellspacing='1'>
		<tr>
			<td align="right" width="100"><b>公告标题:</b></td>
			<td>
				<input id = 'plcard_title' type='text' name='title' value='${placard.title!?html}' size='40' /> <span style="color:red">*</span>
			</td> 
		</tr>
		<tr>
			<td align="right"><b>学科公告:</b></td>
			<td>
				<select name="subjectId">
				
      <#if admin??>
        <#if admin=='1'>
        <option value='0'>站点主页</option>
        </#if>  
      </#if>
      <#if subject_list??>
      	<#list subject_list as s>
        <#if subjectId ??>
        <option value='${s.subjectId}' ${(s.subjectId==subjectId)?string('selected','')}>${s.subjectName}</option>
        <#else>
        <option value='${s.subjectId}'>${s.subjectName}</option>
        </#if> 
      	</#list>
      </#if>
				
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" valign='top'><b>公告内容:</b></td>
			<td colspan="2"> 
				<textarea name="placardContent" style='display:none'>${placard.content!?html}</textarea>
				 <iframe id="DHtml_Frame" src="fckeditor/editor/fckeditor.jsp?InstanceName=placardContent&Toolbar=Default" 
		      		width="100%" height="300" frameborder="0" scrolling="no"></iframe>
      		</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type='hidden' name='cmd' value='save' />
				<input type='hidden' name='placardId' value='${placard.id}' />
				<input type='hidden' name='title_min_length' value='${Util.JitarConst.MIN_TITLE_LENGTH}'/>
				<input type='hidden' name='title_max_length' value='${Util.JitarConst.MAX_TITLE_LENGTH}'/>
				<input class="button" type="submit" value="${(placard.id == 0)?string(' 添  加 ',' 修  改 ')} " />
				<input class="button" type="button" value=" 返  回 " onclick="window.history.back()" />
			</td>
		</tr>
	  </table>
		
	</form>
	<script>
	  $('#plcard_title').bind('blur',function(){
	        var min_length = $('input[name=title_min_length]').val();
	        var max_length =  $('input[name=title_max_length]').val();
	        var text = $(this).val();
	        if(text.length < min_length || text.length > max_length){
	           $(this).val('');
	           alert('标题至少为'+min_length+'个汉字最多为'+max_length+'个汉字');
	        }
	    })
	</script>
</body>