<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>出库管理</title>
<link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />
<script src="scripts/basevalue.js"></script>
<script src="scripts/jquery-1.4.3.js"></script>
<script>
var flag = false;
$(function(){
	$("#id").blur(function(){
		var id=$("#id").val().trim();
		if(!isNaN(id) && id){
			$.ajax({
				url:path+"/checkProductId.do",
				type:"post",
				data:{"id":id},
				dataType:"json",
				success:function(result){
					if(result.state==0){
						var data = result.data;
						$("#name").val(data.name);
						$("#kind").val(data.kind);
						$("#people").val(data.people);
						$("#norm").val(data.norm);
						$("#allNum").val(data.num);
						flag = true;
					}else{
						alert(result.message);
						flag = false;
					}
				},
				error:function(){
					alert("产品不存在");
					location.reload();
				}
			});
		}else if (id) {
			alert("格式错误");
			location.reload();
		}else{
			location.reload();
		}
	});
});

function subProduct(){
	var id = $("#id").val().trim();
	var oname = $("#oname").val().trim();
	var num = $("#num").val().trim();
	var allNum = $("#allNum").val().trim();
	if(!oname)
		flag = false;
	if(!num )
		flag = false;
	if(isNaN(num))
		flag = false;
	if(num<0)
		flag = false;
	if(allNum-num<0)
		flag = false;
	if(flag){
		num = Math.round(Math.abs(num));
		var url =path + "/subProduct.do?id="+id+"&oname="+oname+"&num="+num;
		window.open(url);
	}else{
		alert('输入不合法!');
		location.reload();
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
        <%@include file="../menu.jsp" %>
    </div>
    <!--导航区域结束-->
    <!--主要区域开始-->
    <div id="main">
       <div class="text_info clearfix"><span>印品id：</span></div>
       <div class="input_info">
              <input id="id" type="text" class="width100"/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	   数量： <input id="num" type="text" class="width100" />
              <span class="required">*</span>
       </div>
       
       <div class="text_info clearfix"><span>备注：</span></div>
       <div class="input_info_high">
           <textarea id="oname" class="width300 height70"></textarea>
       </div> 
       
       <div class="text_info clearfix"><span>名称：</span></div>
       <div class="input_info">
          <input id="name" type="text" class="width150" readonly="readonly"/>
          &nbsp;&nbsp; <span>库存:</span>
          <input id="allNum" type="text" class="width100" readonly="readonly"/>
       </div>
       
       <div class="text_info clearfix"><span>订货商：</span></div>
       <div class="input_info">
           <input id="people" type="text" class="width100" readonly="readonly" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型:
          	<select id="kind" class="select_search" disabled="disabled">
	          	<option value="">选择类型</option>
	            <option value="0">教科书</option>
	            <option value="1">杂志</option>
	            <option value="2">小说</option>
	            <option value="3">期刊</option>
	            <option value="4">其他</option>
         	 </select>
       </div> 
            
       <div class="text_info clearfix"><span>规格说明：</span></div>
       <div class="input_info_high">
           <textarea id="norm" class="width300 height70" readonly="readonly"></textarea>
       </div>                   
       <div class="button_info clearfix">
           <input type="button" value="出库" class="btn_save" onclick="subProduct();" />
           <input type="button" value="取消" class="btn_save" onclick="history.back();" />
       </div>
    </div>
    <!--主要区域结束-->
    <div id="footer">
        <c:import url="../footer.jsp"></c:import>
    </div>
</body>
</html>
