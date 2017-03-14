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
                    配送中
                </c:if>
                <c:if test="${item.status==1}">
                    已收货
                </c:if>
                <c:if test="${item.status==2}">
                    申请退货
                </c:if>
                <c:if test="${item.status==3}">
                    已退货
                </c:if>
                <c:if test="${item.status==4}">
                    交易成功
                </c:if>
            </td>
            <td>
                    ${item.description}
            </td>
            <td>
                <fmt:formatDate value="${item.creationTime}" pattern="yyyy年MM月dd日"></fmt:formatDate>
            </td>
            <td>
                <c:if test="${item.status==1}">
                    <button>关闭</button>
                </c:if>
                <c:if test="${item.status==2}">
                    <button>同意退货</button>
                </c:if>
                <c:if test="${item.status!=1}">
                    <span disabled>已关闭</span>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="../common/page.jsp"/>
