<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><#include '/WEB-INF/ftl2/common/site_title.ftl' /> - 修改活动</title>
<#include "/WEB-INF/ftl2/common/favicon.ftl" />
<link rel="stylesheet" href="${SiteThemeUrl}css/common.css" type="text/css">
<link rel="stylesheet" href="${SiteThemeUrl}css/section.css" type="text/css">
<script src="${ContextPath}js/new/jquery.js" type="text/javascript"></script>
<script src="${ContextPath}js/new/jscroll.js" type="text/javascript"></script>
<script src="${ContextPath}js/new/index.js" type="text/javascript"></script>
<script src="${ContextPath}js/new/show_photo.js" type="text/javascript"></script>
<script src='${ContextPath}js/datepicker/calendar.js' type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ContextPath}js/datepicker/calendar.css" />
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
  
  function getUserList()
  {
      
  }
  
  function postAction(cmd)
  {
   var f = document.getElementById("fAction")
       if("edit" == cmd){
            if(!checkData(f)){
                return false;
            }
       }
       if("inviteuser" == cmd){
            if(document.getElementById("inviteUserId").value == ""){
                alert("请先邀请用户，再点添加");
                return false;   
            }
       }   
   f.cmd.value = cmd
   f.submit();
  }
  
  function selAll(o)
  {
   var cs = document.getElementsByName("guid")
   for(i = 0;i<cs.length;i++)
   {
    cs[i].checked = o.checked;
   }
  }
  
function selectUser()
{
  url = '${ContextPath}selectUser.action?showgroup=1&singleuser=0&inputUser_Id=inviteUserId&inputUserName_Id=inviteUserName'
  window.open(url,'_blank','left=100,top=50,height=450,width=550,toolbar=no,menubar=no,scrollbars=yes,resizable=1');
}
//-->
</script>
<style>
input{border:1px solid gray;height:20px}
textarea{border:1px solid gray;}
</style>
</head>
<body>
<#include "/WEB-INF/ftl2/site_head.ftl" />
<!--活动 Start-->
<div class="secMain mt25 clearfix">
<div class="moreList border">

<#if edustarAction?? >
      <h3 class="h3Head textIn"><span class="moreHead">修改活动</span></h3>
        <div class="moreContent">
        
<form id="fAction" method="post" action="actionEdit.action?actionId=${edustarAction.actionId}">
<input name='cmd' type='hidden' value='' />
        
          <table class="moreTable activityTable" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动名称：</strong></div>
                        </td>
                        <td>
                          <div class="activityP"><input name='actionName' value="${edustarAction.title!?html}" style='width:600px' /></div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动类型：</strong></div>
                        </td>
                        <td>
                          <div class="activityP">
<input type='radio' name='actionType' value='0' id='actionType0' <#if edustarAction.actionType == 0 >checked='checked' </#if>/><label for='actionType0'>任意参加</label>
<input type='radio' name='actionType' value='1' id='actionType1' <#if edustarAction.actionType == 1 >checked='checked' </#if>/><label for='actionType1'>只能组内人员参加</label>
<input type='radio' name='actionType' value='2' id='actionType2' <#if edustarAction.actionType == 2 >checked='checked' </#if>/><label for='actionType2'>只能邀请参加</label>
<br/>
<span style='color:#F00'>组内的含义：个人活动指好友；群组活动指组内成员；集备活动指集备成员；学科活动的组指属于该学科的用户（不限学段）。</span>
       
                          </div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动方式：</strong></div>
                        </td>
                        <td>
                          <div class="activityP">
