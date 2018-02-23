<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>仓库查询</title>
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global_color.css" />
<script src="scripts/jquery-1.4.3.js"></script>
<script src="scripts/basevalue.js"></script>
<script type="text/javascript">
var area_id;
var frame_id;
function allocation(page){
	var href=path+"/allocation.do?page="+page;
	if(area_id){
   		href += "&area_id="+area_id;
   		if(frame_id)
   	   		href += "&frame_id="+frame_id;
	}
	location.href=href;
}
function areaChange(){
	area_id = $("#area_id").val();
	frame_id="";
	allocation(1);
}
function frameChange(){
	area_id = $("#area_id").val();
	frame_id = $("#frame_id").val();
	allocation(1);
}
function pageChange(page){
	area_id = $("#area_id").val();
	frame_id = $("#frame_id").val();
	allocation(page);
}
</script>
</head>
<body>
	<!--Logo区域开始-->
	<div id="header">
		<c:import url="../logo.jsp"></c:import>
	</div>
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<div id="navi">
		<c:import url="../menu.jsp" />
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
			<!--排序-->
			<div class="search_add">
				<div>
					货区：
                   <select id="area_id" class="select_search" onchange="areaChange();">
                       <option value="">选择</option>
                       <c:forEach items="${areas }" var="area" >
                       	<option value="${area.area_id }" <c:if test="${area.area_id==where.area_id }">selected</c:if>>${area.area_name }</option>
                       </c:forEach>
                   </select>
				</div>
				<div>
					货架：
					<select id="frame_id" class="select_search" onchange="frameChange();">
						<option value="">选择</option>
						<c:forEach items="${frames }" var="frame">
							<option value="${frame.frame_id }" <c:if test="${frame.frame_id==where.frame_id }">selected</c:if> >${frame.frame_name }</option>
						</c:forEach>
					</select>
				</div>
				<div>已有/剩余：${allNum }/${allRemainder }</div>
			</div>
			<!--数据区域：用表格展示数据-->
			<div id="data">
				<table id="datalist">
					<tr>
						<th>货位</th>
						<th>货物号</th>
						<th>货物名称</th>
						<th>货物库存</th>
						<th>剩余库存</th>
					</tr>
					<c:forEach items="${allocations }" var="a">
						<tr>
							<td>${a.allocation_name }</td>
							<td>${a.product_id }</td>
							<td>${a.product_name }</td>
							<td>${a.num }</td>
							<td>${a.remainder }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!--分页-->
			<div id="pages">
				<c:if test="${page==1 }"><a href="">上一页</a></c:if>
                <c:if test="${page!=1 }"><a href="javascript:pageChange(${page-1 });">上一页</a></c:if>
				<c:forEach begin="1" end="${total }" var="i">
					<c:if test="${i==page }">
                 	 	<a href="javascript:pageChange(${i });" class="current_page">${i }</a>
                 	</c:if>
                 	<c:if test="${i!=page }">
                   		<a href="javascript:pageChange(${i });">${i }</a>
                   	</c:if>
				</c:forEach>
				<c:if test="${page==total }"><a href="">下一页</a></c:if>
                <c:if test="${page!=total }"><a href="javascript:pageChange(${page+1 });">下一页</a></c:if>
			</div>
	</div>
	<!--主要区域结束-->
	<div id="footer">
		<c:import url="../footer.jsp"></c:import>
	</div>
</body>
</html>