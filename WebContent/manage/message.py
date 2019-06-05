# coding=utf-8
from message_query import MessageQuery
from cn.edustar.jitar.data import Command
from cn.edustar.jitar.util import ParamUtil
from cn.edustar.jitar.pojos import Message

class message (ActionExecutor):
  # 定义要返回的页面常量.
  MESSAGE_OUTBOX_LIST = "/WEB-INF/ftl/message/msg_outbox_list.ftl"
  MESSAGE_TRASH_LIST = "/WEB-INF/ftl/message/msg_trash_list.ftl"
  MESSAGE_ADD = "/WEB-INF/ftl/message/msg_add.ftl"
  MESSAGE_REPLY = "/WEB-INF/ftl/message/msg_reply.ftl"
  
  def __init__(self):
    self.params = ParamUtil(request) 
    self.user_svc = __jitar__.userService               #用户服务.
    self.friend_svc = __spring__.getBean("friendService")   #好友服务.
    self.msg_svc = __spring__.getBean("messageService") #消息服务.
    # self.moduleContainer = __spring__.getBean("moduleContainer")  #模块容器服务
    return


  def dispatcher(self, cmd):
    if self.loginUser == None:
      return ActionResult.LOGIN
    if self.canVisitUser(self.loginUser) == False:
    if cmd == "" or cmd == None or cmd == "list" or cmd == "inbox" : #默认显示收件箱.
    elif cmd == "outbox" :        # 发件箱消息列表.
    if cmd == "write":            #写短消息.
      return self.write()         
    elif cmd == "send" or cmd == "save":           #发送短消息.
    elif cmd == "reply":          # 回复短消息.
      return self.senderdel()
      return self.getNew()
    elif cmd == "show":           #ajax处理,点击更新未读消息数目.
      return self.show()

 
  
  # 列出收件箱中的消息.
  def inbox(self):
    #query = self.createQuery()
    query.receiveId = self.loginUser.userId     # 接收者是自己.
    query.isDel = False         # 未删除的.
    pager = self.createPager()
    pager.totalRows = query.count()
    message_list = query.query_map(pager)
    request.setAttribute("pager", pager)
    request.setAttribute("message_list", message_list)
    request.setAttribute("type", "receive")
    
    totalRows = pager.totalRows  # self.getMessageTotalRows();
    unreadRows = self.getMessageUnreadRows();
    
    request.setAttribute("totalRows", totalRows)
    request.setAttribute("unreadRows", unreadRows)
    return self.MESSAGE_INBOX_LIST

  # 发件箱箱的消息.
    query = MessageQuery(""" msg.id, msg.receiveId, msg.title, msg.content, msg.sendTime, msg.isRead, 
    query.isSenderDel = False   # 没有被自己删除.
    pager = self.createPager()
    pager.totalRows = query.count()
    message_list = query.query_map(pager)
    request.setAttribute("pager", pager)
    request.setAttribute("message_list", message_list)

    return self.MESSAGE_OUTBOX_LIST
  
  # 回收站消息列表.
  def trash(self):
    query = MessageQuery(""" msg.id, msg.sendId, msg.title, msg.content, msg.sendTime, msg.isRead, 
    pager = self.createPager() 
    pager.totalRows = query.count()
    message_list = query.query_map(pager)
    request.setAttribute("pager", pager)
    request.setAttribute("message_list", message_list)
    return self.MESSAGE_TRASH_LIST
  
 
  # 写消息.
  def write(self):
    curLoginUserId = self.loginUser.userId
    # 得到登陆者的好友列表. 提供给发送短消息的好友(下拉框)列表.
    friend_list = self.friend_svc.getFriendList(curLoginUserId);
    request.setAttribute("friend_list", friend_list)
    return self.MESSAGE_ADD
  
  # 发送短消息
  def send(self):
    curLoginUserId = self.loginUser.userId
    redirect = self.params.getStringParam("redirect")
    strMessageReceiver = self.params.safeGetStringParam("messageReceiver")
    messageTitle = self.params.getStringParam("messageTitle")
    strMessageContent = self.params.safeGetStringParam("messageContent")
    
    if strMessageReceiver == "" or strMessageReceiver == None:
      self.addActionError(u"没有给出消息接收者.")
      return ActionResult.ERROR
    if messageTitle == "" or messageTitle == None:
      self.addActionError(u"消息标题不能为空.")
      return ActionResult.ERROR
    if strMessageContent == "" or strMessageContent == None:
      self.addActionError(u"消息内容不能未空.")
      return ActionResult.ERROR

    # 检查当前系统中是否存在将要被添加的用户.
    receiver = self.user_svc.getUserByLoginName(strMessageReceiver)

  
    #self.addActionLink返回
    
  # 删除发件箱的消息.
  def senderdel(self):
    ids = self.params.getIdList("messageId")
    if ids == None or ids.size() == 0: 
      self.addActionError(u"没有选择消息")
      return ActionResult.ERROR
    
    for msgId in ids:
      self.msg_svc.senderDelMessage(msg)    # 发消息者删除发件箱的消息.
       
    self.addActionMessage(u"操作成功")
    self.addActionLink(u"返回", "?cmd=outbox") #返回发件箱.
    return ActionResult.SUCCESS

  # 彻底删除短消息.
  def crash(self):
    ids = self.params.getIdList("messageId")
    
    if ids == None or ids.size() == 0:
      self.addActionError(u"没有选择消息")
      return ActionResult.ERROR
    
      msg = self.msg_svc.findById(msgId)
    
    self.addActionMessage(u"操作成功")
    self.addActionLink(u"返回", "?cmd=trash") #返回回收站.
    return ActionResult.SUCCESS
    
  # 回复.
  def reply(self):
    messageId = self.params.getIntParam("messageId")
    message = self.msg_svc.findById(messageId)
    user = self.user_svc.getUserById(message.getSendId())
    request.setAttribute("user", user)
    request.setAttribute("message", message)
    return self.MESSAGE_REPLY
  
  # 将消息删除至回收站.
  def delete(self):
    ids = self.params.getIdList("messageId")
    
    if ids == None or ids.size() == 0:
      self.addActionError(u"没有选择消息.")
      return ActionResult.ERROR

    for msgId in ids:
      msg = self.msg_svc.findById(msgId)
  # 恢复回收站中的消息.
  def recover(self):
    ids = self.params.getIdList("messageId")
    
    if ids == None or ids.size() == 0:
      self.addActionError(u"没有选择消息.")
      return ActionResult.ERROR
    
    for msgId in ids:
      msg = self.msg_svc.findById(msgId)
      
    self.addActionMessage(u"操作成功")
    self.addActionLink(u"返回", "?cmd=trash") # 返回到回收站.
    
    return ActionResult.SUCCESS 
    
  # 个人空间右下角有未读消息的提示.计算有多少条未读消息.
  def getNew(self):
    unreadRows = self.getMessageUnreadRows();
    if unreadRows > 0: 
      response.setHeader("X-JSON", xjson)
    return None
  
  # (ajax处理). 点击消息,动态更新未读消息数目.
  def show(self):
    unReadId = self.params.getIntParam("unreadId")

    self.msg_svc.setMessageIsRead(unReadId, self.loginUser.userId)
    
    totalRows = self.msg_svc.getTotalMessages(curLoginUserId)
    unreadRows = self.msg_svc.getUnreadMessages(curLoginUserId)
    
    response.writer.println(u"%d 条短消息, %d 条未读" % (totalRows, unreadRows))
    return None
  def createPager(self):