<input type='radio' name='actionVisibility' value='0' id='actionVisibility0' <#if edustarAction.visibility == 0 >checked='checked' </#if>/><label for='actionVisibility0'>完全公开</label>
<input type='radio' name='actionVisibility' value='1' id='actionVisibility1' <#if edustarAction.visibility == 1 >checked='checked' </#if>/><label for='actionVisibility1'>保密</label>
                          </div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动描述：</strong></div>
                        </td>
                        <td>
                          <div class="activityP">
    <input type="hidden" id="DHtml" name="actionDescription" value="${edustarAction.description!?html}" />   
    <iframe id="DHtml_Frame" src="${SiteUrl}manage/fckeditor/editor/fckeditor.jsp?InstanceName=DHtml&Toolbar=Default" width="100%" height="300" frameborder="0" scrolling="no"></iframe>

                      </div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动人数限制：</strong></div>
                        </td>
                        <td>
                          <div class="activityP"><input name='actionUserLimit' value='${action.userLimit!0}' /> (0表示不限制)</div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动报名人数：</strong></div>
                        </td>
                        <td>
                          <div class="activityP">${edustarAction.attendCount!0}</div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动开始时间：</strong></div>
                        </td>
                        <td>
                          <div class="activityP">
 
        <input name="actionStartDateTimeYMD" id="actionStartDateTimeYMD" value="${edustarAction.startDateTime?string("yyyy-MM-dd")}" readonly="readonly" />
        <select name="actionStartDateTimeH">
        <#list 0.. 23 as i>
        <#if startDateTimeH == i>
        <#assign sH = " selected='selected'" >
        <#else>
        <#assign sH = "" >
        </#if>
        <option value='${i}'${sH}>${i}</option>
        </#list>
        </select>点 
        <select name="actionStartDateTimeMM">
        <#list 0.. 59 as i>
        <#if startDateTimeMM == i>
        <#assign sMM = " selected='selected'" >
        <#else>
        <#assign sMM = "" >
        </#if>
        <option value='${i}'${sMM}>${i}</option>
        </#list>
        </select>分
                          
                          
                          </div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动结束时间：</strong></div>
                        </td>
                        <td>
                          <div class="activityP">
        <input name="actionFinishDateTimeYMD" id="actionFinishDateTimeYMD" value="${edustarAction.finishDateTime?string("yyyy-MM-dd")}" readonly="readonly" />
       
        <select name="actionFinishDateTimeH">
        <#list 0.. 23 as i>
        <#if finishDateTimeH == i>
        <#assign fH = " selected='selected'" >
        <#else>
        <#assign fH = "" >
        </#if>
        <option value='${i}'${fH}>${i}</option>
        </#list>
        </select>点
        <select name="actionFinishDateTimeMM">
        <#list 0.. 59 as i>
        <#if finishDateTimeMM == i>
        <#assign fMM = " selected='selected'" >
        <#else>
        <#assign fMM = "" >
        </#if>
        <option value='${i}'${fMM}>${i}</option>
        </#list>
        </select>分
                          
                          </div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>报名截止时间：</strong></div>
                        </td>
                        <td>
                          <div class="activityP">
        <input name="attendLimitDateTimeYMD" id="attendLimitDateTimeYMD" value="${edustarAction.attendLimitDateTime?string("yyyy-MM-dd")}" readonly="readonly" />
       
        <select name="attendLimitDateTimeH">
        <#list 0.. 23 as i>
        <#if attendLimitDateTimeH == i>
        <#assign aH = " selected='selected'" >
        <#else>
        <#assign aH = "" >
        </#if>
        <option value='${i}'${aH}>${i}</option>
        </#list>
        </select>点        
        <select name="attendLimitDateTimeMM">
        <#list 0.. 59 as i>
        <#if attendLimitDateTimeMM == i>
        <#assign aMM = " selected='selected'" >
        <#else>
        <#assign aMM = "" >
        </#if>
        <option value='${i}'${aMM}>${i}</option>
        </#list>
        </select>分       
                          </div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong>活动地点：</strong></div>
                        </td>
                        <td>
                          <div class="activityP"><textarea name='actionPlace' style='width:100%;height:60px;'>${edustarAction.place!?html}</textarea></div>
                        </td>
                    </tr>
                    <tr>
                      <td class="activityTdBg">
                          <div class="activityP"><strong></strong></div>
                        </td>
                        <td>
                          <div class="activityP">
