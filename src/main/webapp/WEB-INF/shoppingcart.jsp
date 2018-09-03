<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>购物车</title>
    <jsp:include page="header.jsp"/>
</head>

<body>
<jsp:include page="share.jsp"></jsp:include>
<div id="templatemo_wrapper_sp">
<div id="templatemo_header_wsp">
	<div id="templatemo_header" class="header_subpage">
    	<div id="site_title"></div>

        <jsp:include page="title.jsp"/>

        <a href="#" title="免费的图像"  class="site_repeat" ><img src="images/top_repeat.png" title="免费的图像"  /></a><!-- end of templatemo_menu -->

    </div> <!-- END of header -->
</div> <!-- END of header wrapper -->
<div id="templatemo_main_wrapper">
<div id="templatemo_main">


    <jsp:include page="left.jsp"/>


    <div id="content" class="right">
    	<h2>购物车</h2>
		<table width="700" border="0" cellpadding="5" cellspacing="0">
          	<tr bgcolor="#434343" style="color:white">
                <th width="168" align="left">已选商品</th> 
                <th width="188" align="left">商品描述</th> 
                <th width="60" align="center">数量</th> 
                <th width="80" align="right">价格</th> 
                <th width="80" align="right">总价</th> 
                <th width="64"> </th>
          	</tr>
            <c:set var="totalPrice" value="${0}"></c:set>
            <c:forEach items="${productList}" var="p">
                <tr bgcolor="#E7E7E7">
                    <td><img src="${p.imgurl}" alt="flower image 1" width="166px" height="166px"/></td>
                    <td>${p.productName}</td>
                    <td align="center">
                        <a href="javascript:void(0)" class="min" style="color: #e79e05;font-weight: bold">-</a>
                        <input name="quantity1" type="text" id="quantity1" value="${p.buynum}" size="6" maxlength="2" style="text-align:center;width: 25px"/>
                        <a href="javascript:void(0)" class="add" style="color: #e79e05;font-weight: bold">+</a>
                    </td>
                    <td align="right">￥${p.productPrice}</td>
                    <td align="right">￥${p.productPrice*p.buynum}</td>
                    <td align="center"><a class="deleteButton" href="javascript:void(0)" idvalue="${p.productId}"><img src="images/remove.png" alt="remove" /><br />删除</a> </td>
                    <c:set var="totalPrice" value="${totalPrice+p.productPrice*p.buynum}"></c:set>
                </tr>
            </c:forEach>

		<h1/>
        <tr bgcolor="#434343">
                <td colspan="3"></td>
                <td align="right"><h4>总价:</h4></td>
                <td align="right"><h4 id="totalPrice">￥${totalPrice}</h4></td>
                <td> </td>
            </tr>
        </table>
		<div class="cleaner h20"></div>
        <div class="right"><a href="toCheckoutAllProduct" class="button">提交订单</a></div>
        <div class="cleaner h20"></div>   
    </div>
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->



<jsp:include page="footer.jsp"/>

</div>

</body>
<script type='text/javascript' src='js/logging.js'></script>
<script>
    $(function () {
            $(".deleteButton").click(function () {
                var productId=$(this).attr("idvalue");
                //alert(productId);
                var _this=$(this);
                $(this).load("/deleteProductInShoopingCart", {"productId": productId},function (result) {
                  if(result=='true'){
                      _this.parents("tr").remove();
                      var total=parseInt($("#totalPrice").text().split("￥")[1]);
                      var subTotal=parseInt(_this.parent().prev().text().split("￥")[1]);
                      $("#totalPrice").text("￥"+(total-subTotal));
                  }
                });

            })


                //数量增加操作
                $("#add").click(function() {
                    this.prev().val(parseInt(this.prev().val()) + 1)
                })
                //数量减少操作
                $("#min").click(function() {
                    this.next().val(parseInt(this.next().val()) - 1);
                    if (parseInt(this.next().val()) <= 1) {
                        this.next().val(1);
                    }
                })

    })
</script>
</html>