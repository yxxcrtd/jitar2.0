<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="shortcut icon" href="${SiteUrl}images/favicon.ico" />
  <title>集体备课 <#include ('/WEB-INF/ftl/webtitle.ftl') ></title>
  <script src='${SiteUrl}js/datepicker/calendar.js' type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${SiteThemeUrl}precourse.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}js/datepicker/calendar.css" />
  <script src='${SiteUrl}js/jitar/core.js'></script>
  <script type='text/javascript'>
  //<![CDATA[
  function doPost(strCmd)
  {
    if(strCmd == 'add')
    {
       if(document.pc.elements['stageTitle'].value == '')
       {
        alert("请输入流程名。")
        return;
       }
    }

    document.pc.elements['cmd'].value = strCmd
    document.pc.submit();
  }
  
  function selAll(o)
  {
    var c = document.getElementsByName('guid')
    for(i = 0;i<c.length;i++)
    {
     c[i].checked = o.checked;
    }
  }
  //]]
  </script>
 </head>
 <body>
<#include '/WEB-INF/ftl/site_head.ftl'>

<div class='course_title'>${prepareCourse.title!}</div>

<div class="box">
  <div class="box_head">
    <div class="box_head_left">&nbsp;<img src="../../${ContextPath}css/index/j.gif">&nbsp;【${prepareCourse.title!}】备课流程管理</div>
  </div>
  <div class="box_content" id='div1'>
	<form method="post" name='pc' action='createPreCourse3.py?prepareCourseId=${prepareCourseId}'>
	<input type='hidden' name='cmd' value='' />
	    <table style="width:100%">
	    <tr valign='top'>
	    <td class='fontbold'>现有流程：</td>
	    <td>
            <#if precoursestage_list?? >
		    <table cellspacing='1' class='pc_table'>
		    <tr>
		    <td style='width:17px'><input type='checkbox' onclick='selAll(this)' /></td>
		    <td class='fontbold'>流程名称</td>
		    <td class='fontbold'>开始流程</td>
		    <td class='fontbold'>结束流程</td>
		    <td class='fontbold'>显示顺序</td>
		    <td class='fontbold'>任务描述</td>
		    <td class='fontbold'>修改</td>
		    </tr>
		    <#list precoursestage_list as pcs>
		    <tr style='background:#FFF' valign='top'>
		    <td><input type='checkbox' name='guid' value='${pcs.prepareCourseStageId}' /><input type='hidden' name='stageId' value='${pcs.prepareCourseStageId}' /></td>
		    <td><a href='${SiteUrl}p/${prepareCourseId}/${pcs.prepareCourseStageId}/' target='_blank'>${pcs.title}</a></td>
		    <td>${pcs.beginDate!?string('yyyy-MM-dd')}</td>
		    <td>${pcs.finishDate!?string('yyyy-MM-dd')}</td>
		    <td><input name='orderIndex${pcs.prepareCourseStageId}' value='${pcs.orderIndex}' style='width:20px;' /></td>
		    <td>${pcs.description!}</td>
		    <td><a href='createPreCourse3.py?prepareCourseId=${prepareCourseId}&prepareCourseStageId=${pcs.prepareCourseStageId}'>修改</a></td>
		    </tr>
		    </#list>
		    </table>
		    <input type='button' value='删除选择' onclick='doPost("delete")' />
		    <input type='button' value='修改显示顺序' onclick='doPost("order")' />
		    <input type="button" value=" 返  回 " onclick="window.location.href='${SiteUrl}p/${prepareCourseId}/0/'" />
		    </#if>
        </td>
	    </tr>	    
	    <tr valign='top'>
	    <td class='fontbold'><#if prepareCourseStage?? >修改流程<#else>新建流程</#if>
	    </td>
	    <td>
	    <#if prepareCourseStage?? >
	       <input type='hidden' name='prepareCourseStageId' value='${prepareCourseStageId}' />
	       <table style="width:100%">
            <tr>
            <td style='width:80px'>流程名称：</td><td><input name='stageTitle' value='${prepareCourseStage.title!?html}' /> <span style='color:#f00'>*</span></td>
            </tr>
            <tr>
            <td>开始日期：</td><td><input name='stageStartDate' id='start-date' value='${prepareCourseStage.beginDate?string('yyyy-MM-dd')}' /> <span style='color:#f00'>*</span>（请单击输入框选择日期，日期格式：2008-12-26）</td>
            </tr>
            <tr>
            <td>结束日期：</td><td><input name='stageEndDate' id='end-date' value='${prepareCourseStage.finishDate?string('yyyy-MM-dd')}' /> <span style='color:#f00'>*</span>（请单击输入框选择日期，日期格式：2008-12-26）</td>
            </tr>
            <tr>
            <td>顺序：</td><td><input name='stageOrderIndex' value='${prepareCourseStage.orderIndex}' /></td>
            </tr>
            <tr>
            <td>流程任务：</td><td>
            <input type="hidden" id="DHtml" name="stageDescription" value="${prepareCourseStage.description}" />     
            <iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default"
            width="100%" height="300" frameborder="0" scrolling="no"></iframe>
            </td>
            </tr>
            <tr>
            <td></td>
            <td>
            <input type='button' value='修改流程' onclick='doPost("edit")' />            
            <input type="button" value=" 返  回 " onclick="window.location.href='${SiteUrl}p/${prepareCourseId}/0/'" /></td>
            </tr>
            </table>
            
	    <#else>
	    
			<table style="width:100%">
			<tr>
			<td style='width:80px'>流程名称：</td><td><input name='stageTitle' value='' /> <span style='color:#f00'>*</span></td>
			</tr>
			<tr>
			<td>开始日期：</td><td><input name='stageStartDate' id='start-date' value='' /> <span style='color:#f00'>*</span>（请单击输入框选择日期，日期格式：2008-12-26）</td>
			</tr>
			<tr>
			<td>结束日期：</td><td><input name='stageEndDate' id='end-date' value='' /> <span style='color:#f00'>*</span>（请单击输入框选择日期，日期格式：2008-12-26）</td>
			</tr>
			<tr>
			<td>流程任务：</td><td>
			<input type="hidden" id="DHtml" name="stageDescription" value="" />     
			<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default"
			width="100%" height="300" frameborder="0" scrolling="no"></iframe>
			</td>
			</tr>
			<tr>
			<td></td>
			<td>
			<input type='button' value='添加流程' onclick='doPost("add")' /> 			
			<input type="button" value=" 返  回 " onclick="window.location.href='${SiteUrl}p/${prepareCourseId}/0/'" /></td>
			</tr>
			</table>
		</#if>
		</td>
		</tr>
		</table>
	</form>
</div>
</div>
<div style='clear:both;'></div>
<#include ('/WEB-INF/ftl/footer.ftl') >
<script type='text/javascript'>
calendar.set("start-date");
calendar.set("end-date");
</script>
</body>
</html>