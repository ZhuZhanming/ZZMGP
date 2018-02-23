<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>管理员</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
		<script src="scripts/jquery-1.4.3.js"></script>
		<script src="scripts/basevalue.js"></script>
        <script>
        	//页面跳转
            function admin(page){
            	var href=path+"/admin.do?page="+page;
            	var power = $("#selModules").val();
            	if(power)
            		href += "&power="+power;
            	var name = $("#name").val();
            	if(name)
            		href += "&name="+name;
            	location.href=href;
            }
        	//改权限
            function modifyPower(slt){
            	var $slt = $(slt);
            	var val = $slt.val();
            	if(val!=0){
	            	var code = $slt.parent().siblings().eq(2).html();
            		$.ajax({
            			url:path+"/modifyPower.do",
            			data:{"code":code,"power":val},
            			type:"post",
            			dataType:"text",
            			success:function(msg){
            				alert(msg);
            				admin(${page});
            			},
            			error:function(msg){
            				alert(msg);
            			}
            		});
            	}
            }
            //删除
            function deleteAdmin(btn) {
                var r = window.confirm("确定要删除此管理员吗？");
                if(r){
                	var $btn = $(btn);
                	var code = $btn.parent().siblings().eq(2).html();
                	$.ajax({
            			url:path+"/deleteAdmin.do",
            			data:{"code":code},
            			type:"post",
            			dataType:"text",
            			success:function(msg){
            				alert(msg);
            				admin(${page});
            			},
            			error:function(){
		                	document.getElementById("operate_result_info").style.display = "block";
            			}
            		});
                }
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
            <c:import url="../menu.jsp"></c:import>          
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
                <!--查询-->
                <div class="search_add">
                    <div>
                     	  权限：
                        <select id="selModules" class="select_search" onchange="admin(1);">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${where.power==1 }">selected</c:if> >入库管理部</option>
                            <option value="2" <c:if test="${where.power==2 }">selected</c:if> >出库管理部</option>
                            <option value="3" <c:if test="${where.power==3 }">selected</c:if> >普通游客</option>
                        </select>
                    </div>
                    <div>姓名：<input type="text" placeholder="关键字搜索" value="${where.name }" class="text_search width100" id="name"/></div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="admin(1);" /></div>
                </div>
                <!--删除和密码重置的操作提示-->
                <div id="operate_result_info" class="operate_fail">
                    <img src="images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span>删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>账号</th>
                            <th>密码</th>
                            <th>注册时间</th>
                            <th>拥有权限</th>
                            <th  class="width200"></th>
                        </tr>
                        <c:forEach items="${admins }" var="admin">
                        	<c:if test="${admin.power==3 }"><tr style="background-color: #F00"></c:if>
                        	<c:if test="${admin.power!=3 }"><tr></c:if>
                        		<td>${admin.id }</td>
                        		<td>${admin.name }</td>
                        		<td>${admin.code }</td>
                        		<td>${admin.password }</td>
                        		<td><fmt:formatDate value="${admin.enroll }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                        		<td>
	                        		<c:choose>
	                        			<c:when test="${admin.power==1 }">入库管理部</c:when>
	                        			<c:when test="${admin.power==2 }">出库管理部</c:when>
	                        			<c:when test="${admin.power==3 }">普通游客</c:when>
	                        			<c:when test="${admin.power==0 }">超级管理员</c:when>
	                        		</c:choose>
                        		</td>
                        		<td class="td_modi">
                               	 <select onchange="modifyPower(this);">
                               	 	<option value="0">权限修改</option>
                               	 	<option value="1">入库管理部</option>
                               	 	<option value="2">出库管理部</option>
                               	 	<option value="3">普通游客</option>
                               	 </select>
                               	 <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin(this);" />
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
             			<c:otherwise><a href="javascript:admin(${page-1 });">上一页</a></c:otherwise>
             		</c:choose>
				<c:forEach begin="1" end="${total }" var="i">
					<c:if test="${i==page }">
                 	 	<a href="javascript:admin(${i });" class="current_page">${i }</a>
                 	</c:if>
                 	<c:if test="${i!=page }">
                   		<a href="javascript:admin(${i });">${i }</a>
                   	</c:if>
				</c:forEach>
				<c:choose>
             			<c:when test="${page==total }"><a href="">下一页</a></c:when>
             			<c:otherwise><a href="javascript:admin(${page+1 });">下一页</a></c:otherwise>
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
