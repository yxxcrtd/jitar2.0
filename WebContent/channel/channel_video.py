from cn.edustar.jitar.util import ParamUtil
from base_action import BaseAction, ActionResult
from java.util import HashMap
from base_channel_page import ChannelPage
from channel_query import ChannelVideoQuery

class channel_video(ChannelPage):
    def __init__(self):
        ChannelPage.__init__(self)
        self.params = ParamUtil(request)
        self.channelPageService = __spring__.getBean("channelPageService")        
        self.templateProcessor = __spring__.getBean("templateProcessor")
        self.channel = None
        
    def execute(self):
        channelId = self.params.safeGetIntParam("channelId")
        if channelId == 0:
            self.addActionError(u"您所访问的页面不存在！")
            return ActionResult.ACCESS_ERROR
        self.channel = self.channelPageService.getChannel(channelId)
        if self.channel == None:
            self.addActionError(u"无法加载指定的页面！")
            return ActionResult.ACCESS_ERROR
        map = HashMap()
        map.put("channel", self.channel)
        head_nav = "video"
        
        # 输出页头
        headerContent = self.GenerateContentFromTemplateString(self.channel.headerTemplate, head_nav)
        footerContent = self.GenerateContentFromTemplateString(self.channel.footerTemplate, head_nav)
        # 输出主体部分：
        # 分类树
        video_category = self.categoryService.getCategoryTree("channel_video_" + str(self.channel.channelId))
        map.put("video_category", video_category)
        
        channelCateId = self.params.safeGetIntParam("channelCateId")
        qry = ChannelVideoQuery("cv.videoId, video.title, video.createDate, video.flvThumbNailHref, cv.userId, user.loginName, user.trueName")
        qry.channelId = self.channel.channelId        
        if channelCateId != 0:            
            qry.custormAndWhereClause = " channelCate LIKE '%/" + str(channelCateId) + "/%'"
        pager = self.createPager()
        pager.totalRows = qry.count()
        video_list = qry.query_map(pager)

        map.put("video_list", video_list)
        map.put("pager", pager)
        
        if self.channel.skin == None :
            skin = "template1"
        elif self.channel.skin == "" :
            skin = "template1"
        else:
            skin = self.channel.skin  
                    
        mainContent = self.templateProcessor.processTemplate(map, "/WEB-INF/channel/" + skin + "/channel_video.ftl", "utf-8")
        out = response.getWriter()
        if headerContent == "" and footerContent == "" and mainContent == "":
            out.println(u"该频道没有指定模板，无法显示页面内容。")
            return
        
        out.println(headerContent)
        out.println(mainContent)
        out.println(footerContent)
        
    def createPager(self):
        pager = self.params.createPager()
        pager.itemName = u"视频"
        pager.itemUnit = u"个"
        pager.pageSize = 20
        return pager
