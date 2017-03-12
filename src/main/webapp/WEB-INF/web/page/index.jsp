<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>首页</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/style.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/bootstrap/js/scripts.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/squirrel.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/template.js"></script>
  </head>
  <body>
  <div id="top"></div>
<div class="container-fluid">
	<jsp:include page="common/head.jsp">
		<jsp:param name="flag" value="1"></jsp:param>
	</jsp:include>
	<div class="row" style="margin-top: 71px;">
		<div class="col-md-2">
			<ul class="nav nav-pills nav-stacked nav-pills-stacked-example"  style="background-color:#FF905B;margin-top:43px;">
				<c:forEach items="${list}" var="item" end="10">
				<li role="presentation" style="boder:1px solid black;"><a href="${pageContext.request.contextPath}/webstore/webstore?classId=${item.id}">${item.name}</a></li>
				</c:forEach>
		</ul>
		</div>
		<div class="col-md-8">
		<div class="input-group" style="margin-bottom:10px; width:80%; margin-left:10%;">
          <input type="text" class="form-control js-name" aria-label="Text input with multiple buttons" placeholder="Search">
          <div class="input-group-btn">
            <button type="button" class="btn btn-default js-search" >搜索</button>
          </div>
        </div>
			<div class="carousel slide" id="carousel-242627">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-242627">
					</li>
					<li data-slide-to="1" data-target="#carousel-242627">
					</li>
					<li data-slide-to="2" data-target="#carousel-242627">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="Carousel Bootstrap First" src="http://lorempixel.com/output/sports-q-c-1600-500-1.jpg" style="height:500px;" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Second" src="http://lorempixel.com/output/sports-q-c-1600-500-2.jpg" style="height:500px;" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Third" src="http://lorempixel.com/output/sports-q-c-1600-500-3.jpg" style="height:500px;"  />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-242627" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-242627" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
		<div class="col-md-2">
		
			<div class="bs-example bs-example-type" data-example-id="small-headings" style="margin-top:43px;">
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
	<div class="row" style="margin:20px auto;">
		<div class="col-md-12" id="shopsDiv">

		</div>
	</div>
	<div class="alert alert-info center-block js-no-more" role="alert" style="display: none;">
		<strong class="center-block text-center">已经到底啦!</strong>
	</div>
	<jsp:include page="common/footer.jsp"/>
</div>
  <a class="navbar-fixed-bottom" style="bottom: 50px; left: 90%;font-size:25px;color: #FF905B" href="#top">
	  <span class="glyphicon glyphicon-circle-arrow-up" style="display: block;" aria-hidden="true"></span>
	  <span style="font-size: 12px; display: block;">顶部</span>
  </a>
<script id="shop" type="text/html">
	<div class="col-md-3">
		<div class="thumbnail">
			<img alt="Bootstrap Thumbnail Third" src="{{imgUrl}}" style="height: 200px;" />
			<div class="caption">
				<h3>
					{{name}}
				</h3>
				<p style="height: 100px;overflow: hidden;">
					{{description}}
				</p>
				<p>
					<a class="btn btn-primary" data-id="{{id}}" href="${pageContext.request.contextPath}/webstore/webstore?shopId={{id}}">逛逛</a>
				</p>
			</div>
		</div>
	</div>
</script>

  <script>
	  $(".js-search").on('click',function(){
	      window.location.href="${pageContext.request.contextPath}/webstore/webstore?name="+($(".js-name").val() || "")
	  });
	  $(function () {
	      var pageIndex = 1;
		  var loadShops = function(){
		      $.ajax({
		          url:"loadPage",
				  data:{ pageIndex:pageIndex++},
				  dataType:"json",
				  type:"post",
				  success:function(data){
					 if(data.list && data.list.length){
					     for(var i =0; i < data.list.length;i++){
					         $("#shopsDiv").append(template("shop",data.list[i]));
						 }
					 }else{
						$(".js-no-more").show();
					 }
				  }
			  });
		  }
		  loadShops();
          $(window).on("scroll", function () {
              if(getDocumentTop()+getWindowHeight()>=getScrollHeight()) {
                  loadShops();
		  	}});
      });
  </script>
  </body>
</html>