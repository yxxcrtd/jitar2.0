<div id='toolbar'>
	<#if loginUser?? >
	<div style='float:right;'>
		<div style="padding:6px;text-align:right;">
			<a href='${SiteUrl}' target=_top>网站首页</a> | 
			<a href='${SiteUrl}p/${prepareCourse.prepareCourseId}/0/'>备课首页</a> | 		
			<#if visitor_role?default('') == 'admin'>
			<a href='javascript:void(0)' onclick='DivUtil.showModuleList(event,"p");return false;'>添加模块</a> | 
			<a href='javascript:void(0)' onclick='DivUtil.showSkin(event,"course");return false;'>设置主题</a> | 
			<a href='javascript:void(0)' onclick='DivUtil.showColumn(event);return false;'>更换布局</a> | 
			</#if>
			<a href='${SiteUrl}go.action?loginName=${loginUser.loginName}' target=_top>我的首页</a> | 
			<a href='${SiteUrl}manage/' target=_top>空间管理</a> | 
			<a href='${SiteUrl}logout.jsp?redUrl=${SiteUrl}p/${prepareCourse.prepareCourseId}/0/' target=_top>退出登录</a>
		</div>
	</div>
	</#if>
	<div class='innertoolbar'>
	    <#if loginUser?? >
	    	欢迎您：${loginUser.nickName}，今天是：${currentDate}
	    <#else>
	    	<a href='${SiteUrl}'>网站首页</a> | 
	    	<a href='${SiteUrl}p/${prepareCourse.prepareCourseId}/0/'>备课首页</a> | 
	    	<a href='${SiteUrl}register.action'>注册新帐户</a> | 
			<a href='${SiteUrl}login.jsp' donclick='LoginUI.showLogin();return false;'>通行证登录</a>
	    </#if>
	</div>
	<div id='innerToolbar'></div>
</div>
