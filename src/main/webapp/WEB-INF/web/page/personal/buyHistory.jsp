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

    <title>个人中心</title>

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
    <jsp:param name="flag" value="4"></jsp:param>
</jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 js-sidebar"  style="background-color: #f2f2f2;padding: 0;">
            <div class="list-group"  style=";margin-top: 71px; ">
                <a href="/personal/index" class="list-group-item">基本信息</a>
                <a href="javascript:;" class="list-group-item active">购买记录</a>
            </div>
        </div>
        <div class="col-md-10"  style=";margin-top: 71px;">
            <table class="table">
                <thead>
                <tr class="info">
                    <th style="width:5%;">
                        序号
                    </th>
                    <th style="width: 20%;">
                        名称
                    </th>
                    <th>
                        价格
                    </th>
                    <th>
                        數量
                    </th>
                    <th>
                        状态
                    </th>
                    <th style="width: 20%;">
                        描述
                    </th>
                    <th>
                        购买时间
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <jsp:useBean id="nowDate" class="java.util.Date"/>
                <c:forEach items="${list}" var="item"  varStatus="var">
                    <tr class="warning">
                        <td>
                                ${var.count}
                        </td>
                        <td>
                                ${item.name}
                        </td>
                        <td>
                                ${item.price}
                        </td>
                        <td>
                                ${item.num}
                        </td>
                        <td>
                            <c:if test="${item.status==0}">
                                卖家准备中
                            </c:if>
                            <c:if test="${item.status==1}">
                                配送中
                            </c:if>
                            <c:if test="${item.status==2}">
                                已收货
                            </c:if>
                            <c:if test="${item.status==3}">
                                申请退货
                            </c:if>
                            <c:if test="${item.status==4}">
                                已退货
                            </c:if>
                            <c:if test="${item.status==5}">
                                交易成功
                            </c:if>
                        </td>
                        <td>
                                ${item.description}
                        </td>
                        <c:set var="interval" value="${nowDate.time - item.creationTime.time}"/>
                        <td>
                            <fmt:formatDate value="${item.creationTime}" pattern="yyyy年MM月dd日"></fmt:formatDate>
                        </td>
                        <td>
                            <c:if test="${item.status==1}">
                                <button data-id="${item.id}" class="js-ok" data-value="2">确认收货</button>
                            </c:if>
                            <c:if test="${item.status==0 || item.status==1}">
                                <button data-id="${item.id}" class="js-back" data-value="3">申请退货</button>
                            </c:if>
                        </td>
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
      $(".js-ok").click(function(){
        modify.call(this,"<span >操作成功</span>");
      });
      $(".js-back").click(function(){
        modify.call(this,"<span >操作成功</span>");
      });
      function modify(text){
        var data={
          id:$(this).data("id"),
          status:$(this).data("value")
        };
        var $that = $(this);
        $.ajax({
          url:"/shopsManage/orderManage/modify",
          data:data,
          type:"post",
          dataType:"json",
          success:function(){
            $that.parent().empty().append(text);
          }
        });
      }
    })
</script>
</body>
</html>
