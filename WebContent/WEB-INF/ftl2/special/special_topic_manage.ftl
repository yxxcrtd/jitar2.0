<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title><#include '/WEB-INF/ftl2/common/site_title.ftl' /> - </title>
  <#include "/WEB-INF/ftl2/common/favicon.ftl" />
  <link href="${SiteUrl}css/manage.css" rel="stylesheet" type="text/css" />  
	<link rel="stylesheet" href="${SiteThemeUrl}css/common.css" type="text/css">
  <script type="text/javascript" src='${SiteUrl}js/jitar/core.js'></script>
</head>
<h2>讨论管理</h2>
<#if t_list??>
<form method='post'>
<table>
<thead>
<tr>
<th width="17px"><input type='checkbox' id='cxx' onclick="CommonUtil.SelectAll(this,'q_guid')" /></th>
<th width="100%">讨论话题名称</th>
<th><nobr>发起人</nobr></th>
<th><nobr>发起时间</nobr></th>
<th></th>
</tr>
</thead>
<tbody>
<#list t_list as t>
<tr>
<td><input type='checkbox' name='q_guid' value='${t.plugInTopicId}' /></td>
<td><a target='_blank' href='${SiteUrl}mod/topic/show_topic.action?guid=${parentGuid}&type=${parentType}&topicId=${t.plugInTopicId}'>${t.title!?html}</a></td>
<td><nobr><a href='${SiteUrl}go.action?userId=${t.createUserId}'>${t.createUserName?html}</a></nobr></td>
<td><nobr>${t.createDate?string('yyyy/MM/dd')}</nobr></td>
</tr>
</#list>
</tbody>
</table>
<div style='padding:4px'>
<input class='button' type='button' value='全部选中' onclick='document.getElementById("cxx").click();CommonUtil.SelectAll(document.getElementById("cxx"),"q_guid")' />
<input class='button' type='submit' value='删除选中' />
</div>
</form>
<#include "/WEB-INF/ftl/inc/pager.ftl" >
</#if>
</body>
</html>