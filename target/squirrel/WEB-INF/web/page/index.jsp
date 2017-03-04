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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/bootstrap-combined.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/layoutit.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/editor.css"/>

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/static/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/components/respond/dest/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="${pageContext.request.contextPath}/static/components/jquery/dist/jquery.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script src="${pageContext.request.contextPath}/static/components/jquery.1x/dist/jquery.js"></script>
    <![endif]-->
    <script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/static/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
    </script>

    <script src="${pageContext.request.contextPath}/static/components/jquery-ui/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/static/components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/components/jqueryui-touch-punch/jquery.ui.touch-punch.min.js"></script>

</head>
<html>
    <body style="margin: 0;padding: 0;">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <div class="accordion" id="accordion-231771">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-231771" href="#accordion-element-425161">选项卡 #1</a>
                        </div>
                        <div id="accordion-element-425161" class="accordion-body collapse in">
                            <div class="accordion-inner">
                                功能块...
                            </div>
                        </div>
                    </div>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-231771" href="#accordion-element-848608">选项卡 #2</a>
                        </div>
                        <div id="accordion-element-848608" class="accordion-body collapse">
                            <div class="accordion-inner">
                                功能块...
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span8">
                <form class="form-search">
                    <input class="input-medium search-query" type="text" /> <button type="submit" class="btn">查找</button>
                </form>
                <div class="carousel slide" id="carousel-766695">
                    <ol class="carousel-indicators">
                        <li class="active" data-slide-to="0" data-target="#carousel-766695">
                        </li>
                        <li data-slide-to="1" data-target="#carousel-766695">
                        </li>
                        <li data-slide-to="2" data-target="#carousel-766695">
                        </li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img alt="" src="/static/image/kung-fu-panda.jpg"  />
                            <div class="carousel-caption">
                                <h4>
                                    棒球
                                </h4>
                                <p>
                                    棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img alt="" src="/static/image/kung-fu-panda.jpg" />
                            <div class="carousel-caption">
                                <h4>
                                    冲浪
                                </h4>
                                <p>
                                    冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img alt="" src="/static/image/kung-fu-panda.jpg" />
                            <div class="carousel-caption">
                                <h4>
                                    自行车
                                </h4>
                                <p>
                                    以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
                                </p>
                            </div>
                        </div>
                    </div> <a class="left carousel-control" data-slide="prev" href="#carousel-766695" style="line-height: 40px;"> &lt; </a> <a class="right carousel-control" data-slide="next" href="#carousel-766695" style="line-height: 40px;"> &gt; </a>
                </div>
            </div>
            <div class="span2">
                <ol>
                    <li>
                        新闻资讯
                    </li>
                    <li>
                        体育竞技
                    </li>
                    <li>
                        娱乐八卦
                    </li>
                    <li>
                        前沿科技
                    </li>
                    <li>
                        环球财经
                    </li>
                    <li>
                        天气预报
                    </li>
                    <li>
                        房产家居
                    </li>
                    <li>
                        网络游戏
                    </li>
                </ol>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="300x200" src="img/people.jpg" />
                            <div class="caption">
                                <h3>
                                    冯诺尔曼结构
                                </h3>
                                <p>
                                    也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
                                </p>
                                <p>
                                    <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                </p>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="300x200" src="/static/image/kung-fu-panda.jpg" />
                            <div class="caption">
                                <h3>
                                    哈佛结构
                                </h3>
                                <p>
                                    哈佛结构是一种将程序指令存储和数据存储分开的存储器结构，它的主要特点是将程序和数据存储在不同的存储空间中，进行独立编址。
                                </p>
                                <p>
                                    <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                </p>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="300x200" src="img/sports.jpg" />
                            <div class="caption">
                                <h3>
                                    改进型哈佛结构
                                </h3>
                                <p>
                                    改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。
                                </p>
                                <p>
                                    <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="300x200" src="img/people.jpg" />
                            <div class="caption">
                                <h3>
                                    冯诺尔曼结构
                                </h3>
                                <p>
                                    也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
                                </p>
                                <p>
                                    <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                </p>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="300x200" src="img/city.jpg" />
                            <div class="caption">
                                <h3>
                                    哈佛结构
                                </h3>
                                <p>
                                    哈佛结构是一种将程序指令存储和数据存储分开的存储器结构，它的主要特点是将程序和数据存储在不同的存储空间中，进行独立编址。
                                </p>
                                <p>
                                    <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                </p>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="300x200" src="img/sports.jpg" />
                            <div class="caption">
                                <h3>
                                    改进型哈佛结构
                                </h3>
                                <p>
                                    改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。
                                </p>
                                <p>
                                    <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="row-fluid">
                    <div class="span12">
                        <p class="text-center">
                            <em>Git</em>是一个分布式的版本控制系统，最初
                        </p>
                        <p class="text-center">
                            由<strong>Linus Torvalds</strong>编写，用作Linux内核代码的管理
                        </p>
                        <p class="text-center">
                            在推出后，Git在其它项目中也取得了很大成功，尤其是在Ruby社区中。
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>



