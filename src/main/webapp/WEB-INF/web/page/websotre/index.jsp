<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/2
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/featureCarousel/css/featureCarousel.css" charset="utf-8" />
<div class="search-area well well-sm" style="margin:30px 0 0 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-11 col-md-10" style="width: 60%;margin-left: 20%;">
            <div class="input-group">
                <input type="text" class="form-control" name="keywords" placeholder="Look within results"/>
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default no-border btn-sm">
                        <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="featureCarousel" style="margin: 0 auto;">
    <div class="feature">
        <a href="#"><img alt="Image Caption" src="${pageContext.request.contextPath}/static/featureCarousel/images/testImage1.jpg"></a>
        <div>
            <p>
                This is some information that can go along with an image.
                Anything can be placed here, including images.
            </p>
        </div>
    </div>
    <div class="feature">
        <a href="#"><img alt="Image Caption" src="${pageContext.request.contextPath}/static/featureCarousel/images/testImage2.jpg"></a>
        <div>
            <p>
                This is some information that can go along with an image.
                Anything can be placed here, including images.
            </p>
        </div>
    </div>
    <div class="feature">
        <a href="#"><img alt="Image Caption" src="${pageContext.request.contextPath}/static/featureCarousel/images/testImage3.jpg"></a>
        <div>
            <p>
                This is some information that can go along with an image.
                Anything can be placed here, including images.
            </p>
        </div>
    </div>
    <div class="feature">
        <a href="#"><img alt="Image Caption" src="${pageContext.request.contextPath}/static/featureCarousel/images/testImage4.jpg"></a>
        <div>
            <p>
                This is some information that can go along with an image.
                Anything can be placed here, including images.
            </p>
        </div>
    </div>
    <div class="feature">
        <a href="#"><img alt="Image Caption" src="${pageContext.request.contextPath}/static/featureCarousel/images/testImage5.jpg"></a>
        <div>
            <p>
                This is some information that can go along with an image.
                Anything can be placed here, including images.
            </p>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/featureCarousel/js/jquery.featureCarousel.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#featureCarousel").featureCarousel({
            // include options like this:
            // (use quotes only for string values, and no trailing comma after last option)
            // option: value,
            // option: value
            autoPlay:1000
        });
    });
</script>