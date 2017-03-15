<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/5
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table">
    <thead>
    <tr>
        <th style="width:5%;">
            序号
        </th>
        <th style="width: 25%;">
            名称
        </th>
        <th>
            价格
        </th>
        <th>
            数量
        </th>
        <th style="width: 40%;">
            描述
        </th>
        <th>
            种类
        </th>
        <th>
           操作
        </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${commodities}" var="item"  varStatus="var">
        <tr class="active">
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
                    ${item.sales}
            </td>
            <td>
                    ${item.description}
            </td>
            <td>
                    ${item.classId}
            </td>
            <td>
                <a href="/shopsManage/commodityManage/toAddCommodity?id=${item.id}">修改</a> <a href="#">售罄</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/shopsManage/commodityManage/toAddCommodity" style="margin-right: 100px;float: right;">新增</a>
<jsp:include page="../common/page.jsp"></jsp:include>

