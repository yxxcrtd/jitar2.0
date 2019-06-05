# script
from cn.edustar.jitar.util import ParamUtil
from cn.edustar.jitar.data import Command
from group_member_query import GroupMemberQuery
from base_blog_page import *
from cn.edustar.jitar.util.json import *
from base_action import BaseAction

user_svc = __jitar__.userService

# 显示用户加入的所有协作组.
class user_group_list(BaseAction, RequestMixiner, ResponseMixiner, PageCheckMixiner):
    def __init__(self):
        self.params = ParamUtil(request)
    
    def execute(self):
        # 解析 uri.
        if self.parseUri() == False:
            return self.sendNotFound(self.uri)
          
        writer = response.getWriter()
        
        # 加载当前用户对象.
        user = user_svc.getUserByLoginName(self.loginName)
        request.setAttribute("user", user)
        #print "user = ", user
        ##if self.canVisitUser(user) == False:
        ##    return self.ACCESS_ERROR
            
        # loginUser 对象来自基类 BaseAction .
        request.setAttribute("loginUser", self.loginUser)
        
        pager = self.params.createPager()  
        qry = GroupMemberQuery(""" g.groupName,g.groupId,g.groupTitle,g.groupIcon,gm.joinDate """)
        qry.userId = user.userId
        qry.orderType = 0 
        pager.setPageSize(16)        
        pager.itemName = u"协作组"
        pager.itemUnit = u"个"
        group_list = qry.query_map(pager)
        pager.totalRows = group_list.size()
        
        #print "group_list = " , group_list
        request.setAttribute("group_list", group_list)        
        request.setAttribute("pager",pager)        
        hql = """SELECT p.skin
             FROM Page p 
             WHERE p.name = 'index' and p.objId = :userId and p.objType = 1
             """ 
        pageSkin = Command(hql).setInteger("userId", user.userId).scalar()
        #print "pageSkin = ", pageSkin
        if pageSkin == None or pageSkin == "": pageSkin = "skin1"
        
        # 构造页面数据，由于页面不是在数据库存在的，这里的数据是虚拟数据.
        #pages : [{id: ${page.pageId}, title: '${user.blogName!?js_string}', layoutId: ${page.layoutId!0} }],
        page = {
                "pageId":0,
                "layoutId":2, # 固定是布局2
                "isSystemPage" : "true", 
                "owner" : "user", 
                "title" :"",
                "skin":pageSkin
                }        
        request.setAttribute("page", page)
        self.page = self.getUserProfilePage(user)
        if self.page.customSkin != None:
            customSkin = JSONValue.parse(self.page.customSkin)
            request.setAttribute("customSkin", customSkin)
        
        # 构造widgets .
        widgets = [
                   {"id": "1", "pageId":0, "columnIndex":1,"title":u"个人档案","module":"profile", "ico":"", "data":""},
                   {"id": "placerholder1", "pageId":0, "columnIndex":2,"title":"","module":"placeholder", "ico":"", "data":""}
                  ]
        request.setAttribute("widgets",widgets)
        request.setAttribute("widget_list",widgets)
        
        response.setContentType("text/html; charset=UTF-8")
        return "/WEB-INF/user/default/user_groups.ftl"

    # 解析页面参数.
    def parseUri(self):
      self.uri = self.getRequestURI()
      #print "self.uri =", self.uri
      if self.uri == None or self.uri == "":
        return False
      
      # 例子: /Groups/liujunxing/group -> 
      #   ['', 'Groups', 'liujunxing', 'group']
      # 其中最后一个是 group, 倒数第二个是用户名.
      arr = self.uri.split('/')
      arr_len = len(arr)
      if arr_len < 2:
        return False
      
      # 得到访问的用户名, 并初步验证其合法性.
      self.loginName = arr[arr_len - 2]   # 'admin'
      # print "self.loginName = ", self.loginName
      if isValidName(self.loginName) == False:
        return False
      
      return True
        