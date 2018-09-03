<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="css/login.css">
    <script src="jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script>
        $.validator.setDefaults({
            submitHandler: function() {
                form.submit();
            }
        });

        $().ready(function() {
            $("#commentForm").validate({
                errorPlacement: function(error, element) {
                        error.appendTo(element.parent());
                },
                errorElement: "span",
                rules: {
                    username: {
                        required: true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    }
                },
                messages: {
                    username: {
                        required: "用户名不能为空"
                    },
                    password: {
                        required: "密码不能为空",
                        minlength: "密码长度不能小于5个字母"
                    }
                }
            });
        })
    </script>
    <style>
        .error{
            color:red;
        }
    </style>
</head>
<body class="login_bj" >
<div class="zhuce_body">
    <div class="zhuce_kong login_kuang">
    	<div class="zc">
        	<div class="bj_bai">
            <h3>登录</h3>
                <p style="text-align:center;color: red">${errorMesg}</p>
       	  	  <form id="commentForm" action="/toLogin" method="post" style="margin: auto;margin-left:160px">
                  <label for=""><input name="username" type="text" class="kuang_txt" placeholder=" 用户名"></label><br/>
                  <label for=""><input name="password" type="password" class="kuang_txt" placeholder=" 密码"></label><br/>
                    <input name="登录" type="submit" class="btn_zhuce" value="登录"><br>
                    <a href="/regist" style="float: left;margin-top: 5px;">还没有帐号？立即注册 >></a>
                </form>
            </div>
        </div>
    </div>

</div>
    
</body>
</html>