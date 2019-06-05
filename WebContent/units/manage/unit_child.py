from unit_page import UnitBasePage
from base_action import SubjectMixiner

class unit_child(UnitBasePage, SubjectMixiner):
    def __init__(self):
        UnitBasePage.__init__(self)
        
    def execute(self):
        if self.loginUser == None:
            return self.LOGIN        
        self.unit = self.getUnit()
        if self.unit == None:
            self.addActionError(u"您所访问的机构不存在！")
            return self.ERROR        
        if self.isUnitAdmin() == False:
            self.addActionError(u"你没有管理的权限。")
            return self.ERROR
        
        cmd = self.params.safeGetStringParam("cmd")
        childUnitId = self.params.safeGetIntParam("childUnitId")
        if cmd == "delete" and childUnitId > 0:
            childUnit = self.unitService.getUnitById(childUnitId)
            if childUnit != None:
                if childUnit.hasChild:
                    self.addActionError(u"请先删除下级机构。。")
                    return self.ERROR
                deleteComplexObjectService = __spring__.getBean("deleteComplexObjectService")
                deleteComplexObjectService.deleteUnit(childUnit)
                
                # 更新父单位 HasChild 属性
                childUnitList = self.unitService.getAllUnitOrChildUnitList(self.unit)
                if len(childUnitList) == 0 :
                    self.unit.setHasChild(False)
                    self.unitService.saveOrUpdateUnit(self.unit)
        
        configUnitLevel = self.unitService.getConfigUnitLevel()
        if self.unit.unitPathInfo == None or self.unit.unitPathInfo == "":
            self.addActionError(u"当前机构没有 unitPathInfo 属性 。")
            return self.ERROR
        
        # 等于0为不限制
        if configUnitLevel > 0:
            # 当前单位的级数
            unitLevel = len(self.unit.unitPathInfo.split("/")) - 3
            if unitLevel >= configUnitLevel:
                self.addActionError(u"根据许可证的配置信息，当前机构不允许再创建下级机构了。")
                return self.ERROR
        
        childunitlist = self.unitService.getAllUnitOrChildUnitList(self.unit)
        request.setAttribute("unit", self.unit)
        request.setAttribute("childunitlist", childunitlist)
        return "/WEB-INF/unitsmanage/unit_child.ftl"
