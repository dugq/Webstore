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
            <table class="table">
                <thead>
                <tr>
                    <th  style="width: 5%;">序号</th>
                    <th  style="width: 15%;">名称</th>
                    <td  style="width: 15%;">店长</td>
                    <th  style="width: 35%;">描述</th>
                    <th  style="width: 15%;">创建时间</th>
                    <th style="width: 35%">操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item" varStatus="var">
                       <tr> <td>${var.count}</td>
                        <td >${item.name}</td>
                        <td>${item.shopkeeperName}</td>
                        <td >${item.description}</td>
                        <td><fmt:formatDate value="${item.creationTime}" pattern="yyyy年MM月dd日"></fmt:formatDate></td>
                        <td>
                            <c:if test="${item.status==1}">
                                <button class="js-modify" data-value="3" data-id="${item.id}">通过</button>
                                <button class="js-modify" data-value="2" data-id="${item.id}">拒绝</button>
                            </c:if>
                            <c:if test="${item.status==3}">
                                <button class="js-modify" data-value="1" data-id="${item.id}">停牌</button>
                            </c:if>
                            <button class="js-show" data-id="${item.id}">查看</button>
                        </td>
                       </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script id="button" type="text/html">
    {{if status==1}}
    <button class="js-modify" data-value="3" data-id="{{id}}">通过</button>
    <button class="js-modify" data-value="2" data-id="{{id}}">拒绝</button>
    {{/if}}
    {{if status==3}}
    <button class="js-modify" data-value="1" data-id="{{id}}">停牌</button>
    {{/if}}
    <button class="js-show" data-id="{{id}}">查看</button>
</script>
<script>
  $(function(){
    $(window).on('resize',function(){
      if( document.body.offsetHeight < document.documentElement.clientHeight){
        $('.js-sidebar').height(document.documentElement.clientHeight);
      }else{
        $('.js-sidebar').height(document.body.offsetHeight);
      }
    }).trigger("resize");

    $(".js-modify").on("click",function(){
      var $that = $(this);
      $.ajax({
        url:"/support/shopManage/modifyShop",
        data:{
          id:$that.data("id"),
          status:$that.data("value")
        },
        type:"post",
        dataType:"json",
        success:function(respose){
            $that.parent().empty().append(template("button",{id:$that.data("id"),status:$that.data("value")}));
        }
      });
    });
      $(".js-show").on("click",function(){
          window.location.href = "${pageContext.request.contextPath}/support/shopManage/show?shopId="+$(this).data("id");
      });
  })
</script>
</body>
</html>
