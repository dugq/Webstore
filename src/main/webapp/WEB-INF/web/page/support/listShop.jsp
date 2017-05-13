<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/4
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>店铺管理</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/template.js"></script>
</head>
<body>

<jsp:include page="../common/head.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
</jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 js-sidebar"  style="background-color: #f2f2f2;padding: 0;">
            <div class="list-group"  style=";margin-top: 71px; ">
                <a href="/support/index" class="list-group-item">首页</a>
                <a href="/support/classify/list" class="list-group-item">商品分类管理</a>
                <a href="javascript:;" class="list-group-item active">店铺管理</a>
                <a href="/support/personalManage/list" class="list-group-item">用户管理</a>
            </div>
        </div>
        <div class="col-md-10"  style=";margin-top: 71px;">
            <a href="${pageContext.request.contextPath}/support/shopManage/list" style="margin-left: 20px;">&lt; 返回</a>
            <ul class="nav nav-tabs js-list" style="margin-top: 10px;">
                <li class="active" data-target="a">
                    <a href="javascript:;">店铺信息</a>
                </li>
                <c:if test="${shop!=null && shop.status==3}">
                    <li data-target="b">
                        <a href="javascript:;">商品信息</a>
                    </li>
                </c:if>
            </ul>
            <div id="a">
                <div class="form-group">
                    <label for="exampleInputEmail1">
                        名称
                    </label>
                    <input type="text" class="form-control" name="name"
                           id="exampleInputEmail1" value="${shop.name}">
                </div>
                <div class="form-group">
                    <label for="description">
                        介绍
                    </label>
                    <input type="text" class="form-control" name="description" value="${shop.description}"  id="description">
                </div>
                <div class="form-group">
                    <input type="hidden" name="img-url" value="${shop.imgUrl}"/>
                    <label >
                        封面图
                    </label><br/>
                    <img src="${shop.imgUrl}" id="imgUrl">
                </div>
             </div>
            <div id="b" style="display: none;padding-top: 20px;">

            </div>
    </div>
</div>
    <script type="text/javascript">
        $(function(){
            $(window).on('resize',function(){
                if( document.body.offsetHeight < document.documentElement.clientHeight){
                    $('.js-sidebar').height(document.documentElement.clientHeight);
                }else{
                    $('.js-sidebar').height(document.body.offsetHeight);
                }
            }).trigger("resize");



            $(".js-list>li").on("click",function(){
                if($(this).data("target")=="a"){
                    $("#a").show();
                    $("#b").hide();
                }else  if($(this).data("target")=="b"){
                    $("#b").children().length || $("#b").load("/support/shopManage/showCommdity",{pageIndex:1,shopId:'${shop.id}'});
                    $("#b").show();
                    $("#a").hide();
                }
                $(".js-list>li").removeClass("active");
                $(this).addClass("active");
            });


        });
    </script>
</body>
</html>