<input type='button' value='修改活动' onclick='postAction("edit")' />        
                          </div>
                        </td>
                    </tr>
                    
                    
                    <tr>
    <td  class="activityTdBg"><div class="activityP"><strong>本活动参与人员：</strong></div></td>
    <td><div class="activityP">
      <#if action_user_list?? >
        <table border='0' cellpadding='4' cellspacing='1' style='background:#ccc'>
        <tr style='background:#EEE'>
        <th>序号</th>
        <th><input type='checkbox' onclick='selAll(this)' /></th>
        <th>登录名</th>
        <th>真实姓名</th>
        <th>加入时间</th>
        <th>状态</th>
        <th>机构</th>
        <th>用户留言</th>
        </tr>
      <#list action_user_list as user>
       <tr style='background:#FFF'>
       <td>${user_index + 1}</td>
         <td><#if user.userId != edustarAction.createUserId><input type='checkbox' name='guid' value='${user.actionUserId}' /></#if></td>
       <td><a href='${SiteUrl}go.action?loginName=${user.loginName}' target='_blank'>${user.loginName}</a></td>
       <td><a href='${SiteUrl}go.action?loginName=${user.loginName}' target='_blank'>${user.trueName}</a></td>
       <td>${user.actionUserCreateDate!?string('yyyy-MM-dd HH:mm')}</td>
       <td>
       <#if user.actionUserStatus == 0 >
    <span style="color:#f00">未回复</span>
    <#elseif user.actionUserStatus ==1 >
    已参加
    <#elseif user.actionUserStatus ==2 >
    已退出
    <#elseif user.actionUserStatus ==3 >
    已请假
    <#else>
    未定义
    </#if>
       </td>
       <td>${user.unitTitle!}</td>
       <td>${user.actionUserDescription!?html}</td>
      </tr>
      </#list>
        </table>
        <input type='button' value='删除活动用户' onclick='postAction("deluser")' />
        <input type='button' value='导出用户报名表' onclick='postAction("printuser")' />      
        （序号只起统计人数的作用）
      </#if>
      </div>
    </td>
    </tr>
    <tr>
    <td  class="activityTdBg"><div class="activityP"><strong>邀请用户：</strong></div></td>
    <td>
    <div class="activityP">
    <input type='hidden' name='inviteUserId' id='inviteUserId' />
    <textarea id='inviteUserName' style='width:100%;height:100px;border:0px' readonly='readonly'></textarea>
    <br/>
    <input type='button' value='邀请用户' onclick='selectUser()' />
    <input type='button' value='添加用户' onclick='postAction("inviteuser")' />     
    （管理员增加用户暂时不受人数限制）
    </div>
    </td>
    </tr>   
    
                </tbody>
            </table>
            </form>
            </#if>
        </div>
        <div class="imgShadow"><img src="${SiteThemeUrl}images/imgShadow.jpg" class="imgShadowSize9" /></div>
        
    </div>
<script type='text/javascript'>
calendar.set("actionStartDateTimeYMD");
calendar.set("actionFinishDateTimeYMD");
calendar.set("attendLimitDateTimeYMD");
</script>
<!--协作组 End-->
<!--公共尾部 Start-->
<#include '/WEB-INF/ftl2/footer.ftl'>
<!--公共尾部 End-->

<!--[if IE 6]>
<script src="${ContextPath}js/new/DD_belatedPNG.js" type="text/javascript"></script>
<script type="text/javascript">
  DD_belatedPNG.fix('.topSearch,.login a,.videoPlay,.videoPlayBg,.tx,.liW,.liX,.liP,.leftNavS li,.leftNavIcon,.leftNavIconH,.folder,.liFolder,.coopTag,.comma1,.comma2');
</script>
<![endif]-->
</body>
</html>