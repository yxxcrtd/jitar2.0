<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>${subject.subjectName?html}</title>
  <link rel="icon" href="${SiteUrl}images/favicon.ico" />
  <link rel="shortcut icon" href="${SiteUrl}images/favicon.ico" />
  <#if theme??>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}theme/subject/${theme}/index.css" />
  <#else>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}theme/subject/${subject.themeName?default('theme1')}/index.css" />
  </#if>
  <style type='text/css'>  
	#header_zone { width:100% }
	#left_zone { width:75%;padding-right:10px;}
	#middle_zone {width:25%;}
	#right_zone {}
	#bottom_zone {  } 
  </style>
<#include "/WEB-INF/subjectpage/subject_header_js.ftl">
 </head>
<body>
<#include "/html/updateinfo.htm" parse="false">
<#include "/WEB-INF/subjectpage/subject_header.ftl">
<#include "/WEB-INF/subjectpage/subject_nav.ftl">
<div style='height:8px;font-size:0'></div>

<#if unitId??>
<#if unitId ==0>
<#assign postFix = "">
<#else>
<#assign postFix = "_" + unitId?string>
</#if>
<#else>
<#assign postFix = "">
</#if>
<#function showdata t>
<#assign data_key = "sbj" + (subject.subjectId?string) + "_" + (t.subjectWebpartId?string) + postFix >
  <#if role?? && role=='admin'>
  	<#assign data1>
	  	<div id='webpart_${t.subjectWebpartId}' class='toolbox'><div class='title'><div class='control' onclick='Drag.chg(this);'>×</div><div id='webpart_${t.subjectWebpartId}_h'>${t.moduleName?html}</div></div><div class='inner' style='display:block'>
	  	${req.getAttribute(data_key)!}
	  	</div></div>
  	</#assign>
  	 <#return data1>
  <#else>
  <#assign data2>
  	${req.getAttribute(data_key)!}
  	<div style='height:8px;font-size:0'></div>
  	</#assign>
  <#return data2>
  </#if>
</#function>

<div id='container'>
<#if role?? && role=='admin'>
	<table border='0' style='width:100%' cellpadding='0' cellspacing='0' class='wrapper'>
	<tr>
	<td class='col' id='header_zone'>
	 <#list webpartList as t>
	    <#if t.webpartZone == 1>	    
	    ${showdata(t)}
	    </#if>
	  </#list>
	  <div class="dm"></div>	
	</td>
	</tr>
	</table>
<#else>
	<#if hasTopWebpart?? >
		<table border='0' style='width:100%' cellpadding='0' cellspacing='0'>
		<tr>
		<td id='header_zone'>
		 <#list webpartList as t>
		    <#if t.webpartZone == 1>	    
		    ${showdata(t)}
		    </#if>
		  </#list>
		</td>
		</tr>
		</table>
	</#if>
</#if>
	<#if role?? && role=='admin'>
	<table border='0' style='width:100%' cellpadding='0' cellspacing='0' class='wrapper'>
	<#else>
	<table border='0' style='width:100%' cellpadding='0' cellspacing='0'>
	</#if>
		<tr style='vertical-align:top;'>
		<td class='col' id='left_zone'>
		 	<#if hasLeftWebpart?? >
			  <#list webpartList as t>
			    <#if t.webpartZone == 3>
			    ${showdata(t)}
			    </#if>
			  </#list>
		  	</#if>
		    <div class="dm"></div>
	    </td>
	    <td class='col' id='middle_zone'>
	    	<#if hasMiddleWebpart?? >
			  <#list webpartList as t>
			    <#if t.webpartZone == 4>
			    ${showdata(t)}
			    </#if>
			  </#list>
		  	</#if>
		  	<#if hasRightWebpart?? >
			  <#list webpartList as t>
			    <#if t.webpartZone == 5>
			    ${showdata(t)}
			    </#if>
			  </#list>
		  	</#if>
		  	
		  	<div class="dm"></div>
		</td>		
		</tr>
	</table>
<#if role?? && role=='admin'>
	<table border='1' style='width:100%' cellpadding='0' cellspacing='0' class='wrapper'>
		<tr>
		<td class='col' id='bottom_zone'>
		 <#list webpartList as t>
		    <#if t.webpartZone == 2>
		    ${showdata(t)}
		    </#if>
		  </#list>		  
		  <div class="dm"></div>
		</td>
		</tr>
		</table>
<#else>

	<#if hasBottomWebpart?? >
	<div style='clear:both;height:8px;'></div>
	<table border='0' style='width:100%' cellpadding='0' cellspacing='0'>
		<tr>
		<td class='col' id='bottom_zone'>
		 <#list webpartList as t>
		    <#if t.webpartZone == 2>
		    ${showdata(t)}
		    </#if>
		  </#list>
		</td>
		</tr>
		</table>
	</#if>
</#if>
</div>
<#include "/WEB-INF/subjectpage/subject_footer.ftl">
<script type='text/javascript'>_Drag_init($("container"));</script>
</body>
</html>

