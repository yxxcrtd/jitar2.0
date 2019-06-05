    <#assign grpName="协作组">
    <#assign grpShowName="小组">
    <#if isKtGroup??>
        <#if isKtGroup=="1">
            <#assign grpName="课题组"> 
            <#assign grpShowName="课题">
        <#elseif isKtGroup=="2">
            <#assign grpName="备课组"> 
            <#assign grpShowName="小组">
        <#else>
            <#assign grpName="协作组">
            <#assign grpShowName="小组">
        </#if>
    </#if>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <title>添加/修改${grpName}公告</title>
  <link rel="stylesheet" type="text/css" href="../css/manage.css" />
</head>
<body>
<#include 'group_title.ftl' >
<div class='pos'>
  您现在的位置： <a href='group.py?cmd=home&amp;groupId=${group.groupId}'>${grpName}管理首页</a>
  &gt;&gt; <a href='groupPlacard.action?cmd=list&amp;groupId=${group.groupId}'>${grpName}公告管理</a>
  &gt;&gt; <span>${(placard.id == 0)?string('添加', '修改')}群组公告</span>
</div>

<form action='groupPlacard.action' method='post' name="theForm">
<#if __referer??>
  <input type='hidden' name='__referer' value='${__referer}' />
</#if>
  <table class='listTable' cellspacing='1'>
    <tr>
      <td align="right" width='20%'><b>公告标题：</b></td>
      <td>
        <input type="text" name="title" id="placardtitle" size='75' value='${placard.title!?html}' />
        <font color='red'>*</font> 必须填写公告标题.
      </td>
    </tr>
    <tr>
      <td align="right" valign='top'><b>公告内容：</b></td>
      <td>
        <textarea name="content" style='display:none'>${placard.content!?html}</textarea>
        <iframe id="DHtml_Frame" 
		      src="fckeditor/editor/fckeditor.jsp?InstanceName=content&Toolbar=Basic" 
		      width="100%" 
		      height="400"
		      frameborder="0" 
		      scrolling="no">
        </iframe>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <input type='hidden' name='cmd' value='save_placard' />
        <input type='hidden' name='groupId' value='${group.groupId}' />
        <input type='hidden' name='placardId' value='${placard.id}' />
        <input class="button" type="button" value="  ${(placard.id == 0)?string('添 加', '修 改')}  " onclick="saveData();"/>
        <input class="button" type="button" value=" 返 回 "
          onclick="window.history.back()" />
      </td>
    </tr>
  </table>
</form>
<script type="text/javascript">
function saveData(){
    var v=document.getElementById("placardtitle").value
    if(v=="")
    {
        alert("请输入标题");
        return;
    }
    document.theForm.submit();
}
</script>  
</body>
</html>
