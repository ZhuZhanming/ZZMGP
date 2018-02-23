<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>操作记录</title>
<link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
<script src="scripts/jquery-1.4.3.js"></script>
<script src="scripts/basevalue.js"></script>
<script>
//页面跳转
function record(page){
	var href=path+"/record.do?page="+page;
	var kind = $("#kind").val();
	if(kind)
		href += "&kind="+kind;
	var admin_id = $("#admin_id").val().trim();
	if(admin_id && !isNaN(admin_id))
		href += "&admin_id="+Math.round(admin_id);
	var product_id = $("#product_id").val().trim();
	if(product_id && !isNaN(product_id))
		href += "&product_id="+Math.round(product_id);
	location.href=href;
}
function showDetail(flag, a) {
    var detailDiv = a.parentNode.getElementsByTagName("div")[0];
    if (flag) {
        detailDiv.style.display = "block";
    }
    else
        detailDiv.style.display = "none";
}
</script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
	<%@include file="../logo.jsp" %>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
	<c:import url="../menu.jsp"></c:import>           
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
        <!--查询-->
     <div class="search_add">    
     	  <div>
             类型：
             <select class="select_search" id="kind" onchange="record(1);">
                 <option value="">全部</option>
                 <option <c:if test="${where.kind==0 }">selected</c:if> value="0">入库</option>
                 <option <c:if test="${where.kind==1 }">selected</c:if> value="1">出库</option>
                 <option <c:if test="${where.kind==2 }">selected</c:if> value="2">申请入库</option>
                 <option <c:if test="${where.kind==3 }">selected</c:if> value="3">申请出库</option>
             </select>
         </div>                    
         <div>管理员id：<input type="text" id="admin_id" placeholder="输入管理员id" value="${where.admin_id }" class="text_search width100" /></div>                            
         <div>产品id：<input type="text" id="product_id" class="text_search width100" placeholder="输入印品id" value="${where.product_id }" /></div>
         <div><input type="button" value="搜索" class="btn_search" onclick="record(1);" /></div>
     </div>  
     <!--数据区域：用表格展示数据-->     
     <div id="data">
         <table id="datalist">
         <tr>
             <th>类型</th>
             <th>印品id</th>
             <th>印品名称</th>
             <th>管理员id</th>
             <th>管理员姓名</th>
             <th>订货商</th>
             <th>数量</th>
             <th>备注</th>
             <th class="width200">操作时间</th>
         </tr>
         <c:forEach items="${records }" var="r">
         	<tr>
         		<td>
         			<c:if test="${r.kind==0 }">入库</c:if>
         			<c:if test="${r.kind==1 }">出库</c:if>
         			<c:if test="${r.kind==2 }">申请入库</c:if>
         			<c:if test="${r.kind==3 }">申请出库</c:if>
         		</td>
         		<td>${r.product_id }</td>
         		<td>${r.product_name }</td>
         		<td>${r.admin_id }</td>
         		<td>${r.admin_name }</td>
         		<td>${r.people }</td>
         		<td>
         			<a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${r.num }</a>
                    <!--浮动的详细信息-->
                    <div class="detail_info">
                        ${r.info }
                    </div>
         		</td>
         		<td>${r.oname }</td>
         		<td><fmt:formatDate value="${r.enroll }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
         	</tr>
         </c:forEach>             
     </table>
     </div>                   
     <!--分页-->
     <div id="pages">
        <c:if test="${total!=1 }">
	   		<c:choose>
	   			<c:when test="${page==1 }"><a href="">上一页</a></c:when>
	   			<c:otherwise><a href="javascript:record(${page-1 });">上一页</a></c:otherwise>
	   		</c:choose>
		<c:forEach begin="1" end="${total }" var="i">
			<c:if test="${i==page }">
               	<a href="javascript:record(${i });" class="current_page">${i }</a>
            </c:if>
            <c:if test="${i!=page }">
                <a href="javascript:record(${i });">${i }</a>
            </c:if>
		</c:forEach>
		<c:choose>
     		<c:when test="${page==total }"><a href="">下一页</a></c:when>
     		<c:otherwise><a href="javascript:record(${page+1 });">下一页</a></c:otherwise>
        </c:choose>
        </c:if>
	</div>                    
</div>
<!--主要区域结束-->
<div id="footer">
    <c:import url="../footer.jsp"></c:import>
</div>
</body>
</html>
