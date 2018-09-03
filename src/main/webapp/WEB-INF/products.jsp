<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="clm" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>全部商品信息</title>
    <jsp:include page="header.jsp"/>
</head>

<body>
<jsp:include page="share.jsp"></jsp:include>
<div id="templatemo_wrapper_sp">
    <div id="templatemo_header_wsp">
        <div id="templatemo_header" class="header_subpage">
            <div id="site_title"></div>

            <%--引入的标题信息--%>
            <jsp:include page="title.jsp"/>

            <a href="#" title="免费图片素材 from cn.hiresimage.com"  class="site_repeat" target="_blank"><img src="images/top_repeat.png"  alt="免费图片素材" /></a><!-- end of templatemo_menu -->

        </div> <!-- END of header -->
    </div> <!-- END of header wrapper -->


    <div id="templatemo_main_wrapper">
        <div id="templatemo_main">

            <%--引入的左侧一栏信息表--%>
            <jsp:include page="left.jsp"/>

            <div id="content" class="right">
                <div id="search_div" style="border-radius: 5px">
                    <form method="post" action="/search">
                        <span class="input_span">商品名：<input type="text" name="productName" style="border-radius: 5px" value="${productName}"/></span>
                        <span class="input_span">商品种类：<input type="text" name="category" style="border-radius: 5px" value="${category}"/></span>
                        <span class="input_span">商品价格区间：<input type="text" name="minprice" style="border-radius: 5px" value="${minprice}"/> - <input type="text" name="maxprice" style="border-radius: 5px" value="${maxprice}"/></span>
                        &nbsp;&nbsp;
                        <input type="submit" value="查 询" style="border-radius: 7px;margin-left: 0px">
                    </form>
                </div>
                <br/>
                <h2 style="background-color: darkolivegreen;border-radius: 5px;">
                    <c:if test="${empty title}">${pro.category}</c:if>
                    <c:if test="${!empty title}">${title}</c:if>
                </h2>
                <div style="height: 580px">
                    <c:set var="amount" value="${0}"></c:set>
                    <c:forEach items="${productList}" var="u" varStatus="status">
                        <div class="product_box" style="background-color:darkcyan;<c:if test="${status.count>8}">display:none</c:if>" num="${status.count}">
                            <a href="toproductdetail?productId=${u.productId}"><img src="${u.imgurl}" alt="floral set 1" style="width:165px;height:165px"/></a>
                            <h3>${u.productName}</h3>
                            <p class="product_price">￥${u.productPrice}</p>
                            <p class="add_to_cart" style="margin-bottom: 0px">
                                <a href="toproductdetail?productId=${u.productId}" style="font-size: 10px">商品详情</a>
                                <a href="toShoppingCart?productId=${u.productId}&&buynum=1" style="font-size: 10px">添加到购物车</a>
                            </p>
                        </div>
                        <c:set var="amount" value="${status.count}"></c:set>
                    </c:forEach>

                    <div class="cleaner h20"></div>
                </div>


                <ul style="text-align: center;text-align: center;background-color: rgba(240,255,255,0.7);padding-bottom: 10px;padding-top: 10px;border-radius: 10px;">
                    <li id="previous" style="display: inline-block"><a href="javascript:void(0)" num="1" style="color: darkblue;"><< </a></li>
                    <c:forEach begin="1" end="${amount%8==0?amount/8:amount/8+1}" step="1" var="x">
                        <li style="display: inline-block;"><a href="javascript:void(0)" style="color: #0A246A" class="numbtn" num="${x}">[${x}]</a></li>
                    </c:forEach>
                    <li id="next" style="display: inline-block"><a href="javascript:void(0)" num="${amount%8==0?amount/8:amount/8+1}" style="color: darkblue;"> >></a></li>
                </ul>
                <script type="text/javascript">
                    $(function(){
                        $("#previous").click(function(){
                            var page=parseInt($(this).attr("num"));
                            if(page==1){
                                return;
                            }else{
                                page=page-1;
                                var min=page*8-8+1;
                                var max=page*8;
                                $(".product_box").each(function(){
                                    if(parseInt($(this).attr("num"))<min||parseInt($(this).attr("num"))>max) $(this).css("display","none");
                                    else $(this).css("display","display");
                                })
                                $("#next").attr("num",page);
                                $("#previous").attr("num",page);
                                $(".numbtn[num="+(page+1)+"]").css({"color":"black","background-color":"none","border-radius":"0px","padding-bottom":"0px"});
                                $(".numbtn[num="+page+"]").css({"color":"#0A246A","background-color":"cadetblue","border-radius":"5px","padding-bottom":"3px"});
                            }
                        })
                        $("#next").click(function(){
                            var page=parseInt($(this).attr("num"));
                            if(page==${amount%8==0?amount/8:amount/8+1}){
                                return;
                            }else{
                                page=page+1;
                                var min=page*8-8+1;
                                var max=page*8;
                                $(".product_box").each(function(){
                                    if(parseInt($(this).attr("num"))<min||parseInt($(this).attr("num"))>max) $(this).css("display","none");
                                    else $(this).css("display","display");
                                })
                                $("#next").attr("num",page);
                                $("#previous").attr("num",page);
                                $(".numbtn[num="+(page-1)+"]").css({"color":"black","background-color":"none","border-radius":"0px","padding-bottom":"0px"});
                                $(".numbtn[num="+page+"]").css({"color":"#0A246A","background-color":"cadetblue","border-radius":"5px","padding-bottom":"3px"});
                            }
                        })
                        $(".numbtn").click(function(){
                            var page=parseInt($(this).attr("num"));
                            var min=page*8-8+1;
                            var max=page*8;
                            $(".product_box").each(function(){
                                if(parseInt($(this).attr("num"))<min||parseInt($(this).attr("num"))>max) $(this).css("display","none");
                                else $(this).css("display","display");
                            })
                            $("#next").attr("num",page);
                            $("#previous").attr("num",page);
                            $(".numbtn").each(function(){
                                $(this).css({"color":"black","background-color":"none","border-radius":"0px","padding-bottom":"0px"});
                            })
                            $(".numbtn[num="+page+"]").css({"color":"#0A246A","background-color":"cadetblue","border-radius":"5px","padding-bottom":"3px"});
                        })

                    })
                </script>


            </div>
            <div class="cleaner"></div>
        </div> <!-- END of main -->
    </div> <!-- END of main wrapper -->


    <jsp:include page="footer.jsp"/>


</div>

</body>
<script type='text/javascript' src='${clm}/js/logging.js'></script>
</html>