<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <title>资源管理</title>
 </head>
 <body>
  <h2>资源管理</h2>  
  <ul>
    <li><a href='?cmd=list' target='main'>所有资源列表</a></li>
  </ul>
  
  <div>
  <#list res_cate.all as category>
    <div>${category.treeFlag} <a href='?cmd=list' target='main'>${category.name}</a></div>
  </#list>
  </div>
  
  <a href='#'>增加下级节点</a>
  <a href='#'>删除</a>
  <a href='#'>修改</a>
  
 </body>
</html>
