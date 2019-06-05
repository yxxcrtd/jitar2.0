<#if prepareCourse.leaderId != 0 >
<div style='font-weight:bold;padding:4px 0'>
<#assign u = Util.userById(prepareCourse.leaderId )>
主备人：${u.trueName!?html}
</div>
</#if>
<#if prepareCourse.lockedUserId != 0 >
<div style='font-weight:bold;padding:4px 0;color:#F00;'>
<#assign u = Util.userById(prepareCourse.lockedUserId )>
${u.trueName!?html} 于 ${prepareCourse.lockedDate?string('yyyy-MM-dd HH:mm:ss')} 签出编辑
</div>
</#if>

<#if prepareCourse.commonContent?? >
${Util.eraseHtml(noHtmlContent,100)} [<a href='${SiteUrl}p/${prepareCourse.prepareCourseId}/0/py/show_preparecourse_common_content.py'>查看全部</a>]
</#if>