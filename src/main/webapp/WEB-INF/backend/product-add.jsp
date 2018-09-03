<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BIG
  Date: 2017/10/20
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="head.jsp"/>
    <title>产品新增</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal"  action="toadd">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品ID：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${product.productId}" placeholder="" id="articletitle" name="productId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${product.productName}" placeholder="" id="articletitle2" name="productName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${product.productPrice}" placeholder="" id="articletitle3" name="productPrice">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品分类：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="category" class="select">
                    <option value="" selected="selected">---请选择---</option>
                    <option value="头盘冷菜">头盘冷菜</option>
                    <option value="煲煲共享">煲煲共享</option>
                    <option value="私房美味">私房美味</option>
                    <option value="招牌菜">招牌菜</option>
                    <option value="家常美味">家常美味</option>
                    <option value="田园时蔬">田园时蔬</option>
                    <option value="西式快餐">西式快餐</option>
                    <option value="美味靓汤">美味靓汤</option>
                    <option value="精美点心">精美点心</option>
                    <option value="米饭">米饭</option>

                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="uploader-thum-container">
                    <div id="fileList" class="uploader-list"></div>
                    <input name="imgurl" type="file" accept="image/gif, image/jpeg" value="${product.imgurl}"/>
                   <%-- <img src="${imgurl}" style="width: 30%;height: 200px"/>--%>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${product.pnum}" placeholder="" id="articletitle4" name="pnum">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注信息：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea type="text" class="input-text" value="${product.remark}" placeholder="" id="" name="remark" style="height: 121px"></textarea>
            </div>
        </div>
        <%--<div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <script id="editor" type="text/plain" style="width:100%;height:400px;">${remark}</script>
            </div>
        </div>--%>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button class="btn btn-primary radius" type="submit">保存并提交审核</button>
                <button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="js/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="js/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="js/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="js/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="js/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="js/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="js/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="js/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="js/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="js/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
   /* $(function() {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
    }*/
       /* //表单验证
        $("#form-article-add").validate({
            rules:{
                articletitle:{
                    required:true,
                },
                articletitle2:{
                    required:true,
                },
                articlecolumn:{
                    required:true,
                },
                articletype:{
                    required:true,
                },
                articlesort:{
                    required:true,
                },
                keywords:{
                    required:true,
                },
                abstract:{
                    required:true,
                },
                author:{
                    required:true,
                },
                sources:{
                    required:true,
                },
                allowcomments:{
                    required:true,
                },
                commentdatemin:{
                    required:true,
                },
                commentdatemax:{
                    required:true,
                },

            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                //$(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
                //parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });
*/
       /* $list = $("#fileList"),
                $btn = $("#btn-star"),
                state = "pending",
                uploader;

        var uploader = WebUploader.create({
            auto: true,
            swf: 'lib/webuploader/0.1.5/Uploader.swf',

            // 文件接收服务端。
            server: 'fileupload.php',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/!*'
            }
        });
        uploader.on( 'fileQueued', function( file ) {
            var $li = $(
                            '<div id="' + file.id + '" class="item">' +
                            '<div class="pic-box"><img></div>'+
                            '<div class="info">' + file.name + '</div>' +
                            '<p class="state">等待上传...</p>'+
                            '</div>'
                    ),
                    $img = $li.find('img');
            $list.append( $li );

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr( 'src', src );
            }, thumbnailWidth, thumbnailHeight );
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                    $percent = $li.find('.progress-box .sr-only');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
            }
            $li.find(".state").text("上传中");
            $percent.css( 'width', percentage * 100 + '%' );
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file ) {
            $( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
        });

        // 文件上传失败，显示上传出错。
        uploader.on( 'uploadError', function( file ) {
            $( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress-box').fadeOut();
        });
        uploader.on('all', function (type) {
            if (type === 'startUpload') {
                state = 'uploading';
            } else if (type === 'stopUpload') {
                state = 'paused';
            } else if (type === 'uploadFinished') {
                state = 'done';
            }

            if (state === 'uploading') {
                $btn.text('暂停上传');
            } else {
                $btn.text('开始上传');
            }
        });

        $btn.on('click', function () {
            if (state === 'uploading') {
                uploader.stop();
            } else {
                uploader.upload();
            }
        });

        var ue = UE.getEditor('editor');

    });*/
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>