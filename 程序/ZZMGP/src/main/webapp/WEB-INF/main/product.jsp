<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>印品管理</title>
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global_color.css" />
<script src="scripts/jquery-1.4.3.js"></script>
<script src="scripts/basevalue.js"></script>
<script type="text/javascript">
	function product(page){
		var href=path+"/product.do?page="+page;
		var kind = $("#selModules").val();
    	if(kind)
    		href += "&kind="+kind;
		var name = $("#name").val().trim();
		if(name)
			href += "&name="+name;
		var norm = $("#norm").val().trim();
		if(norm)
			href += "&norm="+norm;
		var reg=/^\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/;
		var begin = $("#begin").val().trim();
		if(reg.test(begin))
			href += "&begin="+begin;
		var end = $("#end").val().trim();
		if(reg.test(end))
			href += "&end="+end;
		location.href=href;
	}
	 //显示角色详细信息
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
					排序方式：
                        <select id="selModules" class="select_search" name="module" onchange="product(1);">
                            <option value="">选择</option>
                            <option value="2" <c:if test="${where.kind==2 }">selected</c:if>>订货商</option>
                            <option value="3" <c:if test="${where.kind==3 }">selected</c:if>>时间</option>
                        </select>
				</div>
				 <div>名称：<input type="text" placeholder="输入关键字" value="${where.name }" class="text_search width70" id="name"/></div>
				 <div>规格：<input type="text" placeholder="输入关键字" value="${where.norm }" class="text_search width70" id="norm"/></div>
				 <div>
				 	创建时间: <input type="text" placeholder="yyyy-MM-dd" value="${where.begin }" class="text_search width80" id="begin"/>——<input type="text" value="${where.end }" class="text_search width80" id="end"/>
				 </div>
                 <div><input type="button" value="搜索" class="btn_search" onclick="product(1);" /></div>
			</div>
			<!--数据区域：用表格展示数据-->
			<div id="data">
				<table id="datalist">
					<tr>
						<th class="width80">印品ID</th>
						<th class="width150">名称</th>
						<th class="width50">种类</th>
						<th class="width150">订货商</th>
						<th class="width150">创建时间</th>
						<th class="width100">库存数量</th>
						<th>规格</th>
					</tr>
					<c:forEach items="${products }" var="p">
						<tr>
							<td>${p.id }</td>
							<td>${p.name }</td>
							<td>
								<c:choose>
             						<c:when test="${p.kind==0 }">教科书</c:when>
             						<c:when test="${p.kind==1 }">杂志</c:when>
             						<c:when test="${p.kind==2 }">小说</c:when>
             						<c:when test="${p.kind==3 }">期刊</c:when>
             						<c:otherwise>其他</c:otherwise>
             					</c:choose>
             				</td>
							<td>${p.people }</td>
							<td><fmt:formatDate value="${p.enroll }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
							<td>
								<a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${p.allNum }</a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
                                    ${p.allocations }
                                </div>
							</td>
							<td>${p.norm }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!--分页-->
			<div id="pages">
				<c:if test="${page==1 }"><a href="">上一页</a></c:if>
                <c:if test="${page!=1 }"><a href="javascript:product(${page-1 });">上一页</a></c:if>
				<c:forEach begin="1" end="${total }" var="i">
					<c:if test="${i==page }">
                 	 	<a href="javascript:product(${i });" class="current_page">${i }</a>
                 	</c:if>
                 	<c:if test="${i!=page }">
                   		<a href="javascript:product(${i });">${i }</a>
                   	</c:if>
				</c:forEach>
				<c:if test="${page==total }"><a href="">下一页</a></c:if>
                <c:if test="${page!=total }"><a href="javascript:product(${page+1 });">下一页</a></c:if>
			</div>
	</div>
	<!--主要区域结束-->
	<div id="footer">
		<c:import url="../footer.jsp"></c:import>
	</div>
</body>
</html>