<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global_color.css" />
<title>打印界面</title>
<script type="text/javascript">
function preview()    
{    
   bdhtml=window.document.body.innerHTML;    
   sprnstr="<!--startprint-->";
   eprnstr="<!--endprint-->";
   prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+17);
   prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
   window.document.body.innerHTML=prnhtml;
   window.print();
}  
</script>
</head>
<body>
	<div class="login_box" style="overflow-y:scroll; ">
	<input type="button" style="margin-left: 80px;" value="打印" class="btn_save" onclick="preview();" />
	<!--startprint-->
	&nbsp;&nbsp;<h1><b>印品仓库管理系统</b></h1>
	<h2>
		******
		<c:if test="${record.kind==0 }">入库单</c:if>
        <c:if test="${record.kind==1 }">出库单</c:if>
        ******
	</h2>
	<p>操作编号:${record.id }</p>
	<p>时间:<fmt:formatDate value="${record.enroll }" pattern="yyyy/MM/dd HH:mm:ss" /></p>
	<p>操作人编号:${record.admin_id }</p>
	<p>操作人:${record.admin_name }</p>
	<p>产品编号:${record.product_id }</p>
	<p>产品名称:${record.product_name }</p>
	<p>订货商:${record.people }</p>
	<p>=====================</p>
	<p>货位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</p>
	<c:forEach items="${alls }" var="all">
		<p>${all }</p>
	</c:forEach>
	<br>
	<p>合计&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${record.num }</p>
	<p>=====================</p>
	<p>备注:${record.oname }</p>
	<h2>签字:</h2>
	<!--endprint-->
	</div>
</body>
</html>