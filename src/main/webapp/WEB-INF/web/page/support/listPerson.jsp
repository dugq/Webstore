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

    <title>管理员后台</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/squirrel.js"></script>
</head>
<body>

<jsp:include page="../common/head.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
</jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 js-sidebar"  style="background-color: #f2f2f2;padding: 0;">
            <div class="list-group"  style=";margin-top: 71px; ">
                <a href="/" class="list-group-item">首页</a>
                <a href="/support/classify/list" class="list-group-item">商品分类管理</a>
                <a href="/support/shopManage/list" class="list-group-item">店铺管理</a>
                <a href="javascript:;" class="list-group-item active">用户管理</a>
            </div>
        </div>
        <div class="col-md-10"  style=";margin-top: 71px;">
            <c:if test="${error!=null}">
                <div class="alert alert-danger" role="alert">
                    <strong>${error}</strong>
                </div>
            </c:if>
            <c:if test="${message!=null}">
                <div class="alert alert-success" role="alert">
                    <strong>${message}</strong>
                </div>
            </c:if>
            <table class="table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>用户名</th>
                    <th>真实姓名</th>
                    <th>email</th>
                    <th>余额</th>
                    <th>身份</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="item" varStatus="var">
                    <tr>
                        <td>${var.count}</td>
                        <td>${item.userName}</td>
                        <td>${item.realName}</td>
                        <td>${item.email}</td>
                        <td class="js-now-money">${item.money}</td>
                        <td>${item.userType==1?"商家":"普通客户"}</td>
                        <td><button data-id="${item.userId}" class="js-recharge">充值</button><c:if test="${item.userType==2}"><button href="javascript:;" data-id="${item.userId}" class="js-business" class="disabled">从商</button></c:if></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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

    $(".js-recharge").on("click",function () {
      var $that = $(this);
      messagePanel.alert({
        title:"请输入金额",
        body:"<input id = 'money' />",
        ok_fun:function(){
          var money = $("#money").val();
          if(!money || money<=0){
            return;
          }else{
            var data = {money:money,id:$that.data("id")};
            modify(data,function(response){
              if(response.status){
                  var mo = $that.parents("tr").find(".js-now-money").eq(0);
                  mo.text(parseFloat(mo.html())+parseFloat(money));
              }
            });
          }
        }
      });
    });

    $(".js-business").on("click",function(){
      var $that = $(this);
      var data = {type:2,id:$that.data("id")};
      modify(data,function(response){
        if(response.status){
          $that.remove();
        }
      });
    });

    function modify(data,fun){
      $.ajax({
        url:"modifyPersonalInfo",
        data:data,
        type:"post",
        dataType:"json",
        success:function(response){
          fun && fun(response);
        }
      });
    }
  })
</script>
</body>
</html>
