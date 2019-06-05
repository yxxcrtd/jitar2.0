<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>${prepareCourse.title?html}</title>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/common/common.css" />
  <link id='skin' rel="stylesheet" type="text/css" href="${SiteUrl}css/skin/${page.skin!'default'}/skin.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/layout/layout_2.css" />
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/tooltip/tooltip.css" />
  <#include 'common_script.ftl' >
  <script src='${SiteUrl}js/jitar/core.js'></script>
  <script src='${SiteUrl}js/jitar/lang.js'></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/tooltip.js"></script>
  <script type="text/javascript" src="${SiteUrl}js/jitar/login.js"></script>
</head> 
<body>
    <#include 'func.ftl' >
    <div id='progressBar' style='position:absolute;width:200px;left:600px;top:8px;border:1px solid red;display:none;background:yellow;float:right;z-index:100'>正在加载……</div>
    <div id='header'>
      <div id='blog_name'><span>${prepareCourse.title!?html}</span></div>
    </div>
    <div id='nav'><#include 'navbar.ftl' ></div>
    <#include '/WEB-INF/layout/layout_2.ftl' >
    <div id='placerholder1' title='编写个案' style='display:none;padding:1px;'>
    <div style="padding-bottom:6px"><a href='${SiteUrl}p/${prepareCourseId}/0/py/show_preparecourse_user_content.py?userId=${loginUser.userId}' target="_blank"><strong>查看我的个案</strong></a></div>
    <#if prepareCourseMember.contentType == 2 || prepareCourseMember.contentType == 3 || prepareCourseMember.contentType == 4 || prepareCourseMember.contentType == 5>
	    <div style='padding:4px 0;color:#f00;'>
	          你的个案采用Word编辑的方式，先需要安装Word插件， 点击打开Word进行编辑，请编辑完毕务必点击“上传到集备”按钮。
	    <br/><br/>
	    <#if prepareCourseMember.contentType==2>
	    <a href="${SiteUrl}download/EdustarCourse2003Setup_x86.zip" target="_blank">下载 Word 2003 插件(x86)</a>
	    <#elseif prepareCourseMember.contentType == 3>
	    <a href="${SiteUrl}download/EdustarCourse2007Setup_x86.zip" target="_blank">下载 Word 2007 插件</a> | 
	    <#elseif prepareCourseMember.contentType == 4>
	    <a href="${SiteUrl}download/EdustarCourse2010Setup_x86.zip" target="_blank">下载 Word 2010 插件(x86)</a> | 
	    <a href="${SiteUrl}download/EdustarCourse2010Setup_x64.zip" target="_blank">下载 Word 2010 插件(x64)</a>
	    </#if>	    
	    <br/><br/><iframe src="javascript:void(0)" style="display:none" name="hideFrame"></iframe>
	    <div style="text-align:center"><a href="upload_private_prepare_course.py" target="hideFrame" style="font-size:2em;font-weight:bold;text-align:center;">打开Word <#if prepareCourseMember.contentType==2>2003<#elseif prepareCourseMember.contentType == 3>2007<#elseif prepareCourseMember.contentType == 4>2010</#if>编辑个案</a></div>
	    </div>
    <#elseif prepareCourseMember.contentType == 100>
    <#if prepareCourseMember.privateContent?? && prepareCourseMember.privateContent != "">
    <div style="padding:6px 0;color:Red">请先 <a target="_blank" href="${SiteUrl}manage/DownloadCourseFile?p=${prepareCourseMember.prepareCourseMemberId}&t=doc&f=0">下载 Word 文件</a> 编辑完毕再上传。</div>
    </#if>
    <form method="post" action="<#if prepareCourseFileServer??>${prepareCourseFileServer}<#else>${SiteUrl}</#if>manage/fileUpload.action?cmd=uploadpreparecourse" enctype="multipart/form-data">
	<input type="hidden" name="prepareCourseId" value="${EncryptPrepareCourseId!}" />
	<input type="hidden" name="returnType" value="page" />
	<#if userTicket??><input type="hidden" name="userTicket" value="${userTicket}" /></#if>
	请选择一个 Word 文件：<br/><input type="file" name="doc" size="80"/><br/><br/>
	<input type="submit" value="上传 Word 文档" onclick = "return checkFile(this.form)" />
	<div id="info" style="display:none;color:red;font-weight:bold;padding:6px 0">正在上传文件，并进行转换，请稍候……</div>
	<div style="padding-top:6px;color:#f00">说明：Word文档可以是<b>Word 2003、Word 2007、Word 2010 、Word 2013</b>版本生成的文件。</div>
	</form>
	<script>
	function checkFile(f)
	{
	 if(f.doc.value==''){
	 alert('请先选择一个文件。');
	 return false;
	 };
	 document.getElementById('info').style.display='';
	 return true;
	}
	</script>
    <#else>
	    <form method='post'>
		<input type="hidden" id="DHtml" name="privateContent" value="${prepareCourseMember.privateContent!?html}" />     
		<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default"
		width="100%" height="800" frameborder="0" scrolling="no"></iframe>
		<div style='text-align:right'>
		<input type='submit' value='保存个案' />
		</div>
		</form>
	</#if>
    </div>
    <div id='page_footer'></div>
    <script>App.start();</script>
    <div id="subMenuDiv"></div>
    <script src="${SiteUrl}css/tooltip/tooltip_html.js" type="text/javascript"></script>
    <#-- 原来这里是 include loginui.ftl  -->
    <script type="text/javascript" src="${SiteUrl}js/jitar/msgtip.js"></script>
   
</body>
</html>