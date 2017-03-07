<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/5
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/webupload/webuploader.css">
<script src="${pageContext.request.contextPath }/static/webupload/webuploader.min.js"></script>
<span id = "upload-pick">上传</span>
<script>
    $(function(){
        var upload = WebUploader.create({
            auto: false,
            // swf文件路径
            swf: '${pageContext.request.contextPath}/static/webupload/Uploader.swf',

            // 文件接收服务端。
            server: '${pageContext.request.contextPath}/file/upload',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#upload-pick',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false
        });
        upload.on('beforeFileQueued', function (file) {
            upload.reset();
        });
        upload.on('fileQueued', function (file) {
            upload.upload(file);
        });
        upload.on('uploadBeforeSend', function (object, data, headers) {
            $('#upload-pick').hide();
        });
        upload.on('uploadSuccess', function (file, response) {
            if (response.status) {
                window.uploadSuccess && window.uploadSuccess(response);
                alert("上传成功！");
            } else {
                alert(response.message);
            }
        });
        upload.on('uploadProgress', function (file, percentage) {

        });
        upload.on('uploadError', function (file, response) {
            alert("上传失败！");
        });
        upload.on('uploadComplete', function (file) {
            $('#upload-pick').show();
        });
    });
</script>