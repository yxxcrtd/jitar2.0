<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="shortcut icon" href="${SiteUrl}images/favicon.ico" />
  <title>集体备课 <#include ('/WEB-INF/ftl/webtitle.ftl') ></title>
  <link rel="stylesheet" type="text/css" href="${SiteThemeUrl}precourse.css" />
  <link rel="stylesheet" type="text/css" href="../../css/manage.css" />
  
  <link rel="stylesheet" type="text/css" href="${SiteUrl}js/datepicker/calendar.css" />  
  <script src='${SiteUrl}js/datepicker/calendar.js' type="text/javascript"></script>
  <script src='${SiteUrl}js/jitar/core.js'></script>
  <script type='text/javascript'>
  //<![CDATA[
  function doPost(strCmd)
  {
    if(strCmd == 'add' || strCmd == 'edit')
    {
       if(document.pc.elements['stageTitle'].value == '')
       {
        alert("请输入流程名。")
        return;
       }
       if(document.pc.elements['stageStartDate'].value == '')
       {
        alert("请输入开始日期。")
        return;
       }       
       if(document.pc.elements['stageEndDate'].value == '')
       {
        alert("请输入结束日期。")
        return;
       }
       //判断时间
       
      var datePattern = /^(\d{4})-(\d{1,2})-(\d{1,2})$/; 
      
      if (! datePattern.test(document.pc.elements['stageStartDate'].value)) { 
        window.alert("请填写正确的开始日期"); 
        return false; 
      }
      if (! datePattern.test(document.pc.elements['stageEndDate'].value)) { 
        window.alert("请填写正确的结束日期"); 
        return; 
      }
      var prepareCourseStartDate = new Date("${prepareCourse.startDate?string('yyyy/MM/dd')}");
      var prepareCourseEndDate =  new Date("${prepareCourse.endDate?string('yyyy/MM/dd')}");  
      var d1 = new Date(document.pc.elements['stageStartDate'].value.replace(/-/g, "/")); 
      var d2 = new Date(document.pc.elements['stageEndDate'].value.replace(/-/g, "/"));
      if (Date.parse(d2) - Date.parse(d1) < 0) { 
        window.alert("开始日期必须早于结束日期"); 
        return;
      } 
      
      if (Date.parse(d1) - Date.parse(prepareCourseStartDate) < 0) { 
        window.alert("开始日期必须晚于备课开始时间${prepareCourse.startDate?string('yyyy-MM-dd')}"); 
        return;
      } 
      
      if (Date.parse(prepareCourseEndDate) - Date.parse(d2) < 0) { 
        window.alert("结束日期必须早于备课结束时间${prepareCourse.endDate?string('yyyy-MM-dd')}"); 
        return;
      }       
     
      

    }
	if(strCmd == 'delete')
	{
	 if(!hasSelectdItem())
	 {
	  alert("请选择要删除的流程。");
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
  
function hasSelectdItem()
{
 var ids = document.getElementsByName('guid');
  for(i = 0;i<ids.length;i++)
  {
    if(ids[i].checked) return true;
  }
  return false;
}

  //]]
  </script>
 </head>
 <body> 
 <#include '/WEB-INF/ftl/course/preparecourse_title.ftl' >
<div class='pos'>
  您现在的位置： <a href='manage_pc.py?prepareCourseId=${prepareCourse.prepareCourseId}'>【${prepareCourse.title}】管理首页</a>
  &gt;&gt; <span>流程管理</span> 
</div>
<form method="post" name='pc' action='manage_createPreCourse3.py?prepareCourseId=${prepareCourseId}'>
<input type='hidden' name='cmd' value='' />
<h4> 现有流程：</h4>
        <#if precoursestage_list?? >
	    <table cellspacing='1' class='pc_table' style='width:100%'>
	    <tr>
	    <td style='width:17px'><input type='checkbox' onclick='selAll(this)' /></td>
	    <td class='fontbold'>流程名称</td>
	    <td class='fontbold'>开始日期</td>
	    <td class='fontbold'>结束日期</td>
	    <td class='fontbold'>显示顺序</td>
	    <td class='fontbold'>任务描述</td>
	    <td class='fontbold'>修改</td>
	    </tr>
	    <#list precoursestage_list as pcs>
	    <tr style='background:#FFF' valign='top'>
	    <td><input type='checkbox' name='guid' value='${pcs.prepareCourseStageId}' /><input type='hidden' name='stageId' value='${pcs.prepareCourseStageId}' /></td>
	    <td>${pcs.title}</td>
	    <td>${pcs.beginDate!?string('yyyy-MM-dd')}</td>
	    <td>${pcs.finishDate!?string('yyyy-MM-dd')}</td>
	    <td><input name='orderIndex${pcs.prepareCourseStageId}' value='${pcs.orderIndex}' style='width:20px;' /></td>
	    <td>${pcs.description!}</td>
	    <td><a href='manage_createPreCourse3.py?prepareCourseId=${prepareCourseId}&prepareCourseStageId=${pcs.prepareCourseStageId}'>修改</a></td>
	    </tr>
	    </#list>
	    </table>
	    <input type='button' value='删除选择' onclick='doPost("delete")' />
	    <input type='button' value='修改显示顺序' onclick='doPost("order")' />
	    </#if>
       
<h4>
<#if prepareCourseStage?? >修改流程<#else>新建流程</#if>：
</h4>

    <#if prepareCourseStage?? >
       <input type='hidden' name='prepareCourseStageId' value='${prepareCourseStageId}' />
       <table style="width:100%">
        <tr>
        <td style='width:80px'>流程名称：</td><td><input name='stageTitle' value='${prepareCourseStage.title!?html}' style='width:300px' /><span style='color:#f00'>*</span></td>
        </tr>
        <tr>
        <td>开始日期：</td><td><input id="start_date" name='stageStartDate' readonly="readonly" value='${prepareCourseStage.beginDate?string('yyyy-MM-dd')}' /><span style='color:#f00'>*</span>(格式：年年年年-月月-日日)</td>
        </tr>
        <tr>
        <td>结束日期：</td><td><input id="end_date" name='stageEndDate' readonly="readonly" value='${prepareCourseStage.finishDate?string('yyyy-MM-dd')}' /><span style='color:#f00'>*</span>(格式：年年年年-月月-日日)</td>
        </tr>
        <tr>
        <td>顺序：</td><td><input name='stageOrderIndex' value='${prepareCourseStage.orderIndex}' /></td>
        </tr>
        <tr valign='top'>
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
        </td>
        </tr>
        </table>        
    <#else>    
		<table style="width:90%">
		<tr>
		<td style='width:80px'>流程名称：</td><td><input name='stageTitle' value='' style='width:300px' /><span style='color:#f00'>*</span></td>
		</tr>
		<tr>
		<td>开始日期：</td><td><input id="start_date" name='stageStartDate' value='' readonly="readonly" /><span style='color:#f00'>*</span>(格式：年年年年-月月-日日) </td>
		</tr>
		<tr>
		<td>结束日期：</td><td><input id="end_date" name='stageEndDate' value='' readonly="readonly" /><span style='color:#f00'>*</span>(格式：年年年年-月月-日日) </td>
		</tr>
		<tr valign='top'>
		<td>流程任务：</td><td>
		<input type="hidden" id="DHtml" name="stageDescription" value="" />     
		<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default"
		width="90%" height="300" frameborder="0" scrolling="no"></iframe>
		</td>
		</tr>
		<tr>
		<td></td>
		<td>
		<input type='button' value='添加流程' onclick='doPost("add")' /> 			
		</td>
		</tr>
		</table>
	</#if>
</form>
<script>
calendar.set("start_date");
calendar.set("end_date");
</script>
</body>
</html>