<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品详情</title>
    <jsp:include page="header.jsp"/>
</head>

<body>
<jsp:include page="share.jsp"></jsp:include>
<div id="templatemo_wrapper_sp">
<div id="templatemo_header_wsp">
	<div id="templatemo_header" class="header_subpage">
    	<div id="site_title"></div>

        <jsp:include page="title.jsp"/>

        <a href="#"   class="site_repeat" ><img src="images/top_repeat.png" title="#/"  /></a><!-- end of templatemo_menu -->
       
    </div> <!-- END of header -->
</div> <!-- END of header wrapper -->
<div id="templatemo_main_wrapper">
<div id="templatemo_main">

    <jsp:include page="left.jsp"/>
    
    <div id="content" class="right" style="background-color: cadetblue;">
      	<h2 style="background-color: sienna;">商品详细信息</h2>
        <div class="content_half left">
        	<a rel="lightbox" href="javascript:void(0)"><img src="${product.imgurl}" width="300px" height="300px" alt="产品图片" style="margin-left: 36px;"/></a>
        </div>
        <form action="/toShoppingCart" method="post" style="width: 260px;float: right;">
            <div class="content_half right">
                <table style="color:white">
                    <tr>
                        <td width="130">价格:</td>
                        <td width="84">￥${product.productPrice}</td>
                    </tr>
                    <tr>
                        <td>剩余数量:</td>
                        <td><strong>${product.pnum}</strong></td>
                    </tr>
                    <tr>
                        <td>购买数量：</td>
                        <td><a id="min" href="javascript:void(0)" class="delNum" style="color: paleturquoise;font-weight: bold">-</a>
                            <input id="text_box" type="text" value="1" size="6" maxlength="2" style="text-align:center;width: 35px" name="buynum"/>
                            <a id="add" href="javascript:void(0)" class="addNum" style="color: paleturquoise;font-weight: bold">+</a>
                        </td>

                    </tr>
                </table>
                <div class="cleaner h20"></div>
                <input type="hidden" value="${product.productId}" name="productId"/>
                <input type="submit" value="添加到购物车"/>
            </div>
        </form>
            <div class="cleaner h40"></div>
            
            <h4 style="text-align: center;">商品描述</h4>
            <p style="text-align: center;">${product.description}</p>



        <h4 style="text-align: center;">用户评论</h4>

        <table style="text-align: center;width:680px;border: 1px solid #B0CB95; margin-bottom: 20px;background-color: ghostwhite;margin: auto">
            <tr >
                <td style="width: 150px">评论者</td>
                <td >评论内容</td>
                <td style="width: 150px">评论时间</td>
            </tr>
            <c:forEach items="${commentList}" var="c">
                <tr style="font-size: 5px;">
                    <td>${c.user.username}</td>
                    <td style="text-align:center;height:auto;word-wrap:break-word;word-break:break-all;overflow: hidden; ">${c.comment}</td>
                    <td><fmt:formatDate value="${c.commentTime}" pattern="yyyy/MM/dd HH:mm:ss"></fmt:formatDate></td>
                </tr>
            </c:forEach>

        </table>
        <h1 style="text-align: center;color: red">${errorMesg}</h1>
        <form action="/addCommentByUser/${product.productId}" method="post" style="text-align: center">
            <textarea rows="5" cols="90" name="comment" style="margin-top: 10px"></textarea><br/>
            <input type="submit" value="提交评论"/>
        </form>

			<div class="cleaner h40"></div>


    </div>
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->

<jsp:include page="footer.jsp"/>
</div>

</body>
<script type='text/javascript' src='js/logging.js'></script>
<script type="text/javascript">
    $(document).ready(function() {
        //获得文本框对象
        var t = $("#text_box");
        //初始化数量为1,并失效减
        $('#min').attr('disabled', true);
        //数量增加操作
        $("#add").click(function() {
            t.val(parseInt(t.val()) + 1)
            if (parseInt(t.val()) != 1) {
                $('#min').attr('disabled', false);
            }
        })
        //数量减少操作
        $("#min").click(function() {
            t.val(parseInt(t.val()) - 1);
            if (parseInt(t.val()) <= 1) {
                t.val(1);
            }
        })
    })
</script>
</html>