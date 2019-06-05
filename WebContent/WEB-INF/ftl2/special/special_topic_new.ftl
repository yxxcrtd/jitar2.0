<form>
	<table style='width:100%'>
		<tr>
			<td style='width: 80px;font-weight:bold;' height="50">
				<h5>讨论标题<span style='color:#f00'>*</span>:</h5>
			</td>
			<td>
				<input name='ttitle' id="ttitle" style='width: 100%; height: 25px; outline: none; border: 1px solid #000000;' />
			</td>
		</tr>
	<tr>
	
<td style='font-weight:bold;'><h5>讨论内容<span style='color:#f00'>*</span>:</h5></td><td>
  <input name='tcontent' id='tcontent' style='display:none' />
  <iframe id="tcontent__Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=tcontent&Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="300"></iframe>
</td>
</tr>
<tr>
<td></td>
<td style="text-align: center;">
	<#if loginUser??>
		<input type="button" id="specialSubmit" value=' 提  交 ' class="specialSubmit" />
	<#else>
		请<a href='${SiteUrl}login.jsp' style='font-weight:bold;'>登录</a>后参与讨论。
	</#if>
</td>
</tr>
</table>
</form>

<script type='text/javascript'>
$("#specialSubmit").click(function(e) {
	if ("" == $("#ttitle").val()) {
		alert("请输入讨论标题！");
		return false;
	}      
    var oEditor = FCKeditorAPI.GetInstance("tcontent");
    var content = oEditor.GetXHTML(true);
    var len = content.length;
    if (len == 0) {
		alert("请输入讨论内容！");
      	return false;
    }
    
	$.ajax({
		type: "POST",
		url: "new_topic.action",
		data: "cmd=save&ttitle=" + $("#ttitle").val() + "&tcontent=" + content + "&guid=" + "${guid!}",
		success: function(msg) {
			if (msg = "success") {
				alert("提交成功！");
				window.location.href="specialSubjectList.action?type=topic&specialSubjectId=${specialSubjectId!}";
			}
		}
	});
});
</script>