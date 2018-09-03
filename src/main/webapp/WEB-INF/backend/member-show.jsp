<%--
  Created by IntelliJ IDEA.
  User: BIG
  Date: 2017/10/20
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="head.jsp"/>
    <title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
    <!--<img class="avatar size-XL l" src="static/h-ui/images/ucnter/avatar-default.jpg">-->
    <dl style="margin-left:80px; color:#fff">
        <dt>
            <span class="f-18">${user.username}</span>
            <!--<span class="pl-10 f-12">余额：40</span>-->
        </dt>
        <!--<dd class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd>-->
    </dl>
</div>
<div class="pd-20">
    <table class="table">
        <tbody>
        <tr>
            <th class="text-r" width="80">性别：</th>
            <td>${user.userInfo.gender}</td>
        </tr>
        <tr>
            <th class="text-r">手机：</th>
            <td>${user.userInfo.telephone}</td>
        </tr>
        <tr>
            <th class="text-r">邮箱：</th>
            <td>${user.userInfo.email}</td>
        </tr>
        <tr>
            <th class="text-r">地址：</th>
            <td>${user.userInfo.address}</td>
        </tr>
        <!--<tr>
            <th class="text-r">注册时间：</th>
            <td>2014.12.20</td>
        </tr>
        <tr>
            <th class="text-r">积分：</th>
            <td>330</td>
        </tr>-->
        </tbody>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="foot.jsp"/>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
</body>
</html>