<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/5
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div class="panel panel-info">
        <div class="panel-heading">所有分类&gt;</div>
        <div class="panel-body" style="border-bottom: #ddd solid 1px;">
            分类：
                <button type="button" class="btn btn-default js-status btn-info" data-value="" data-value="">全部</button>
                <button type="button" class="btn btn-default js-status" data-value="0" style="margin: 3px 1px;">配送中</button>
                <button type="button" class="btn btn-default js-status" data-value="1" style="margin: 3px 1px;">已收货</button>
                <button type="button" class="btn btn-default js-status" data-value="2" style="margin: 3px 1px;">申请退货</button>
                <button type="button" class="btn btn-default js-status" data-value="3" style="margin: 3px 1px;">已经退货</button>
                <button type="button" class="btn btn-default js-status" data-value="4" style="margin: 3px 1px;">交易成功</button>
        </div>
    </div>
   <div id="orderPage"></div>
<script>
    $(function(){
      $(".js-status").click(function () {
        $(".js-status").removeClass("btn-info");
        $(this).addClass("btn-info");
        loadPage();
      });
      function loadPage(){
        $("#orderPage").load("/shopsManage/orderManage/orderPage",{pageIndex:1,status:$(".js-status.btn-info").data("value")});
      }
      loadPage();
    });
</script>
