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
//取fck内容的长度
function GetMessageLength(str)
{
    var oEditor = FCKeditorAPI.GetInstance(str) ;
    var oDOM = oEditor.EditorDocument ;
    var iLength ;
    var svalue="";
    if ( document.all )        // If Internet Explorer.
    {
        svalue = oDOM.body.innerText;
        svalue = svalue.replace(/[\s]+/gi,"");
        iLength = svalue.length ;
    }
    else                    // If Gecko.
    {
        var r = oDOM.createRange() ;
        r.selectNodeContents( oDOM.body ) ;
        svalue = r.toString();
        svalue = svalue.replace(/[\s]+/gi,"");
        iLength = svalue.length ;
    }
//    oEditor.InsertHtml('')
return iLength
}  
//取fck内容
function GetMessageContent(str)
{
     var oEditor = FCKeditorAPI.GetInstance(str) ;
     return oEditor.GetXHTML();
}  
  
     function checkData(frm)
    {
        if(frm.st.value=="")
        {
            alert("请输入专题名称");
            return false;
        }
        if(frm.se.value=="")
        {
            alert("请输入有效期限");
            return false;
        }    
     var datePattern = /^(\d{4})-(\d{1,2})-(\d{1,2})$/; 
      if (! datePattern.test(frm.se.value)) { 
        window.alert("请填写正确的日期格式"); 
        return false; 
      }
       
      var d1 = new Date(frm.se.value.replace(/-/g, "/")); 
      var today = new Date();
    
      if (Date.parse(d1) - Date.parse(today) < 0) { 
        window.alert("有效期限必须在今天以后"); 
        return false;
      } 
      
      var content;
      var oEditor = FCKeditorAPI.GetInstance("DHtml");
      content = oEditor.GetXHTML(true);
      var len = content.length;
      if (len > 2000) {
      	alert("专题描述不要多于2000个字符！");
      	return false;
      }
      
        return true;   
    }
</script>   
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
<h3>创建专题：</h3>
<form method='post' onsubmit="return checkData(this);">
<table class='listTable'>
<tr>
<td style='width:90px;'><b>专题名称(<span style='color:#f00'>*</span>)：</b></td><td><input name='st' style='width:100%' /></td>
</tr>
<tr>
<tr>
<td><b>有效期限(<span style='color:#f00'>*</span>)：</b></td><td><input id='s_date' name='se' style='width:100px' />(格式:yyyy-MM-dd)</td>
</tr>
<tr>
<td><b>专题Logo：</b></td><td><input name='so' style='width:100%' /><br/><input type='button' value='选择或上传图片…' onclick='openUpload()' /> (<span style='color:red'>若不上载logo图片，系统会有默认图片，并以常规字体显示专题名称。上载的logo图片宽度请制作为999px，并在图片上写上专题名称。</span>)
</td>
</tr>
<tr>
<td><b>专题描述：</b><br/>
<span style='color:#f00'>不要多于2000个字符。</span>
</td><td>
<input name='sd' type='hidden' id='DHtml' />
<iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&amp;Toolbar=Basic" scrolling="no" width="100%" frameborder="0" height="300"></iframe>
</td>
</tr>
</table>
<div><input class='button' type='submit' value=' 创  建 ' /> <span style='color:#f00'>提示：创建专题，可以参照候选专题投票来创建，也可以不参考。</span></div>
</form>
<script type='text/javascript'>
calendar.set("s_date");
</script>
