<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <script language="javascript" src="js/date/common.js"></script>
    <script type="text/javascript" src="js/date/datepicker/WdatePicker.js"></script>
    <jsp:include page="head.jsp"/>
    <title>订单查看</title>
</head>
<body>
<div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="order-paystate?payState=0" onclick="window.history.go(-1);this.blur();" class="btn btn-danger radius" style=" "><i class="Hui-iconfont">&#xe6e2;</i> 返回</a> </span>
<div class="mt-20">
<div class="cl pd-20" style=" background-color:#5bacb6">
    <dl style="color:#fff">
        <dt>
            <span class="f-18">订单编号：</span>
            <span class="pl-10 f-12" style="font-size: 14px">${order.orderId}</span>
        </dt>
        <dt>
        <span class="f-18">订单总价：</span>
        <span class="pl-10 f-12" style="font-size: 14px">${order.money}</span>

     </dt>
       <dt>
            <span class="f-18">收货人：</span>
            <span class="pl-10 f-12" style="font-size: 14px">${order.receiveInfo.receiver}</span>
        </dt>
        <dt>
            <span class="f-18">收货地址：</span>
            <span class="pl-10 f-12" style="font-size: 14px">${order.receiveInfo.receiveAddress}</span>
        </dt>
        <dt>
            <span class="f-18">下单时间：</span>
            <span class="pl-10 f-12" style="font-size: 14px"><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd"/></span>
        </dt>

    </dl>
</div>

<div class="pd-20">
    <table class="table">
            <tr style="border-top: 1px solid;background-color: #636363">
                <th width="247" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">商品名称</th>
                <th width="231" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">商品单价</th>
                <th width="214" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">购买数量</th>
                <th width="232" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">总价</th>
            </tr>
            <c:forEach items="${products}" var="p">
                <tr>
                    <td align="center" valign="middle" bgcolor="#FFFFFF">${p.productName}</td>
                    <td align="center" valign="middle" bgcolor="#FFFFFF">${p.productPrice}元</td>
                    <td align="center" valign="middle" bgcolor="#FFFFFF">${p.buynum}件</td>
                    <td align="center" valign="middle" bgcolor="#FFFFFF">100元</td>
                </tr>
            </c:forEach>

    </table>
</div>

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l"><a href="order-print?orderId=${order.orderId}" onclick="" class="btn btn-danger radius" style="background-color:#00c800;border-color:#00c800;margin-left: 1550px">
            <i class="Hui-iconfont">&#xe6e2;</i>打印订单</a>
        </span>
        <div class="mt-20">
<!--_footer 作为公共模版分离出去-->
<jsp:include page="foot.jsp"/>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
</body>
</html>