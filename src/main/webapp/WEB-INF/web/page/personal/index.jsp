<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/4
  Time: 14:36
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

    <title>个人中心</title>

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

<jsp:include page="../common/head.jsp">
    <jsp:param name="flag" value="4"></jsp:param>
</jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 js-sidebar"  style="background-color: #f2f2f2;padding: 0;">
            <div class="list-group"  style=";margin-top: 71px; ">
                <a href="javascript:;" class="list-group-item active">基本信息</a>
                <a href="/personal/buyHistory" class="list-group-item">购买记录</a>
            </div>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-7"  style=";margin-top: 100px;">
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon">昵称：</span>
                <input type="text" name="name" class="form-control" readonly="readonly" aria-label="Amount (to the nearest dollar)" value="${user.userName}"/>
                <span class="input-group-addon js-modify"><button>修改</button></span>
                <span class="input-group-addon js-commit" style="display: none;"><button>确定</button></span>
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon">姓名：</span>
                <input type="text"  readonly="readonly" class="form-control" aria-label="Amount (to the nearest dollar)" value="${user.realName}"/>
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon">邮箱：</span>
                <input type="text" name="email" class="form-control"  readonly="readonly" aria-label="Amount (to the nearest dollar)" value="${user.email}"/>
                <span class="input-group-addon  js-modify"><button>更换</button></span>
                <span class="input-group-addon js-commit" style="display: none;"><button>确定</button></span>
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon">余额：</span>
                <input type="number" min="1" class="form-control" placeholder="请输入充值金额" readonly="readonly" aria-label="Amount (to the nearest dollar)" value="${user.money}"/>
                <span class="input-group-addon js-modify" data-flag="false"><button>充值</button></span>
                <span class="input-group-addon js-commit" style="display: none;"><button>确定</button></span>
            </div>
        </div>
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

        $(".js-modify").on("click",function(){
            var $that = $(this);
            if((typeof $(this).attr("data-flag")!= "undefined") && $(this).data("flag")){
                $that.prev().val("");
            }else if((typeof $(this).attr("data-flag")!= "undefined") && !$(this).data("flag")){
                messagePanel.alert("功能暂未开放,请先去管理员处充值~");
                return;
            }
            $(this).hide();
            $(this).next().show().on("click",function(){
                console.log(123231);
                var val = $.trim($that.prev().val());
                if(val && val!=beforeText){
                    var data = {};
                    data[ $that.prev().attr("name")] = val;
                    $.ajax({
                        url:"modify",
                        dataType:"json",
                        type:"post",
                        data:data,
                        success:function(data){
                            if(!data.status){
                                $that.prev().val(beforeText);
                            }
                              messagePanel.alert(data.message);
                        },
                        error:function(){
                            $that.prev().val(beforeText);
                        }
                    });
                }else{
                    console.log("未修改");
                }
            });
            var beforeText = $(this).prev().val();
            $(this).prev().removeAttr("readonly").focus().on("focusout",function(){
                setTimeout(function(){
                    $that.show();
                    $that.prev().attr("readonly","readonly");
                    $that.next().hide().off("click");
                },500);
            });
        });
    });
</script>
</body>
</html>
