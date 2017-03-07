<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/5
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</head>
<body>

<jsp:include page="../common/head.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
</jsp:include>

<div class="container-fluid" style="margin-top: 71px;">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <c:if test="${error!=null}">
                <div class="alert alert-danger" role="alert">
                    <strong>${error}</strong>
                </div>
            </c:if>
            <form role="form" action="/shopsManage/commodityManage/addCommodity" type="post">
                <input type="hidden" name="id" value="${commodity.id}"/>
                <div class="form-group">
                    <label for="exampleInputEmail1">
                        名称
                    </label>
                    <input type="text" class="form-control" id="exampleInputEmail1" name="name" value="${commodity.name}"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">
                        价格
                    </label>
                    <input type="text" class="form-control" id="exampleInputPassword1" name="price" value="${commodity.price}"/>
                </div>
                <div class="form-group">
                    <label for="sales">
                        数量
                    </label>
                    <input type="text" class="form-control" id="sales" name="sales" value="${commodity.sales}"/>
                </div>
                <div class="form-group">
                    <label for="description">
                        描述
                    </label>
                    <input type="text" class="form-control" id="description" name="description" value="${commodity.description}"/>
                </div>
                <div class="form-group">
                    <label for="classId">
                        分类
                    </label>
                    <input type="text" class="form-control" id="classId" name="classId" value="${commodity.classId}"/>
                </div>
                <div class="form-group">
                    <label>
                        图片
                    </label><br/>
                    <input type="hidden" name="imgUrl" value="${commodity.imgUrl}" />
                    <img src="${commodity.imgUrl}" id="imgUrl">
                    <script>
                        window.uploadSuccess = function(respose){
                            $("input[name='imgUrl']").val(respose.url);
                            $("#imgUrl").attr("src",respose.url);
                        }
                    </script>
                    <jsp:include page="../common/uploadBtn.jsp"></jsp:include>
                </div>
                <button type="submit" class="btn btn-default">
                    提交
                </button>
            </form>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
