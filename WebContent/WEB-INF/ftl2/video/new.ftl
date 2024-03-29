<div class="contentRelation">
  <h3><a href="${ContextPath}video_list.action?type=new" class="more">更多</a>最新视频</h3>
        <div class="videoListWrap videoW2">
        <#if new_video_list?? && new_video_list?size &gt;0 >
          <#assign iCount = 0>
          <#list new_video_list as video>
                <#if video_index == 0 || video_index == 6 || video_index == 12>
                    <ul class="videoList">
                    <#assign iCount = iCount+1>
                </#if>        
                <li>
                    <a href="${ContextPath}manage/video.action?cmd=show&videoId=${video.videoId}">
                    <img border=0 src="${video.flvThumbNailHref!}" width="125" height="100"/>
                    </a>
                    <p class="videoListBg"></p>
                    <a href="${ContextPath}manage/video.action?cmd=show&videoId=${video.videoId}" class="videoListText">${Util.getCountedWords(video.title,14)}</a>
                </li>
                <#if video_index == 5 || video_index == 11>
                    </ul>
                </#if>
            </#list>
            <#if new_video_list?size &lt; 19 && new_video_list?size!=6 && new_video_list?size != 12>
                </ul>
            </#if>
        </#if>                 
        </div>     
        <p class="videoSlide videoS2">
            <#list 0..iCount-1 as i>
            <a href="javascript:;"<#if i==0> class="active"</#if>>${i+1}</a>
            </#list>        
        </p>
</div>
