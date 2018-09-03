<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" pageEncoding="utf-8"%>

<div id="templatemo_menu" class="ddsmoothmenu">
    <ul>
        <li><a href="/">主页</a></li>
        <li><a href="products">全部商品</a></li>
        <shiro:hasPermission name="USER">
            <li><a href="toShoppingCart">购物车</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="USER">
            <li><a href="checkoutOrder">订单信息</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="ADMIN">
            <li><a href="backend">后台管理</a></li>
        </shiro:hasPermission>
    </ul>
    <c:if test="${userINFO==null}">
        <div style="display:inline-block;margin-top:5px;float: right;width: 100px;text-align: center;font-size: 12px;font-family: initial;">
            <a href="login">登录</a> / <a href="regist">注册</a>
        </div>
    </c:if>
    <c:if test="${userINFO!=null}">
        <div style="display:inline-block;margin-top:5px;float: right;width: 100px;text-align: center;font-size: 12px;font-family: initial;">
            ${userINFO.userInfo.name}&nbsp;&nbsp;&nbsp;<a href="/logout">退出</a>
        </div>
    </c:if>
    <div id="templatemo_search">
        <form action="/searchMo" method="post">
            <input type="text" placeholder=" 搜索" name="keyword" id="keyword" title="keyword"
                   onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
            <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
        </form>
    </div>
    <br style="clear: left" />
</div>

