<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>选择收货地址</title>
    <jsp:include page="header.jsp"/>
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
    
    <div id="content" class="right">

        <form action="/generateOrder" method="post" style="background-color: cadetblue;">
            <h3>确认收货地址</h3>
            <c:forEach items="${receiveInfoList}" var="r">
                <input name="receiveInfoId" class="" type="radio" value="${r.receiveInfoId}" <c:if test="${userINFO.userInfo.address==r.receiveAddress}">checked</c:if>>${r.receiveAddress} (${r.receiver} 收) <em>${r.receiveTelephone}</em></input>
                <div class=""><a href="/updateReceiveInfo?receiveInfoId=${r.receiveInfoId}" class="" style="font-size:12px;color:blue">修改收货地址</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/deleteReceiveInfo?receiveInfoId=${r.receiveInfoId}" class="" style="font-size:12px;color:blue">删除收货地址</a></div>
                <br/>
            </c:forEach>

            <div class="left"> <a href="/addNewReceiveInfo" class="button" style="font-size:12px">使用新地址</a></div>
            <div class="cleaner h40"></div>
            <div class="right"><input type="submit" value="生成订单"/></div>
        </form>


           
        
    </div>
    
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->

<jsp:include page="footer.jsp"/>
</div>

</body>
<script type='text/javascript' src='js/logging.js'></script>
</html>