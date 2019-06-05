<form method='post'>
<#if question?? >
<input type='hidden' name='questionId' value='${question.questionId}' />
<div>问题名称 <span style="color:red">*</span>：<input name='quesition_title' style='width:80%' value='${question.topic!?html}' /></div>
<div>问题描述 <span style="color:red">*</span>：<input name='quesition_content' style='display:none' value='${question.questionContent!?html}' /></div>
<#else>
<div>问题名称 <span style="color:red">*</span>：<input name='quesition_title' style='width:80%' value='' /></div>
<div>问题描述 <span style="color:red">*</span>：<input id='quesition_content' name='quesition_content' style='display:none' value="" /></div>
</#if>
<iframe id="quesition_content__Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=quesition_content&Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="300"></iframe>
<div><input type='submit' value=' 提  问 ' /></div>
</form>
