<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/2
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row row navbar-fixed-top">
    <div class="col-md-12">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="background-color: #33AECC;">
            <div class="navbar-header">

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button> <a class="navbar-brand" href="#">DREAM</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="js-webstore">
                        <a href="/">商城</a>
                    </li>
                    <c:if test="${user_login.userType==1}">
                        <li class="js-my-webstore">
                            <a href="/shopsManage/index">我的商城</a>
                        </li>
                    </c:if>
                    <c:if test="${user_login.userType==0}">
                        <li class="js-support">
                            <a href="/support/index">后台管理</a>
                        </li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav navbar-right" style="margin-right: 10px;">
                    <c:if test="${user_login==null}">
                        <li style="margin-right: 40px;">
                            <a href="/toLogin" >登录</a>
                        </li>
                    </c:if>
                    <c:if test="${user_login!=null}">
                        <li  class="js-personal">
                            <a href="/personal/index" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span>个人中心</a>
                        </li>
                        <li>
                            <a href="/logout" >退出</a>
                        </li>
                    </c:if>
                </ul>
            </div>

        </nav>
    </div>
</div>
<script>
    if(!console){
        var pool = [];
        window.console = {
            log:function(arument){
                pool.push(arument);
            }
        }
    }
    var flag = "<%=request.getParameter("flag")%>";
    if(flag==4){
        $(".js-personal").addClass("active");
    }else if(flag==3){
        $(".js-support").addClass("active");
    }else if(flag==2){
        $(".js-my-webstore").addClass("active");
    }else{
        $(".js-webstore").addClass("active");
    }
</script>
<script id="messagePanelModel" type="text/html">
<div class="modal fade" id="messagePanelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog {{size}}" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">{{#title}}</h4>
            </div>
            <div class="modal-body">
                {{#body}}
            </div>
            <div class="modal-footer">
               {{#footer}}
            </div>
        </div>
    </div>
</div>
</script>