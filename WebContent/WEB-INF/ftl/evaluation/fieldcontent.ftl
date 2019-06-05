<#if field_list??>
<table border="0" cellspacing="0" cellpadding="0" style="width:100%;height:450px">
<#list field_list as t >
<tr>
<td style="width:140px;text-align:right;size:12px;font-weight: bold;">
<br/><br/>
${t.fieldsCaption!?html}
</td>
<td>
<input type="hidden" name="fieldname${t.fieldsId}" value="${t.fieldsCaption!?html}"/>
<input type="hidden" name="fieldcontent${t.fieldsId}" />
 <iframe src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=fieldcontent${t.fieldsId}&Toolbar=Default" 
  width="100%" 
  height="300" 
  frameborder="0" 
  scrolling="no">
</iframe>
</td>
</tr>
</#list>
<tr>
    <td></td>
    <td>
        <input type="submit" name="btnSave" value="保存评课内容" onclick="return checkInput(this.form)"/>
    </td>
</tr>
</table>
</#if>