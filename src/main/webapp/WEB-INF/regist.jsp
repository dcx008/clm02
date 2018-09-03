<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>注册页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
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
                        if (element.is("#male"))
                            error.appendTo(element.parent().next());
                        else if (element.is("#female"))
                            error.appendTo(element.parent());
                        else if (element.is("#agree"))
                            error.appendTo(element.parent());
                        else
                            error.appendTo(element.parent());
                    },
                    errorElement: "span",
                    rules: {
                        username: {
                            required: true,
                            remote: {
                                type: "POST",
                                url: "/checkUsername", //请求地址
                                data: {
                                    username: function () {
                                        return $("#username").val();
                                    }
                                }
                            }
                        },
                        password: {
                            required: true,
                            minlength: 5
                        },
                        password2: {
                            required: true,
                            minlength: 5,
                            equalTo:"#pwd1"
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        agree: "required",
                        gender: {
                            required: true
                        },
                        telephone:{
                            required: false,
                            digits:true,
                            rangelength:[8,11]
                        },
                        age:{
                            required: false,
                            digits:true,
                            range:[1,200]
                        },
                        valicode: {
                            required: true
                        }
                    },
                    messages: {
                        username: {
                            required: "用户名不能为空",
                            remote: "该用户名已存在"
                        },
                        password: {
                            required: "密码不能为空",
                            minlength: "密码长度不能小于5个字母"
                        },
                        password2: {
                            required: "确认密码不能为空",
                            minlength: "密码长度不能小于 5 个字母",
                            equalTo: "两次密码输入不一致"
                        },
                        email:{
                            required: "请输入一个正确的邮箱",
                            email: "邮箱格式不正确"
                        },
                        agree: "请接受我们的协议",
                        gender: {
                            required: "性别不能为空"
                        },
                        telephone:{
                            digits:"电话号码应为整数",
                            rangelength:"电话号码长度需介于8-11之间"
                        },
                        age:{
                            range:"年龄需介于1-200岁之间",
                            digits:"请输入整数"
                        },
                        valicode: {
                            required: "验证码不能为空"
                        }
                    }
            });
            })
    </script>
    <script>
        $(function () {
            $("img").click(function () {
                $("#valicodeimg").attr("src","/valicodeImg?time="+new Date().getTime());
            })
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
    <div class="zhuce_kong">
    	<div class="zc" >
        	<div class="bj_bai">
            <h3 style="font-weight: bold">欢迎注册</h3>
                <p style="color: red">${errorMesg}</p>
       	  	  <form id="commentForm" action="/ToRegist" method="post" style="margin: auto">
                <label><input id="username" name="username" type="text" class="kuang_txt" placeholder="用户名（必填）" value="${user.username}"></label>
                  <label><input id="pwd1" name="password" type="password" class="kuang_txt" placeholder="密码（必填）"  value="${user.password}"></label>
                  <label><input id="pwd2" name="password2" type="password" class="kuang_txt" placeholder="确认密码（必填）" value="${password2}"></label>
                  <label><input id="email" name="userInfo.email" type="text" class="kuang_txt" placeholder="邮箱（必填）" value="${user.userInfo.email}"></label><br/>
                  <label for="male"><input id="male" type="radio" name="userInfo.gender" value="男"  style="margin: 0px 0px 10px 10px;" <c:if test="${user.userInfo.gender=='男'}">checked</c:if>/> 男 </label>
                  <label for="female"><input id="female" type="radio" name="userInfo.gender" value="女" style="margin: 0px 0px 10px 10px;" <c:if test="${user.userInfo.gender=='女'}">checked</c:if>/> 女 </label><br/>
                  <label><input id="name" name="userInfo.name" type="text" class="kuang_txt" placeholder="真实姓名（选填）" value="${user.userInfo.name}"></label>
                  <label><input id="age" name="userInfo.age" type="text" class="kuang_txt" placeholder="年龄（选填）" value="${user.userInfo.age}"></label>
                  <label><input id="address" name="userInfo.address" type="text" class="kuang_txt" placeholder="家庭地址（选填）" value="${user.userInfo.address}"></label>
                  <label><input id="telephone" name="userInfo.telephone" type="text" class="kuang_txt" placeholder="电话号码（选填）" value="${user.userInfo.telephone}"></label>
                  <label><input id="valicode" name="valicode" type="text" class="kuang_txt" placeholder="验证码"></label>
                <div>
                	<div class="hui_kuang"><img src="/valicodeImg" id="valicodeimg"></div>
                	<div class="shuaxin"><img src="images/login_regist/zc_25.jpg" width="13" height="14"></div>
                </div>
                <div>
                    <label for="agree"><input id="agree" name="agree" type="checkbox" value="agree" required <c:if test="${agree=='agree'}">checked</c:if>><span >已阅读并同意<a href="#" target="_blank"><span class="lan">《撑了么网站使用协议》</span></a></span></label>
                </div>
                <input name="注册" type="submit" class="btn_zhuce" value="注册">
                
                </form>
            </div>
        </div>
    </div>

</div>

</body>
</html>