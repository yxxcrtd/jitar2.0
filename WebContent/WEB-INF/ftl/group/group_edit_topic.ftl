    <#assign grpName="协作组">
    <#assign grpShowName="小组">
    <#if isKtGroup??>
        <#if isKtGroup=="1">
            <#assign grpName="课题组"> 
            <#assign grpShowName="课题">
        <#else>
            <#assign grpName="协作组">
            <#assign grpShowName="小组">
        </#if>
    </#if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>编辑主题</title>
  <link rel="stylesheet" href="../css/manage.css" type="text/css" />
</head>
<body>
<#include 'group_title.ftl' >
<div class='pos'>
  您现在的位置： <a href='group.py?cmd=home&amp;groupId=${group.groupId}'>${grpName}管理首页</a>
  &gt;&gt; <a href='groupBbs.action?cmd=topic_list&amp;groupId=${group.groupId}'>${grpName}论坛</a>
  &gt;&gt; <span>编辑主题 '${topic.title!?html}'</span> 
</div>

 	<form action="groupBbs.action" method="post">
 		<input type='hidden' name='cmd' value='save_topic' />
 		<input type='hidden' name='groupId' value="${group.groupId}" />
 		<input type='hidden' name='topicId' value="${topic.topicId}" />
 		<#if __referer??>
			<input type='hidden' name='__referer' value='${__referer!}' />
 		</#if>
    <table class='listTable' border='0' cellspacing='1'>
    	<tr>
    		<td width='20%' align='right'><b>标题：</b></td>
    		<td>
    		  <input type="text" name="title" size="75" value='${topic.title!?html}' />
    		  <font color='red'>*</font> 必须填写标题.
    		</td>
    	</tr>
    	<tr>
    	  <td align='right' valign='top'><b>内容：</b></td>
    		<td> 
    			<textarea name='content' style='display:none'>${topic.content!?html}</textarea>
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
    		<td align='right'><b>标签：</b></td>
    		<td>
    		  <input type="text" name="tags" size='60' value='${topic.tags!?html}' /> (以 ',' 逗号隔开多个标签)
    		</td>
    	</tr>
    	<tr>
    	  <td></td>
    		<td>
    		  <input class='button' type="submit" value="  修  改  " />
    		  <input class="button" type="button" value=" 返 回 " onclick="window.history.back()"/>
    		</td>
    	</tr>
    </table>
  </form>
  </body>
</html>
