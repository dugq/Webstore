<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/4
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>搜索</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/style.css" rel="stylesheet">

</head>
<body>
    <div id="top"></div>
    <jsp:include page="../common/head.jsp"></jsp:include>
    <div class="container-fluid"  style="margin-top: 71px;">
        <div class="row">
            <div class="col-md-12">
                <div  class="row">
                    <div class="col-md-2"></div>
                    <div class="input-group col-md-8" style="margin-bottom:10px;">
                        <input type="text" class="form-control" aria-label="Text input with multiple buttons" placeholder="Search">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default js-search" >搜索</button>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row" style="margin-top:23px;">
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="Bootstrap Thumbnail First" src="http://lorempixel.com/output/people-q-c-600-200-1.jpg" />
                                    <div class="caption">
                                        <h3>
                                            Thumbnail label
                                        </h3>
                                        <p>
                                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="Bootstrap Thumbnail Second" src="http://lorempixel.com/output/city-q-c-600-200-1.jpg" />
                                    <div class="caption">
                                        <h3>
                                            Thumbnail label
                                        </h3>
                                        <p>
                                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="Bootstrap Thumbnail Third" src="http://lorempixel.com/output/sports-q-c-600-200-1.jpg" />
                                    <div class="caption">
                                        <h3>
                                            Thumbnail label
                                        </h3>
                                        <p>
                                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="Bootstrap Thumbnail First" src="http://lorempixel.com/output/people-q-c-600-200-1.jpg" />
                                    <div class="caption">
                                        <h3>
                                            Thumbnail label
                                        </h3>
                                        <p>
                                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="Bootstrap Thumbnail Second" src="http://lorempixel.com/output/city-q-c-600-200-1.jpg" />
                                    <div class="caption">
                                        <h3>
                                            Thumbnail label
                                        </h3>
                                        <p>
                                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="Bootstrap Thumbnail Third" src="http://lorempixel.com/output/sports-q-c-600-200-1.jpg" />
                                    <div class="caption">
                                        <h3>
                                            Thumbnail label
                                        </h3>
                                        <p>
                                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="bs-example bs-example-type" data-example-id="small-headings" >
                        <h4 style="color:red;">hot:</h4>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr><tr>
                                <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <a class="navbar-fixed-bottom" style="bottom: 50px; left: 90%;font-size:25px;color: #FF905B" href="#top">
        <span class="glyphicon glyphicon-circle-arrow-up" style="display: block;" aria-hidden="true"></span>
        <span style="font-size: 12px; display: block;">顶部</span>
    </a>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/scripts.js"></script>
</body>
</html>
