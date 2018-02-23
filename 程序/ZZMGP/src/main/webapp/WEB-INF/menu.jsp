<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 此jsp被其他所有网友所复用,因此无法确定当前用户正在访问的网页是谁,所以最好用绝对路径 -->
<head>
<script src="scripts/jquery-1.4.3.js"></script>
<script src="scripts/basevalue.js"></script>
<c:if test="${admin.power==0 }">
<script>
var inId;
var outId;
var visitor;
function f1(){
	var password = prompt("请输入密码:").trim();
	var ok = true;
	if(!password){
		alert("不能为空");
		ok=false;
	}
	if(ok){
		location.href = path + "/toAdmin.do?password="+password;
	}
}
function inNum(){
	$.ajax({
		url:path+"/findIn.do",
		dataType:"text",
		success:function(msg){
			if(msg==0)
				document.getElementById('in').style.display = "none";
			else{
				document.getElementById('in').style.display = "block";
				setInterval(function(){$("#in").toggleClass("applyin_off");},500);
				clearInterval(inId);
			}
		},
		error:function(){
			clearInterval(inId);
		}
	});
}
function outNum(){
	$.ajax({
		url:path+"/findOut.do",
		dataType:"text",
		success:function(msg){
			if(msg==0)
				document.getElementById('out').style.display = "none";
			else{
				document.getElementById('out').style.display = "block";
				setInterval(function(){$("#out").toggleClass("applyout_off");},500);
				clearInterval(outId);
			}
				
		},
		error:function(){
			clearInterval(outId);
		}
	});
}
function findVisitor(){
	$.ajax({
		url:path+"/findVisitor.do",
		dataType:"text",
		success:function(msg){
			if(msg != 0){
				setInterval(function(){$("#admin").toggleClass("admin_off");},500);
				clearInterval(visitor);
			}
		},
		error:function(){
			clearInterval(visitor);
		}
	});
}
$(function(){
	inId = setInterval(function(){inNum();},1000);
	outId = setInterval(function(){outNum();},1000);
	visitor = setInterval(function(){findVisitor();},1000);
});
</script>
</c:if>
</head>
<ul id="menu">
	<li><a href="${pageContext.request.contextPath }/web/index.do" class="index_off"></a></li>
	<c:if test="${admin.power==0 }">
		<li><a id="admin" href="javascript:f1();" class="admin_off"></a></li>
	</c:if>
	<li><a href="${pageContext.request.contextPath }/web/product.do" class="fee_off"></a></li>
	<li><a href="${pageContext.request.contextPath }/web/allocation.do" class="allocation_off"></a>
	<li><a href="${pageContext.request.contextPath }/web/toAddProduct.do" class="service_off"></a></li>
	<li><a href="${pageContext.request.contextPath }/web/toSubProduct.do" class="bill_off"></a></li>
	<li><a href="${pageContext.request.contextPath }/web/record.do" class="account_off"></a></li>
	<li><a href="${pageContext.request.contextPath }/web/toSetPwd.do" class="password_off"></a></li>
<c:if test="${admin.power==0 }">
	<li><a id="in" href="${pageContext.request.contextPath }/web/applyin.do"></a></li>
	<li><a id="out" href="${pageContext.request.contextPath }/web/applyout.do"></a></li>
</c:if>
</ul>