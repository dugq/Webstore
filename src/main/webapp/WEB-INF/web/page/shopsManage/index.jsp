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

    <title>我的商城</title>

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
<div class="container-fluid"  style="margin-top: 71px;">
    <div class="row">
        <c:if test="${shop.status==2}">
            <div class="alert alert-danger" role="alert">
                <strong>sorry，您的审核未通过。</strong>
            </div>
        </c:if>
        <div class="col-md-12">
            <ul class="nav nav-tabs js-list">
                <li class="active" data-target="a">
                    <a href="javascript:;">店铺管理</a>
                </li>
                <c:if test="${shop!=null && shop.status==3}">
                    <li data-target="b">
                        <a href="javascript:;">商品管理</a>
                    </li>
                </c:if>
                <c:if test="${shop!=null && shop.status==3}">
                    <li data-target="c">
                        <a href="javascript:;">訂單管理</a>
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
                        <script>
                            window.uploadSuccess = function(respose){
                                $("input[name='img-url']").val(respose.url);
                                $("#imgUrl").attr("src",respose.url);
                            }
                        </script>
                        <jsp:include page="../common/uploadBtn.jsp"></jsp:include>
                    </div>
                    <button type="submit" class="btn btn-default js-save">
                        保存
                    </button>
                    <button type="submit" class="btn btn-default js-submit">
                        提交审核
                    </button>
            </div>

            <div id="b" style="display: none;padding-top: 20px;">

            </div>
            <div id="c" style="display: none;padding-top: 20px;">

            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
   $(function(){
       $(".js-list>li").on("click",function(){
           if($(this).data("target")=="a"){
               $("#a").show();
               $("#b").hide();
                $("#c").hide();
           }else  if($(this).data("target")=="b"){
               $("#b").children().length || $("#b").load("/shopsManage/commodityManage",{pageIndex:1});
               $("#b").show();
               $("#a").hide();
               $("#c").hide();
           }else{
             $("#c").children().length || $("#c").load("/shopsManage/orderManage",{pageIndex:1});
             $("#c").show();
             $("#a").hide();
             $("#b").hide();
           }
           $(".js-list>li").removeClass("active");
           $(this).addClass("active");
       });
       $(".js-save").on("click",function(){
           $.ajax({
               url:"save",
               data:{
                   name:$.trim($("input[name='name']").val()),
                   description:$.trim($("input[name='description']").val()),
                   url:$.trim($("input[name='img-url']").val())
               },
               type:"post",
               dataType:"json",
               success:function(data){
                   if(data.status){
                       alert("保存成功。");
                   }else{
                       alert(data.message);
                   }
               },
               error:function(){
                   alert("请求失败。");
               }
           });
       });
       $(".js-submit").on("click",function(){
           $.ajax({
               url:"saveAndSubmit",
               data:{
                   name:$.trim($("input[name='name']").val()),
                   description:$.trim($("input[name='description']").val()),
                   url:$.trim($("input[name='img-url']").val())
               },
               type:"post",
               dataType:"json",
               success:function(data){
                   if(data.status){
                       alert("提交成功。");
                   }else{
                       alert(data.message);
                   }
               },
               error:function(){
                   alert("请求失败。");
               }
           });
       });
   });
</script>
</body>
</html>
