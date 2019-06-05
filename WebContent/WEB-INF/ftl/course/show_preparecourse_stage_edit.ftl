<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>${prepareCourse.title?html}</title>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/common/common.css" />
  <link id='skin' rel="stylesheet" type="text/css" href="${SiteUrl}css/skin/${page.skin!'default'}/skin.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/layout/layout_8.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}js/datepicker/calendar.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/tooltip/tooltip.css" />
  <#include ('common_script.ftl') >
  <script src='${SiteUrl}js/jitar/core.js'></script>
  <script src='${SiteUrl}js/jitar/lang.js'></script>
  <script src='${SiteUrl}js/datepicker/calendar.js' type="text/javascript"></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/Drag.js"></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/tooltip.js"></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/login.js"></script>
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
    <#include ('func.ftl') >
    <div id='progressBar' style='position:absolute;width:200px;left:600px;top:8px;border:1px solid red;display:none;background:yellow;float:right;z-index:100'>正在加载……</div>
    <div id='header'>
      <div id='blog_name'><span>${prepareCourse.title!?html}</span></div>
    </div>
    <div id='nav'><#include ('navbar.ftl') ></div>
    <#include ('/WEB-INF/layout/layout_8.ftl') >
    <div id='placerholder1' title='流程管理' style='display:none;padding:1px;'> 
	    
<form method="post" name='pc'>
<input type='hidden' name='cmd' value='' />
<h4> 现有流程：</h4>
        <#if precoursestage_list?? >
	    <table cellspacing='1' class='pc_table' style='width:100%'>
	    <tr>
	    <td style='width:17px'><input type='checkbox' id='cc' onclick='selAll(this)' /></td>
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
	    <td><a href='showPrepareCourseStage.py?stageId=${pcs.prepareCourseStageId}&prepareCourseId=${prepareCourse.prepareCourseId}' target='_blank'>${pcs.title}</a></td>
	    <td>${pcs.beginDate!?string('yyyy-M-d')}</td>
	    <td>${pcs.finishDate!?string('yyyy-M-d')}</td>
	    <td><input name='orderIndex${pcs.prepareCourseStageId}' value='${pcs.orderIndex}' style='width:20px;' /></td>
	    <td>${pcs.description!}</td>
	    <td><a href='${SiteUrl}p/${prepareCourse.prepareCourseId}/${pcs.prepareCourseStageId}/py/show_preparecourse_stage_edit.py'>修改</a></td>
	    </tr>
	    </#list>
	    </table>
	    <input type='button' value='全部选择' onclick='document.getElementById("cc").click();' />
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
        <td style='width:80px'>流程名称：</td><td><input name='stageTitle' value='${prepareCourseStage.title!?html}' style='width:300px' /><span style='color:#f00'>*</span>(格式：年年年年-月-日)</td>
        </tr>
        <tr>
        <td>开始日期：</td><td><input id='start-date' name='stageStartDate' value='${prepareCourseStage.beginDate?string('yyyy-MM-dd')}' /><span style='color:#f00'>*</span>(请点击输入框选择日期，格式：年年年年-月月-日日)</td>
        </tr>
        <tr>
        <td>结束日期：</td><td><input id='end-date' name='stageEndDate' value='${prepareCourseStage.finishDate?string('yyyy-MM-dd')}' /><span style='color:#f00'>*</span>(请点击输入框选择日期，格式：年年年年-月月-日日)</td>
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
		<td>开始日期：</td><td><input id='start-date' name='stageStartDate' value='' /><span style='color:#f00'>*</span>(请点击输入框选择日期，格式：年年年年-月月-日日)</td>
		</tr>
		<tr>
		<td>结束日期：</td><td><input id='end-date' name='stageEndDate' value='' /><span style='color:#f00'>*</span>(请点击输入框选择日期，格式：年年年年-月月-日日)</td>
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


    </div>    
    <div id='page_footer'></div>
    <script>App.start();</script>
    <div id="subMenuDiv"></div>
    <script src="${SiteUrl}css/tooltip/tooltip_html.js" type="text/javascript"></script>
    <#-- 原来这里是 include loginui.ftl  -->
    <script type="text/javascript" src="${SiteUrl}js/jitar/msgtip.js"></script>
    <script type="text/javascript">
		calendar.set("start-date");
		calendar.set("end-date");
	</script>
</body>
</html>