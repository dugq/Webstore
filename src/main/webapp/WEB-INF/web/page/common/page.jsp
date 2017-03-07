<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/5
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${page!=null}">

<nav class="text-center">
    <ul class="pagination">
        <li>
            <c:if test="${page.pageIndex==1}">
            <a aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
            </c:if>
            <c:if test="${page.pageIndex>1}">
            <a href="javascript:void(0);"
               onclick="$('<%=request.getParameter("navDiv")%>').load('${page.url}&${page.pageIndexName}=1');" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
            </c:if>
        </li>
        <li>
            <c:if test="${page.pageIndex==1}">
            <a aria-label="Previous">
                <span aria-hidden="true">&lt;</span>
            </a>
            </c:if>
            <c:if test="${page.pageIndex>1}">
            <a href="javascript:void(0);"
                onclick="$('<%=request.getParameter("navDiv")%>').load('${page.url}&${page.pageIndexName}=${page.pageIndex-1}');"
               aria-label="Previous">
                <span aria-hidden="true">&lt;</span>
            </a>
            </c:if>
        </li>
        <c:forEach items="${page.navPageNums}" var="item">
            <c:if test="${item==page.pageIndex}">
                <li class="active"><a>$item</a></li>
            </c:if>
            <c:if test="${item!=page.pageIndex}">
                <li><a href="javascript:void(0);"
                       onclick="$('<%=request.getParameter("navDiv")%>').load('${page.url}&${page.pageIndexName}=${item}');"
                >${item}</a></li>
            </c:if>
        </c:forEach>
        <li>
            <c:if test="${page.pages == page.pageIndex}">
                <a aria-label="Next">
                    <span aria-hidden="true">&gt;</span>
                </a>
            </c:if>
            <c:if test="${page.pages == page.pageIndex}">
                <a href="javascript:void(0);"
                   onclick="$('<%=request.getParameter("navDiv")%>').load('${page.url}&${page.pageIndexName}=${page.pageIndex+1}');"
                   aria-label="Next">
                    <span aria-hidden="true">&gt;</span>
                </a>
            </c:if>

        </li>
        <li>
            <c:if test="${page.pages == page.pageIndex}">
            <a aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
            </c:if>
            <c:if test="${page.pages != page.pageIndex}">
            <a href="javascript:void(0);"
               onclick="$('<%=request.getParameter("navDiv")%>').load('${page.url}&${page.pageIndexName}=${page.pages}');"
               aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
            </c:if>
        </li>
    </ul>
</nav>
</c:if>