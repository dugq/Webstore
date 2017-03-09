<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/4
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/scripts.js"></script>
</head>
<body>

<jsp:include page="../common/head.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
</jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 js-sidebar"  style="background-color: #f2f2f2;padding: 0;">
            <div class="list-group"  style=";margin-top: 71px; ">
                <a href="/support/classify/list" class="list-group-item active">商品分类管理</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
            </div>
        </div>
        <div class="col-md-10"  style=";margin-top: 71px;">
            hello!
        </div>
    </div>
</div>
<script>
    $(function(){
        $(window).on('resize',function(){
            if( document.body.offsetHeight < document.documentElement.clientHeight){
                $('.js-sidebar').height(document.documentElement.clientHeight);
            }else{
                $('.js-sidebar').height(document.body.offsetHeight);
            }
        }).trigger("resize");
    })
</script>
</body>
</html>
