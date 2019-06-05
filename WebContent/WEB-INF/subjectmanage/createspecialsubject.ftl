<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
  <title>专题</title> 
  <link rel="icon" href="${SiteUrl}images/favicon.ico" /> 
  <link rel="shortcut icon" href="${SiteUrl}images/favicon.ico" /> 
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/manage.css" /> 
  <link rel="stylesheet" type="text/css" href="${SiteUrl}js/datepicker/calendar.css" />  
  <script src='${SiteUrl}js/datepicker/calendar.js' type="text/javascript"></script> 
<script type="text/javascript"> 
function openUpload()
{
 var url = "${SiteUrl}manage/userfm/index.jsp?Type=Image"
 window.open(url,'_blank','width=800,height=600,resizable=1,scrollbars=1')
}
 
function SetUrl( url, width, height )
{
    if(url)
    {
        document.forms[0].so.value = url;
    }
}
</script> 
</head> 
<body>
<h3>
<#if specialSubject??>
修改专题：
<#else>
创建专题：
</#if>
</h3> 
<form method='post'>

<table class='listTable'> 
<tr> 
<td style='width:90px;'><b>专题名称(<span style='color:#f00'>*</span>)：</b></td><td><input name='st' style='width:100%' value='<#if specialSubject??>${specialSubject.title!html}</#if>' /></td> 
</tr> 
<tr> 
<tr> 
<td><b>有效期限(<span style='color:#f00'>*</span>)：</b></td><td><input id='s_date' name='se' readonly="readonly" style='width:100px' value='<#if specialSubject??>${specialSubject.expiresDate?string('yyyy-MM-dd')}</#if>' />(格式:yyyy-MM-dd)</td> 
</tr> 
<tr> 
<td><b>专题Logo：</b></td><td><input name='so' style='width:100%' value='<#if specialSubject??>${specialSubject.logo!?html}</#if>' /><br/><input type='button' value='选择或上传图片…' onclick='openUpload()' /> (<span style='color:red'>若不上载logo图片，系统会有默认图片，并以常规字体显示专题名称。上载的logo图片宽度请制作为999px，并在图片上写上专题名称。</span>)
</td> 
</tr> 
<tr> 
<td><b>专题描述：</b><br/> 
<span style='color:#f00'>不要多于2000个字符。</span> 
</td><td> 
<input name='sd' type='hidden' id='DHtml' value='<#if specialSubject??>${specialSubject.description!?html}</#if>' /> 
<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&amp;Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="300"></iframe> 
</td> 
</tr> 
</table> 
<div><input class='button' type='submit' value='<#if specialSubject??> 修  改  <#else> 创  建 </#if>' /> <span style='color:#f00'>提示：创建专题，可以参照候选专题投票来创建，也可以不参考。</span></div> 
</form> 
<script type='text/javascript'> 
calendar.set("s_date");
</script> 