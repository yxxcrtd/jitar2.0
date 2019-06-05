<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>回复评论</title>
  <link rel="stylesheet" href="../css/manage.css" type="text/css" />
  <script type="text/javascript" src="js/common.js"></script>
  <script type="text/javascript" src="js/user.js"></script>
  <script>
  var oFCKeditor;

function submit_reply() {
  var oEditor = FCKeditorAPI.GetInstance('commentReply');
  $("commentReply").value = oEditor.GetXHTML();
  $('submit_button').disabled = true;
}
  </script>
  <script type="text/javascript" src="fckeditor/fckeditor.js"></script>
</head>
  
<body>

<h2>回复评论</h2>
<div class='funcButton'>
  您现在的位置：<a href='${SiteUrl}manage/' target='_top'>个人控制面板</a>
  &gt;&gt; <a href='article.action?cmd=list'>文章管理</a>
  &gt;&gt; <a href='article.action?cmd=comment_list'>评论管理</a>
  &gt;&gt; 回复评论
</div>

<form name='commentForm' method="post" action="article.action?cmd=save_comment_reply" onsubmit='submit_reply()'>
  <input type='hidden' name='id' value='${comment.id}' />
  <#if __referer??>
    <input type='hidden' name='__referer' value='${__referer}' />
  </#if>
  <table cellspacing='1' class='listTable'>
  <!--
    <tr>
      <td>标题:</td>
      <td>${comment.title!?html}</td>
    </tr>
  -->  
    <tr>
      <td>作者:</td>
      <td>${comment.userName!?html} 发表于 ${comment.createDate}</td>
    </tr>
    <tr>
      <td colspan='2'>
        <br />
	      <div style='border: 1px solid gray'>
	        ${comment.content!}
	      </div>
	      <br />
        <textarea id='commentReply' name='commentReply' style='display:none'></textarea>
        <iframe id="DHtml_Frame" 
		      src="fckeditor/editor/fckeditor.jsp?InstanceName=commentReply&Toolbar=Basic" 
		      width="100%" 
		      height="200" 
		      frameborder="0" 
		      scrolling="no">
      </iframe>
        
      </td>
    </tr>
  </table>
  <div class='funcButton' >
    <input id='submit_button' type='submit' class='button' value=' 确认提交 ' />
    <input type='button' class='button' value=' 返回 ' onclick='window.history.back();' />
  </div>
</form>
  
 </body>
</html>
