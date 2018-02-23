<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>申请入库</title>
<link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
<script src="scripts/jquery-1.4.3.js"></script>
<script src="scripts/basevalue.js"></script>
<script>
//页面跳转
function record(page){
	var href=path+"/applyin.do?page="+page;
	var admin_id = $("#admin_id").val().trim();
	if(admin_id && !isNaN(admin_id))
		href += "&admin_id="+Math.round(admin_id);
	var product_id = $("#product_id").val().trim();
	if(product_id && !isNaN(product_id))
		href += "&product_id="+Math.round(product_id);
	location.href=href;
}
function agree(btn) {
    var r = window.confirm("确定同意本次申请吗？");
    if(r){
    	var $btn = $(btn);
    	var id = $btn.parent().siblings().eq(0).html();
    	window.open(path+"/agreeApply.do?id="+id);
    }
}
function refuse(btn) {
    var r = window.confirm("确认取消?");
    if(r){
    	var $btn = $(btn);
    	var id = $btn.parent().siblings().eq(0).html();
    	$.ajax({
			url:path+"/refuseApply.do",
			data:{"id":id},
			type:"post",
			dataType:"text",
			success:function(msg){
				alert(msg);
				location.reload();
			},
			error:function(msg){
            	alert(msg);
			}
		});
    }
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
     	<div>产品id：<input type="text" id="product_id" class="text_search" placeholder="请确认产品id后输入" value="${where.product_id }" /></div>
         <div>管理员id：<input type="text" id="admin_id" placeholder="请确认管理员id后输入" value="${where.admin_id }" class="text_search" /></div>                            
         <div><input type="button" value="搜索" class="btn_search" onclick="record(1);" /></div>
     </div>
     <!--数据区域：用表格展示数据-->     
     <div id="data">
         <table id="datalist">
         <tr>
         	 <th>申请编号</th>
             <th>印品货号</th>
             <th>印品名称</th>
             <th>管理员编号</th>
             <th>管理员姓名</th>
             <th>订货商</th>
             <th>数量</th>
             <th>备注</th>
             <th>申请时间</th>
             <th></th>
         </tr>
         <c:forEach items="${applys }" var="r">
         	<tr>
         		<td>${r.id }</td>
         		<td>${r.product_id }</td>
         		<td>${r.product_name }</td>
         		<td>${r.admin_id }</td>
         		<td>${r.admin_name }</td>
         		<td>${r.people }</td>
				<td>${r.num }</td>
         		<td>${r.oname }</td>
         		<td><fmt:formatDate value="${r.enroll }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
         		<td><c:if test="${r.status==0 }">
         				<input type="button" value="同意" class="btn_start" onclick="agree(this);" />
         				<input type="button" value="取消" class="btn_delete" onclick="refuse(this);" />
         			</c:if>
         			<c:if test="${r.status==1 }">已同意</c:if>
         			<c:if test="${r.status==2 }">已取消</c:if>
         		</td>
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
