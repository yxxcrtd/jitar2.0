<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>${prepareCourse.title?html}</title>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/common/common.css" />
  <link id='skin' rel="stylesheet" type="text/css" href="${SiteUrl}css/skin/${page.skin!'default'}/skin.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/layout/layout_2.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/tooltip/tooltip.css" />
  <#include ('common_script.ftl') >
  <script src='${SiteUrl}js/jitar/core.js'></script>
  <script src='${SiteUrl}js/jitar/lang.js'></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/Drag.js"></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/tooltip.js"></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/login.js"></script>
</head> 
<body>
    <#include ('func.ftl') >
    <div id='progressBar' style='position:absolute;width:200px;left:600px;top:8px;border:1px solid red;display:none;background:yellow;float:right;z-index:100'>正在加载……</div>
    <div id='header'>
      <div id='blog_name'><span>${prepareCourse.title!?html}</span></div>
    </div>
    <div id='nav'><#include ('navbar.ftl') ></div>
    <#include ('/WEB-INF/layout/layout_2.ftl') >
    <div id='placerholder1' title='查看个案内容' style='display:none;padding:1px;'>
		<div class="article_title" style='text-align:center'>${showUser.trueName}的个案</div>
		<div class="article_content">${prepareCourseMember.privateContent!}</div>
	<a name='top'></a>
   <#if comment_list?? >
    <#list comment_list as comment>
    <#assign u = Util.userById(comment.commentUserId) >
    <#if (u.trueName??)><#assign userName = u.trueName >
    <#elseif (u.nickName??)><#assign userName = u.nickName >
    <#elseif (u.loginName??)><#assign userName = u.loginName >
    </#if>
    <table border="0" cellspacing="1" cellpadding="3" class="commentTable">
	<tr>
		<td class="commentLeft">
        <img src="${SSOServerUrl +'upload/'+ u.userIcon!"images/default.gif"}" width='48' height='48' border='0' onerror="this.src='${ContextPath}images/default.gif'"/>
        <a onmouseover="ToolTip.showUserCard(event,'${u.loginName!}','${userName}', '${SSOServerUrl +'upload/'+ u.userIcon!"images/default.gif"}')" href="${SiteUrl}go.action?loginName=${u.loginName!}" target="_blank">${u.nickName!?html}</a>		
		</td>
		<td class="commentRight">
			<div class="commentHeader">				
			<span style="float: right">${comment.createDate} <a href="#top">[TOP]</a></span>
			<span style='clear:both;font-weight:bold;'>${comment.title?html}</span>
			</div>
			<div class="commentContent">${comment.content}</div>
			</td>
		</tr>
	</table>
    </#list>
	<div class='pager'>
	<#include 'pager.ftl'>
	</div>
  </#if>
  
	<#if prepareCourseMember?? && loginUser?? >
	<form method='post'>
	评论标题(<span style='color:#F00'>*</span>)：<input style='width:400px' name='commentTitle' value='RE:${showUser.trueName?html}的个案' />
	<input id="DHtml" name="content" value="&lt;span&gt;&lt;/span&gt;" type="hidden">
	<br/>
	评论内容(<span style='color:#F00'>*</span>)：<br/>
	<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&amp;Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="300"></iframe>
	<input name="commentedUserId" value="${prepareCourseMember.userId}" type="hidden">
	<div style='text-align:center'>
	<input value="发表评论" type="submit" />
	</div>
	</form>
	</#if>		
    </div>
     <div id='placerholder3' title='全部个案' style='display:none;'>
     	<#include ('user_content.ftl') >
    </div>
    <div id='page_footer'></div>
    <script>App.start();</script>
    <div id="subMenuDiv"></div>
    <script src="${SiteUrl}css/tooltip/tooltip_html.js" type="text/javascript"></script>
    <#-- 原来这里是 include loginui.ftl  -->
    <script type="text/javascript" src="${SiteUrl}js/jitar/msgtip.js"></script>
</body>
</html>