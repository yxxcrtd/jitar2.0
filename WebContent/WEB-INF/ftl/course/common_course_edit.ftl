<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="shortcut icon" href="${SiteUrl}images/favicon.ico" />
  <title>集体备课 <#include ('/WEB-INF/ftl/webtitle.ftl') ></title>
  <link rel="stylesheet" type="text/css" href="${SiteThemeUrl}precourse.css" />
  <link rel="stylesheet" type="text/css" href="${SiteThemeUrl}dtree.css" />  
  <script src='${SiteUrl}js/jitar/core.js'></script>
</head>
<body>
<#include '/WEB-INF/ftl/site_head.ftl'>
<div class='course_title'><a href='showPrepareCourse.py?prepareCourseId=${prepareCourse.prepareCourseId}'>${prepareCourse.title!}</a> - 共案</div>
<div style='clear:both;height:8px;font-size:0'></div>
<form method='post' action='editCommonPreCourse.py?prepareCourseId=${prepareCourse.prepareCourseId}'>
<input type="hidden" id="DHtml" name="commonContent" value="${prepareCourse.commonContent!?html}" />     
<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default"
width="100%" height="800" frameborder="0" scrolling="no"></iframe>
<input type='submit' value='保存共案' />
<input type='button' value=' 返  回 ' onclick='window.location.href="showPrepareCourse.py?prepareCourseId=${prepareCourse.prepareCourseId}"' />
</form>
<div style='clear:both;'></div>
<#include ('/WEB-INF/ftl/footer.ftl') >
</body>
</html>