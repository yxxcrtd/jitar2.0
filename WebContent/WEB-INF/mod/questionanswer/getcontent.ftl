<h4>${question.topic}</h4>
<div style='font-weight:bold;'><a href='${SiteUrl}go.action?userId=${question.createUserId}'>${question.createUserName?html}</a> 于 ${question.createDate?string('yyyy/MM/dd')} 提问</div>
<div>${question.questionContent}</div>
<#if answer_list??>
<h4>对该问题的解答：</h4>
<#list answer_list as a>
<div>解答人：<a href='${SiteUrl}go.action?userId=${a.answerUserId}'>${a.answerUserName}</a> 解答时间：${a.createDate?string('yyyy-MM-dd HH:mm:ss')}</div>
<div>${a.answerContent}</div>
</#list>
</#if>
<div style='padding:10px 0'>解答该问题 <span style="color:red">*</span></div>
<form method='post'>
<input type='hidden' name='content' value='' />
<iframe src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=content&amp;Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="300"></iframe>
<input type='submit' value='发布解答' />
</form>