<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单信息</title>
    <jsp:include page="header.jsp"/>

    <script type="text/javascript">
        $(function(){
            $(".deleteOrder").click(function () {
                var _this=$(this);
                var orderId=$(this).attr("orderId");
                $(this).load("deleteOrderByOrderId", {"orderId": orderId},function (result) {
                    if(result=='true'){
                        _this.parent().parent().remove();
                    }
                });
            });
        })
    </script>
</head>

<body>
<jsp:include page="share.jsp"></jsp:include>
<div id="templatemo_wrapper_sp">
<div id="templatemo_header_wsp">
	<div id="templatemo_header" class="header_subpage">
    	<div id="site_title"></div>

        <jsp:include page="title.jsp"/>

        <a href="#" title=""  class="site_repeat" target="_blank"><img src="images/top_repeat.png" title=""  /></a><!-- end of templatemo_menu -->

    </div> <!-- END of header -->
</div> <!-- END of header wrapper -->
<div id="templatemo_main_wrapper">
<div id="templatemo_main">


    <jsp:include page="left.jsp"/>


    <c:forEach items="${orderMap}" var="om">
        <div style="margin: 0 auto;float: right;width: 700px;background: rgba(248,248,255,0.8);border-radius: 5px;margin-bottom: 35px;">
            <h3 style="background: rgba(88,120,36,1);padding-bottom: 10px;padding-left: 10px;padding-top: 10px;border-radius: 5px;width: 695px;margin-left: -2px;">订单信息
                <c:if test="${om.key.paystate==0}">
                <a href="javascript:void(0)" orderId="${om.key.orderId}" class="deleteOrder" style="font-size:15px;color:red;margin-left: 540px;">删除订单</a>
                </c:if>
            </h3>
            <table width="700" border="0" cellpadding="0"
                   cellspacing="1" style="background:#d8d8d8;color:#333333;">
                <tr style="border-top: 1px solid;background-color: #636363">
                    <th width="247" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">商品名称</th>
                    <th width="231" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">商品单价</th>
                    <th width="214" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">购买数量</th>
                    <th width="232" align="center" valign="middle" style="color:ghostwhite;font-weight: 100">总价</th>
                </tr>
                <c:forEach items="${om.value}" var="p">
                    <tr>
                        <td align="center" valign="middle" bgcolor="#FFFFFF">${p.productName}</td>
                        <td align="center" valign="middle" bgcolor="#FFFFFF">${p.productPrice}元</td>
                        <td align="center" valign="middle" bgcolor="#FFFFFF">${p.buynum}件</td>
                        <td align="center" valign="middle" bgcolor="#FFFFFF">${p.productPrice*p.buynum}元</td>
                    </tr>
                </c:forEach>
            </table>
            <dl class="Order_information">
                <dd style="line-height: 26px;">
                    订单编号：${om.key.orderId}
                    <br />
                    收货人：${om.key.receiveInfo.receiver}
                    <br />
                    收货人联系方式：${om.key.receiveInfo.receiveTelephone}
                    <br />
                    下单时间：<fmt:formatDate value="${om.key.orderTime}" pattern="yyyy年MM月dd日"/>
                    <br />

                    支付状态：
                    <c:if test="${om.key.paystate==0}">
                        <font color="red">未支付</font>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${om.key.paystate==1}">
                        <font color="blue">已支付</font>&nbsp;&nbsp;
                    </c:if>
                    <br />
                    所属用户：${userINFO.username}
                    <br/>
                    收货地址：${om.key.receiveInfo.receiveAddress}
                    <br />
                    支付方式：在线支付
                    <br/>
                    <span style="font-weight: bold;color: #FE5E0F">订单总额：${om.key.money}元</span>
                </dd>
                <br/>
                <br/>
                <c:if test="${om.key.paystate==0}">
                    <div class="right"><a href="topay?orderId=${om.key.orderId}&money=${om.key.money}" class="button">去结算</a></div>&nbsp;&nbsp;
                </c:if>
            </dl>
        </div>
    </c:forEach>

        
    </div>
    
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->


<jsp:include page="footer.jsp"/>
</div>

</body>
<script type='text/javascript' src='js/logging.js'></script>
</html>