<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="icon" href="${SiteUrl}images/favicon.ico" />
  <link rel="shortcut icon" href="${SiteUrl}images/favicon.ico" />
  <link rel="alternate" type="application/rss+xml" title="Recent Changes" href="/rss.py?type=article" />
  <#if SiteConfig ??>
  <meta name="keywords" content="${SiteConfig.site.keyword!}" /> 
  </#if>
  <title><#include '/WEB-INF/ftl/webtitle.ftl' ></title>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}css/common/common.css" />
  <link rel="stylesheet" type="text/css" href="${SiteThemeUrl}index.css" />
  <link rel="stylesheet" type="text/css" href="${SiteThemeUrl}action.css" />
  <script type="text/javascript" src="${SiteUrl}js/jitar/core.js"></script>
    <script src='${SiteUrl}js/datepicker/calendar.js' type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${SiteUrl}js/datepicker/calendar.css" />
  
   <script type="text/javascript">
  <!--
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
        if(frm.actionName.value=="")
        {
            alert("请输入活动名称");
            return false;
        }
        if(GetMessageLength("DHtml")=='0')
        {
            alert('请输入活动描述');       
            return false;
        }
        return true;   
    }
    
  function isLeap(theYear)
  {
    return (new Date(theYear,1,29).getDate() == 29);
  }
  
  function showMonth(y,m,d)
  {  
    f = document.getElementById("fAction")
    f.elements[m].options.length = 0;  
    for(i = 1; i< 13;i++)
    {
      f.elements[m].options[f.elements[m].options.length] = new Option(i,i)
    } 
     
    f.elements[d].options.length = 0;  
    for(i = 1; i< 32;i++)
    {
      f.elements[d].options[f.elements[d].options.length] = new Option(i,i)
    }     
  }
  
  function showDay(m,y,d)
  {
    monthDays = 0;
    f = document.getElementById("fAction")
    f.elements[d].options.length = 0;
    selectMonth = m.options[m.selectedIndex].value
    if(selectMonth == "1" || selectMonth == "3" || selectMonth == "5" || selectMonth == "7" || selectMonth == "8" ||
     selectMonth == "10" || selectMonth == "12")
    {
        monthDays = 31
    }
    else if( selectMonth == "4" || selectMonth == "6" || selectMonth == "9" || selectMonth == "11")
	{
	   monthDays = 30	
	}
    else
    {
       Y = parseInt(f.elements[y].options[f.elements[y].selectedIndex].value,10)
       if(isLeap(Y))
       {
         monthDays = 29        
       }
       else
       {
        monthDays = 28
       }
    }
    for(i = 1; i <= monthDays;i++)
    {
        f.elements[d].options[f.elements[d].options.length] = new Option(i,i)
    }
  }
  
  function selectUser()
  {
    window.open("selectUser.action")
  }
  
  function getUserList()
  {
      
  }
  
