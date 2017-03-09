<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/4
  Time: 14:27
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

    <title>搜索</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/style.css" rel="stylesheet">
    <style>
        a:link { text-decoration: none;color: #bce8f1;}
        a:hover{text-decoration: none;color: #ebccd1;}
        sortActive{color: #ebccd1;}
    </style>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/squirrel.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/template.js"></script>
</head>
<body>
<div id="top"></div>
<jsp:include page="../common/head.jsp"></jsp:include>
<div class="container-fluid"  style="margin-top: 71px;">
    <div class="row">
        <div class="col-md-12">
            <div  class="row">
                <div class="col-md-2"></div>
                <div class="input-group col-md-8" style="margin-bottom:10px;">
                    <input type="text" class="form-control js-search-text" aria-label="Text input with multiple buttons"                                               placeholder="Search">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default js-search" >搜索</button>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>

            <div class="row" style="margin-top:23px;">
                <div class="col-md-10">
                    <div class="row" style="padding: 20px;">
                        <div class="panel panel-info">
                            <div class="panel-heading">所有分类&gt;</div>
                            <div class="panel-body" style="border-bottom: #ddd solid 1px;">
                                分类：
                                <button type="button" class="btn btn-default js-class btn-info" data-value="">全部</button>
                                <c:forEach items="${classesList}" var="item" >
                                  <button type="button" class="btn btn-default js-class" data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                </c:forEach>
                            </div>
                            <div class="panel-body"  style="border-bottom: #ddd solid 1px;">
                                店铺：
                                <button type="button" class="btn btn-default js-shop btn-info"  data-value="">全部</button>
                                <c:forEach items="${shopsList}" var="item" >
                                    <button type="button" class="btn btn-default js-shop"  data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                </c:forEach>
                            </div>
                            <div class="panel-body">
                                排序：<a href="javascript:;" class="js-sort sortActive" data-value="0">价格排序
                                <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
                            </a>
                                <a class="js-sort" href="javascript:;" data-value="3">销量排序
                                    <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row js-search-page">
                    </div>
                    <div class="alert alert-info center-block js-no-more" role="alert" style="display: none;">
                        <strong class="center-block text-center">已经到底啦!</strong>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="bs-example bs-example-type" data-example-id="small-headings" >
                        <h4 style="color:red;">hot:</h4>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<a class="navbar-fixed-bottom" style="bottom: 50px; left: 90%;font-size:25px;color: #FF905B" href="#top">
    <span class="glyphicon glyphicon-circle-arrow-up" style="display: block;" aria-hidden="true"></span>
    <span style="font-size: 12px; display: block;">顶部</span>
</a>
<script id="shop" type="text/html">
    <div class="col-md-3">
        <div class="thumbnail">
            <img alt="Bootstrap Thumbnail Third" onerror="this.src='/static/image/hot-fuzz.jpg'" src=" {{imgUrl}}" style="height: 170px;" />
            <div class="caption" style="border-top: #ddd solid 1px;">
                <h4 style="height: 19px;overflow: hidden;">
                    {{name}}
                    <h6 style="text-align: right;">￥{{price}}</h6>
                </h4>
                <p>
                    <span class="glyphicon glyphicon-hand-right" style="color: #a6e1ec;" aria-hidden="true"></span> &nbsp;{{description}}
                </p>
                <p>
                    <a class="btn btn-primary" href="#">查看</a> <a class="btn" href="#">购买</a>
                </p>
            </div>
        </div>
    </div>
</script>
<script>
    $(function(){
        var pageIndex=1;
        var loadPage = function(name,classId,shopsId,sortType){
            pageIndex=2;
            $(".js-search-page").load("/webstore/searchPage",{
                name:$(".js-search-text").val() || "",
                classId:$(".js-class.btn-info").data("value") || "",
                shopId:$(".js-shop.btn-info").data("value") || "",
                sortType:$(".js-sort.sortActive").attr("data-value")
            });
        };
        loadPage();

        $(".js-class").on("click",function(){
            if(!$(this).hasClass("btn-info")){
                $(".js-class").removeClass("btn-info");
                $(this).addClass("btn-info");
                loadPage();
            }
        });

        $(".js-shop").on("click",function(){
            if(!$(this).hasClass("btn-info")){
                $(".js-shop").removeClass("btn-info");
                $(this).addClass("btn-info");
                loadPage();
            }
        });

        $(".js-sort").on("click",function(){
                    if(!$(this).hasClass("sortActive")){
                        $(".js-sort").removeClass("sortActive");
                        $(this).addClass("sortActive");
                        loadPage();
                    }else{
                        if($(this).find("span").hasClass("glyphicon-chevron-up")){
                            $(this).attr("data-value",parseInt($(this).attr("data-value"))+1);
                            $(this).find("span").removeClass("glyphicon-chevron-up");
                            $(this).find("span").addClass("glyphicon-chevron-down");
                        }else{
                            $(this).attr("data-value",parseInt($(this).attr("data-value"))-1);
                            $(this).find("span").removeClass("glyphicon-chevron-down");
                            $(this).find("span").addClass("glyphicon-chevron-up");
                        }
                        loadPage();
                    }
                });

        $(window).on("scroll", function () {
            if(getDocumentTop()+getWindowHeight()>=getScrollHeight()){
                $.ajax({
                    url:"searchMorePage",
                    data:{
                        name:$(".js-search-text").val() || "",
                        classId:$(".js-class.btn-info").attr("data-value") || "",
                        shopId:$(".js-shop.btn-info").attr("data-value") || "",
                        sortType:$(".js-sort.sortActive").attr("data-value"),
                        pageIndex:pageIndex++
                    },
                    type:"post",
                    dataType:"json",
                    success:function(respose){
                        if(respose.list && respose.list.length){
                            for(var i = 0 ; i < respose.list.length;i++){
                                console.log(respose.list[i]);
                                $(".js-search-page").append(template("shop",respose.list[i]));
                            }
                        }else{
                            $(".js-no-more").show();
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
