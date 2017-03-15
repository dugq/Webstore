<%--
  Created by IntelliJ IDEA.
  User: duq
  Date: 2017/3/14
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    新订单
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
                <c:if test="${item.status==0}">
                    <button data-id="${item.id}" class="js-send" data-value="1">确认发货</button>
                </c:if>
                <c:if test="${item.status==1 && interval/1000/60/60/24<3}">
                    <span>配送中</span>
                </c:if>
                <c:if test="${item.status==2 || (interval/1000/60/60/24>3 && item.status==1)}">
                    <button data-id="${item.id}" class="js-close" data-value="5">关闭</button>
                </c:if>
                <c:if test="${item.status==3}">
                    <button data-id="${item.id}" class="js-agree" data-value="4">同意退货</button>
                </c:if>
                <c:if test="${item.status==5}">
                    <span >交易完成</span>
                </c:if>
                <c:if test="${item.status==4}">
                    <span >已退货</span>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="../common/page.jsp"/>
<script>
    $(function(){
      $(".js-close").click(function(){
        modify.call(this,"<span >交易完成</span>");
      });
      $(".js-agree").click(function(){
        modify.call(this,"<span >已退货</span>");
      });
      $(".js-send").click(function(){
        modify.call(this,"<span>配送中</span>");
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