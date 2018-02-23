<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8" />
<title>修改密码</title>
<link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />  
<script src="scripts/basevalue.js"></script>
<script src="scripts/jquery-1.4.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#save").click(function(){
		var oldPwd=$(":password:first").val().trim();
		var newPwd1=$(":password:eq(1)").val().trim();
		var newPwd2=$(":password:last").val().trim();
		var name = $(":text:first").val().trim();
		var ok=true;
		if(!oldPwd || !newPwd1 || !newPwd2 || !name){
			alert("请勿输入非空值");
			ok=false;
		}
		if(ok && newPwd1 != newPwd2){
			alert("密码不一致");
			ok=false;
		}
		if(ok){
			$.ajax({
				url:path+"/setPwd.do",
				type:"post",
				data:{"name":name,"oldPwd":oldPwd,"newPwd":newPwd1},
				dataType:"text",
				success:function(result){
					alert(result+",请重新登录");
					location.href=path+"/toLogin.do";
				},
				error:function(){
					alert("修改失败");
				}
			});
		}
	});
});
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
    <div id="main">     
    		<div class="text_info clearfix"><span>姓名：</span></div>
            <div class="input_info">
                <input type="text" class="width200" value="${admin.name }"  /><span class="required">*</span>
                <div class="validate_msg_medium">请输入真实姓名</div>
            </div> 
            <div class="text_info clearfix"><span>旧密码：</span></div>
            <div class="input_info">
                <input type="password" class="width200"  /><span class="required">*</span>
                <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
            </div>
            <div class="text_info clearfix"><span>新密码：</span></div>
            <div class="input_info">
                <input type="password"  class="width200" /><span class="required">*</span>
                <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
            </div>
            <div class="text_info clearfix"><span>重复新密码：</span></div>
            <div class="input_info">
                <input type="password" class="width200"  /><span class="required">*</span>
            </div>
            <div class="button_info clearfix">
                <input id="save" type="button" value="保存" class="btn_save" />
                <input id="cancel" type="button" value="取消" class="btn_save" onclick="history.back();" />
            </div>
    </div>
    <!--主要区域结束-->
    <div id="footer">
        <c:import url="../footer.jsp"></c:import>
    </div>
</body>
</html>
