<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>入库管理</title>
<link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />
<script src="scripts/basevalue.js"></script>
<script src="scripts/jquery-1.4.3.js"></script>
<script>
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
						$("#name").val(data.name+"    现有库存:"+data.num).attr("readonly","readonly");
						$("#people").val(data.people).attr("readonly","readonly");
						$("#norm").val(data.norm).attr("readonly","readonly");
						$("#kind").val(data.kind).attr("disabled","disabled");
					}else{
						alert(result.message);
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
function addProduct(){
	var id = $("#id").val().trim();
	var name = $("#name").val().trim();
	var kind = $("#kind").val().trim();
	var oname = $("#oname").val().trim();
	var people = $("#people").val().trim();
	var num = $("#num").val().trim();
	var norm = $("#norm").val().trim();
	var ok = true;
	if(!name || !people || !kind || !oname || !num || isNaN(num) || !norm)
		ok = false;
	if(ok){
		num = Math.round(Math.abs(num));
		var url =path + "/addProduct.do?id="+id+"&name="+name+"&oname="+oname+"&kind="+kind+"&people="+people+"&num="+num+"&norm="+norm;
		window.open(url);
		location.href = path+"/product.do";
	}else{
		alert('输入不合法!');
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
              <input id="id" type="text" class="width100" placeholder="新产品不用填写"/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	   数量： <input id="num" type="text" class="width100" />
              <span class="required">*</span>
          <div class="validate_msg_short"></div>
       </div>
       
       
       <div class="text_info clearfix"><span>备注：</span></div>
       <div class="input_info_high">
           <textarea id="oname" class="width300 height70"></textarea>
       </div>   
       
       <div class="text_info clearfix"><span>名称：</span></div>
       <div class="input_info">
          <input id="name" type="text" class="width300" placeholder="输入印品名称"/>
       </div>

       
       <div class="text_info clearfix"><span>订货商：</span></div>
       <div class="input_info">
           <input id="people" type="text" class="width150" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型:
          	<select id="kind" class="select_search">
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
           <textarea id="norm" class="width300 height70">${product.norm }</textarea>
       </div>                    
       <div class="button_info clearfix">
           <input type="button" value="入库" class="btn_save" onclick="addProduct();" />
           <input type="button" value="取消" class="btn_save" onclick="history.back();" />
       </div>
    </div>
    <!--主要区域结束-->
    <div id="footer">
        <c:import url="../footer.jsp"></c:import>
    </div>
</body>
</html>
