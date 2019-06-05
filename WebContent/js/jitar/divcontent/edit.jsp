<%@page import="cn.edustar.jitar.model.SiteUrlModel"%>
<%@page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%><%
  String widgetId = request.getParameter("widgetId");  
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>编辑</title>
  <script src='../core.js'></script>
  <script type='text/javascript'>
  function Init()
  {
  	var t = window.opener.document.getElementById("webpart_<%=widgetId %>_h").innerHTML;
  	var c = window.opener.document.getElementById("webpart_<%=widgetId %>_c").innerHTML;
  	document.forms[0].widgetTitle.value = t;
  	document.forms[0].content.value = c;
  	//window.frames['fck'].StartEditor();
  }  
  function saveText()
  {
   window.opener.DivUtil.saveSimpleTextData(<%=widgetId %>,document.forms[0].widgetTitle.value,FCKeditorAPI.GetInstance("DHtml").GetXHTML(true),window)
   }
  </script>
 </head>
<body>
<form method='post' action='saveEdit.action'>
<input name='widgetId' type='hidden' value='<%=widgetId %>' />
标题：<input name='widgetTitle' style='width:100%' />
内容：<input type="hidden" id="DHtml" name="content" value="" />
    <iframe id='DHtml_Frame' name="fck"  onload='Init()' 
        src="<%=SiteUrlModel.getSiteUrl() %>manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default" 
        width="100%" height="350" frameborder="0" scrolling="no"></iframe>
<input type="button" class='button' value="保存内容" onclick='saveText()' />
<input type="button" class='button' value="关闭窗口" onclick = 'window.close();' />
</form>
</body>
</html>
