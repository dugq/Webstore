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
                    <input type="text" class="form-control js-search-text" aria-label="Text input with multiple buttons"                                               placeholder="Search" value="${name}"/>
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
                                <c:if test="${classId==null}">
                                    <button type="button" class="btn btn-default js-class btn-info" data-value="">全部</button>
                                    <c:forEach items="${classesList}" var="item" >
                                      <button type="button" class="btn btn-default js-class" data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${classId!=null}">
                                    <button type="button" class="btn btn-default js-class" data-value="">全部</button>
                                    <c:forEach items="${classesList}" var="item">
                                        <c:if test="${classId==item.id}">
                                            <button type="button" class="btn btn-default js-class btn-info" data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                        </c:if>
                                        <c:if test="${classId!=item.id}">
                                            <button type="button" class="btn btn-default js-class" data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div class="panel-body"  style="border-bottom: #ddd solid 1px;">
                                店铺：
                                <c:if test="${shopId==null}">
                                    <button type="button" class="btn btn-default js-shop btn-info"  data-value="">全部</button>
                                <c:forEach items="${shopsList}" var="item" >
                                    <button type="button" class="btn btn-default js-shop"  data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                </c:forEach>
                                </c:if>
                                <c:if test="${shopId!=null}">
                                    <button type="button" class="btn btn-default js-shop"  data-value="">全部</button>
                                    <c:forEach items="${shopsList}" var="item" >
                                        <c:if test="${shopId==item.id}">
                                            <button type="button" class="btn btn-default js-shop btn-info"  data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                        </c:if>
                                        <c:if test="${shopId!=item.id}">
                                            <button type="button" class="btn btn-default js-shop"  data-value="${item.id}" style="margin: 3px 1px;">${item.name}</button>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
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
                            <c:forEach items="${list}" var="item" varStatus="var">
                                <tr>
                                    <td>
                                        <div style="display: inline-block; float: left;"  data-value='${item}'>
                                            <a href="javascript:;" class="js-hot">
                                                <img src="${item.imgUrl}" onerror="this.src='/static/image/label3.jpg'" style="width: 50%; float: left; margin-top:10px;"/>
                                            </a>
                                            <div style="display: inline-block; float: left;width: 45%;margin-left: 3%;">
                                                <h6>${item.name}</h6>
                                                <h6>销量:${item.sales}</h6>
                                                <small style="white-space:nowrap;overflow: hidden;text-overflow: ellipsis;width: 100px;">${item.description}</small>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

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
                    <h6 style="text-align: right;">单价：￥{{price}}</h6>
                </h4>
                <p style="height: 40px; overflow: hidden;">
                    <span class="glyphicon glyphicon-hand-right" style="color: #a6e1ec;" aria-hidden="true"></span> &nbsp;{{description}}
                </p>
                <p>
                    <a class="btn btn-primary" href="javascript:;">立即购买</a>
                </p>
            </div>
        </div>
    </div>
</script>
<script id="bodyModel" type="text/html">
    <ul class="list-group">
        <li class="list-group-item">名称：{{name}}</li>
        <li class="list-group-item">价格：￥{{price}}</li>
        <li class="list-group-item">介绍:{{description}}</li>
        <li class="list-group-item">库存:{{sales}}件</li>
        <li class="list-group-item">数量：<input id="num" type="number" placeholder="请输入购买数量"/> </li>
        <li class="list-group-item">总价： <span id="totalNum">￥0</span></li>
    </ul>
</script>
<script>
    $(function(){
        var pageIndex=1;
        var loadPage = function(){
            pageIndex=1;
            $(".js-search-page").empty();
            loadResource();
           /* $(".js-search-page").load("/webstore/searchPage",{
                name:$(".js-search-text").val() || "",
                classId:$(".js-class.btn-info").data("value") || "",
                shopId:$(".js-shop.btn-info").data("value") || "",
                sortType:$(".js-sort.sortActive").attr("data-value")
            });*/
        };
        $(".js-search").on("click",function () {
            loadPage();
        });

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

        $(".js-hot").on("click",function(){
          var item = $(this).parent().data("value");
          shopping(item);
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
        function shopping (item){
          $(document).off("change","#num");
          $(document).on("change","#num",function(){
            if($("#num").val()<=0){
              $("#num").val(1);
            }
            if($("#num").val()>item.sales){
              $("#num").val(item.sales);
            }
            var value = parseInt($("#num").val())*item.price;
            $("#totalNum").text("￥"+value);
          });
          messagePanel.alert({
            title:"请核对信息：",
            body:template("bodyModel", item),
            ok_fun:function(){
              $.ajax({
                url:"buy",
                data:{ id:item.id,num:$("#num").val()},
                type:"post",
                dataType:"json",
                success:function(data){
                  messagePanel.alert(data.message);
                  if(data.status){
                    item.sales = item.sales-1;
                  }
                }
              });
            },
            footer:'<button type="button" class="btn btn-primary js-ok">确认购买</button>'
          });
        }
        function loadResource(){
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
                            var item = respose.list[i];
                            var $template = $(template("shop",item));
                            $template.find(".btn").click(function(){
                              shopping(item);
                            });
                            $(".js-search-page").append($template);
                        }
                    }else{
                        $(".js-no-more").show();
                    }
                }
            });
        }
        $(window).on("scroll", function () {
            if(getDocumentTop()+getWindowHeight()>=getScrollHeight()){
                loadResource();
            }
        });
        loadPage();
    });
</script>
</body>
</html>
