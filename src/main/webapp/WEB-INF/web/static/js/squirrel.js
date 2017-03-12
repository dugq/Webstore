window.messagePanel = function(){
    var sizeModel={
        large:" modal-lg",
        middle:" modal-md",
        small:" modal-sm"
    }
    var footerModel={
        close:'<button type="button" class="btn btn-default js-close" data-dismiss="modal">取消</button>',
        ok:'<button type="button" class="btn btn-primary js-ok">确定</button>',
        confirm:'<button type="button" class="btn btn-default js-close" data-dismiss="modal">取消</button>'
                +'<button type="button" class="btn btn-primary js-ok">确定</button>'
    };
    var defaultOptions={
        ok_fun:function(){console.log("ok");},
        close_fun:function(){console.log("close");},
        body:"确定操作吗？",
        size:sizeModel.middle,
        footer:footerModel.ok,
        container:"body",
        title:"提示："
    };
    return {
     alert:function(argument){
        if(typeof argument == 'string'){
            var newOption = $.extend({},defaultOptions,{body:argument});
        }else if(typeof argument == "object"){
            var newOption = $.extend({},defaultOptions,argument);
        }else{
            throw new Error("wrong argument");
        }
        $("#messagePanelModal") && $("#messagePanelModal").remove();
         var $template = $(template("messagePanelModel",newOption));
         $template.find(".js-ok").click(function(){
             $('#messagePanelModal').modal('hide');
             setTimeout(newOption.ok_fun,500);
         });
         $(newOption.container).append($template);
         $('#messagePanelModal').modal('show')
     },
     confirm:function(argument){
         if(typeof argument == 'string'){
             var newOption = $.extend({},defaultOptions,{body:argument});
         }else if(typeof argument == "object"){
             var newOption = $.extend({},defaultOptions,argument);
         }else{
             throw new Error("wrong argument");
         }
         newOption.footer = footerModel.confirm;
         $("#messagePanelModal") && $("#messagePanelModal").remove();
         var $template = $(template("messagePanelModel",newOption));
         $template.find(".js-ok").click(function(){
             $('#messagePanelModal').modal('hide');
             setTimeout(newOption.ok_fun,500);
         });
         $template.find(".js-close").click(function(){
             setTimeout(newOption.close_fun,500);
         });
         $(newOption.container).append($template);
         $('#messagePanelModal').modal('show')
     }
    }
}();

//文档高度
function getDocumentTop() {
    var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
    if (document.body) {
        bodyScrollTop = document.body.scrollTop;
    }
    if (document.documentElement) {
        documentScrollTop = document.documentElement.scrollTop;
    }
    scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
    return scrollTop;
}

//可视窗口高度
function getWindowHeight() {
    var windowHeight = 0;
    if (document.compatMode == "CSS1Compat") {
        windowHeight = document.documentElement.clientHeight;
    } else {
        windowHeight = document.body.clientHeight;
    }
    return windowHeight;
}

//滚动条滚动高度
function getScrollHeight() {
    var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
    if (document.body) {
        bodyScrollHeight = document.body.scrollHeight;
    }
    if (document.documentElement) {
        documentScrollHeight = document.documentElement.scrollHeight;
    }
    scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
    return scrollHeight;
}
