<#if unit_list??><#list unit_list as u>${u.unitPath}__${u.unitTitle?js_string}<#if u_has_next>||</#if></#list></#if>