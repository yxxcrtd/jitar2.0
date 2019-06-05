<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>回复</title>
  <link rel="stylesheet" href="../css/manage.css" type="text/css" />
<script>
function check() {
  var title = document.replyForm.title.value;
  if (title == null || title == '') {
    alert('请输入回复标题.');
    return false;
  }
  return true;
}
</script>
</head>
  
<body>
<#include 'group_title.ftl' >
  	
<div class='pos'>
  您现在的位置： <a href='group.py?cmd=home&amp;groupId=${group.groupId}'>协作组管理首页</a>
  &gt;&gt; <a href='groupBbs.action?cmd=topic_list&amp;groupId=${group.groupId}'>协作组论坛</a> 
  &gt;&gt; <span>回复主题: ${topic.title!?html}</span>
</div>
  	
<form name='replyForm' action="groupBbs.action" method="post" onsubmit='return check();'>
 	<input type='hidden' name='cmd' value='save_reply'/>
 	<input type='hidden' name='topicId' value='${topic.topicId}' />
 	<input type='hidden' name='groupId' value='${group.groupId}' />
 		<#if __referer??>
			<input type='hidden' name='__referer' value='${__referer!}' />
 		</#if>
    <table class="listTable" cellspacing='1' >
    	<tr>
    		<td align="right" width='20%'><b>回复标题:</b></td>
    		<td>
    		  <input type="text" name="title" size="60" />
    		  <font color='red'>*</font> 必须填写标题.
    		</td>
    	</tr>												
    	<tr>
    		<td valign="top" align="right" width="20%"><b>回复内容:</b></td>
    		<td> 
    			<textarea name='content' style='display:none'></textarea>
    		<iframe id="DHtml_Frame" 
		      src="fckeditor/editor/fckeditor.jsp?InstanceName=content&Toolbar=Basic" 
		      width="100%" 
		      height="400" 
		      frameborder="0" 
		      scrolling="no">
      		</iframe>
			</td>
    	</tr>
    <tr>
    	<td></td>
    	<td>
    		<input type="submit" class='button' value="  发  表  " />&nbsp;&nbsp;
    		<input type='button' class='button' value=" 返 回 " onclick="window.history.back()" />
    	</td>
    </tr>
    </table>
  </form>
  </body>
</html>
