<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/4
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>分类管理</title>

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
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 js-sidebar"  style="background-color: #f2f2f2;padding: 0;">
            <div class="list-group"  style=";margin-top: 71px; ">
                <a href="/support/index" class="list-group-item">首页</a>
                <a href="javascript:;" class="list-group-item active">商品分类管理</a>
                <a href="/support/shopManage/list" class="list-group-item">店铺管理</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
                <a href="#" class="list-group-item">Help</a>
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
                    <th>名称</th>
                    <th>商品总数</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="item" varStatus="var">
                    <tr>
                        <td>${var.count}</td>
                        <td>${item.name}</td>
                        <td>${item.count}</td>
                        <td><fmt:formatDate value="${item.creationTime}" pattern="yyyy年MM月dd日"></fmt:formatDate> </td>
                        <td><a>修改</a><a>删除</a></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4"></td>
                    <td><button id="add">新增</button></td>
                </tr>
                </tbody>
            </table>
        </div>
        <form id="form" action="/support/classify/add" method="post">
            <input name="name" type="hidden"/>
        </form>
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

        var newTr ='<td>'+$('tr').length+'</td>'+
            '<td><input name="name1"/></td>'+
            '<td>0</td>'+
            '<td></td>'+
            '<td><button id="commit">提交</button><button id="cancle">取消</button></td>';

        var addTr = ' <td colspan="4"></td>'+
            '<td><button id="add">新增</button></td>';

        $(document).on("click","#add",function(){
            $(this).parents("tr").empty().append($(newTr));
            $("input[name='name1']").focus();
        });

        $(document).on("click","#cancle",function(){
            $(this).parents("tr").empty().append(addTr);
        });

        $(document).on("click","#commit",function(){
            var name = $("input[name='name1']").val();
            if(name && $.trim(name) && $.trim(name).length<25){
                $("input[name='name']").val($.trim(name));
                $("#form").submit();
            }else{
                alert("名称不合法。");
            }
        });

    })
</script>
</body>
</html>