function selectUser()
{
  url = '${SiteUrl}selectUser.action?showgroup=1&singleuser=0&inputUser_Id=inviteUserId&inputUserName_Id=inviteUserName'
  window.open(url,'_blank','left=100,top=50,height=450,width=550,toolbar=no,menubar=no,scrollbars=yes,resizable=1');
}

  </script>
 </head> 
 <body>
 <#include '/WEB-INF/ftl/site_head.ftl' >
 <div style='clear:both;height:10px;'></div>
 
 <div class='dist'>
  <div class='dist_head'>
    <div class='dist_head_left'>&nbsp;<img src='${ContextPath}css/index/j.gif' />&nbsp;发起活动</div>
  </div>
  <div class='dist_content' style='text-align:left;'> 

   <form id="fAction" method="post" action="createAction.action">
   <input type='hidden' name='ownerId' value='${ownerId}' />
    <input type='hidden' name='ownerType' value='${ownerType}' />
    <table border='0' cellpadding='4' cellspacing='1' width='100%' class='table_action'>
    <tr>
    <td class='table_action_td1'>活动名称：<span style="color:red">*</font></td><td class='table_action_td2'><input name='actionName' style='width:600px' /></td>
    </tr>
    <tr>
    <td class='table_action_td1'>活动类型：<span style="color:red">*</font></td><td class='table_action_td2'>
	     <input type='radio' name='actionType' value='0' id='actionType0' checked='checked' /><label for='actionType0'>任意参加</label>
	     <input type='radio' name='actionType' value='1' id='actionType1' /><label for='actionType1'>只能组内人员参加</label>
	     <input type='radio' name='actionType' value='2' id='actionType2' /><label for='actionType2'>只能邀请参加</label>
	     <span style='color:#F00'> 【注】组内的含义：个人活动指好友；群组活动指组内成员；集备活动指集备成员；学科活动的组指属于该学科的用户（不限学段）。</span>
	  </td>
    </tr>
    <tr>
        <td class='table_action_td1'>活动方式：<span style="color:red">*</font></td><td class='table_action_td2'>
        <input type='radio' name='actionVisibility' value='0' id='actionVisibility0' checked='checked' /><label for='actionVisibility0'>完全公开</label>
        <input type='radio' name='actionVisibility' value='1' id='actionVisibility1' /><label for='actionVisibility1'>保密(只能参与活动的人员看到)</label>
     </td>
    </tr>
    <tr>
      <td class='table_action_td1'>活动描述：<span style="color:red">*</font></td><td class='table_action_td2'>
      <input type="hidden" id="DHtml" name="actionDescription" value="" />	 
	  <iframe id="DHtml_Frame"
	    src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default"
	    width="100%" height="300" frameborder="0" scrolling="no"></iframe>
      </td>
    </tr>
    <tr>
        <td class='table_action_td1'>活动人数限制：<span style="color:red">*</font></td><td class='table_action_td2'><input name='actionUserLimit' value='0' /> (0表示不限制)</td>
    </tr>
    <tr>
        <td class='table_action_td1'>活动开始时间：<span style="color:red">*</font></td>
        <td class='table_action_td2'>
        <input name="actionStartDateTimeYMD" id="actionStartDateTimeYMD" readonly="readonly" />        
        <select name="actionStartDateTimeH">
        <#list 0.. 23 as i>
        <option value='${i}'>${i}</option>
        </#list>
        </select>点 
        <select name="actionStartDateTimeMM">
        <#list 0.. 59 as i>
        <option value='${i}'>${i}</option>
        </#list>
        </select>分 
        </td>
    </tr>
    <tr>
        <td class='table_action_td1'>活动结束时间：<span style="color:red">*</font></td>
        <td class='table_action_td2'>
        <input name="actionFinishDateTimeYMD" id="actionFinishDateTimeYMD" readonly="readonly" />   
        <select name="actionFinishDateTimeH">
        <#list 0.. 23 as i>
        <option value='${i}'>${i}</option>
        </#list>
        </select>点
        <select name="actionFinishDateTimeMM">
        <#list 0.. 59 as i>
        <option value='${i}'>${i}</option>
        </#list>
        </select>分 
      </td>
    </tr>
    <tr>
        <td class='table_action_td1'>报名截止时间：<span style="color:red">*</font></td>
        <td class='table_action_td2'>
        <input name="attendLimitDateTimeYMD" id="attendLimitDateTimeYMD" readonly="readonly" />   
        <select name="attendLimitDateTimeH">
        <#list 0.. 23 as i>
        <option value='${i}'>${i}</option>
        </#list>
        </select>点        
        <select name="attendLimitDateTimeMM">
        <#list 0.. 59 as i>
        <option value='${i}'>${i}</option>
        </#list>
        </select>分
        </td>
    </tr>
    <tr>
      <td class='table_action_td1'>活动地点：</td><td class='table_action_td2'><textarea name='actionPlace' style='width:100%;height:60px;'></textarea></td>
    </tr>
    <tr>
        <td class='table_action_td1'>邀请用户：</td><td class='table_action_td2'>
        <input type='hidden' name='inviteUserId' id='inviteUserId' />
        <textarea id='inviteUserName' style='width:100%;height:100px;border:0px' readonly='readonly'></textarea>
        </td>
    </tr>
    <tr>
        <td class='table_action_td2'></td><td class='table_action_td2'>
        <input type='button' value='邀请用户' onclick='selectUser()' />
        <input type='submit' value='发起活动' />
        </td>
    </tr>
    </table>
    </form>
 </div>   
 </div> 
<div style="clear: both;"></div>   
<#include '/WEB-INF/ftl/footer.ftl'>
<script type='text/javascript'>
calendar.set("actionStartDateTimeYMD");
calendar.set("actionFinishDateTimeYMD");
calendar.set("attendLimitDateTimeYMD");
</script>
 </body>
</html>