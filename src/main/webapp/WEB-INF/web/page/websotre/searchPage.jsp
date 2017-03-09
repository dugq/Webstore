<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/9
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach items="${list}" var="item">
    <div class="col-md-3">
        <div class="thumbnail">
            <img alt="Bootstrap Thumbnail Third" onerror="this.src='/static/image/hot-fuzz.jpg'" src=" ${item.imgUrl}" />
            <div class="caption">
                <h3>
                    ${item.name}
                </h3>
                <p>
                    ${item.description}
                </p>
                <p>
                    <a class="btn btn-primary" href="#">查看</a> <a class="btn" href="#">购买</a>
                </p>
            </div>
        </div>
    </div>
</c:forEach>
