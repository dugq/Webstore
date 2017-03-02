<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/26
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<body>

</body>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>心动商城</title>
    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <%--ace  css--%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/bootstrap.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/components/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-fonts.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.css" />


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/components/select2/dist/css/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/components/_mod/jquery-ui.custom/jquery-ui.custom.css" />






<%-- ace js--%>
    <!--[if !IE]> -->
    <script src="${pageContext.request.contextPath}/static/components/jquery/dist/jquery.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script src="${pageContext.request.contextPath}/static/components/jquery.1x/dist/jquery.js"></script>
    <![endif]-->
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/static/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>" + "<" + "/script>");
    </script>
<%--slidorion  js--%>
</head>
<html>
    <body>
    <jsp:include page="common/head.jsp"></jsp:include>

    <div>
        <%--分类--%>
        <div>

        </div>

        <%--轮播图--%>
        <div>

        </div>

        <%--热门排行--%>
        <div>

        </div>
    </div>



    </body>
</html>



