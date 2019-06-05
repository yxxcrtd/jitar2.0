<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>邀请加入协作组</title>
  <link rel="stylesheet" href="../css/manage.css" type="text/css" />
<script>
function invite_friend(sel) {
  var loginName = sel.options[sel.selectedIndex].value;
  if (loginName == null || loginName == '') return;
  document.inviteForm.loginName.value = loginName;
}
</script>
</head>
<body>
<#include 'group_title.ftl' >
<div class='funcButton'>
  您现在的位置： <span>邀请加入协作组</span>
</div>

<form name='inviteForm' action='groupMember.action' method='post' onsubmit='return check(this);'>
  <input type='hidden' name='cmd' value='invite_user' />
  <input type='hidden' name='groupId' value='${group.groupId}' />

<table class='listTable' border='0' cellspacing='1'>
  <tr> 
    <td width='20%' align='right'><b>要邀请的用户：</b></td>
    <td> 
      <input type='text' name='loginName' value='' />
    <#if friend_list?? >
      好友: <select onchange='invite_friend(this)'>
        <option value=''>选择要邀请的好友</option>
      <#list friend_list as f >
        <option value='${f.loginName}'>${f.trueName!?html}(${f.loginName})</option> 
      </#list>
      </select>
    </#if>
      <font color='red'>*</font> 请填写用户登录名.
    </td>
  </tr>
  <tr>
    <td width='20%' align='right'></td>
    <td>
      <input type='submit' class='button' value='  邀  请  ' />
      <input type='button' class='button' value='返回协作组' onclick='window.location.href="../go.action?groupName=${group.groupName}"' />
    </td>
  </tr>
</table>

</form>
<script>
function check(form) {
  if (form.loginName.value == '') {
    alert('请填写或选择一个要邀请的用户的登录名.');
    return false;
  }
}
</script>

</body>
</html>
