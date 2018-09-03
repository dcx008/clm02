<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>\
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="free template, floral shop, ecommerce, online shopping, store" />
<meta name="description" content="Floral Shop is free website template for ecommerce or online shopping websites. Products, Shopping Cart, FAQs and Checkout pages are included." />
<link href="${ctx}/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctx}/css/orman.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${ctx}/css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/ddsmoothmenu.css" />
<script language="javascript" src="${ctx}/js/date/common.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/ddsmoothmenu.js"></script>
<script type="text/javascript">
    ddsmoothmenu.init({
        mainmenuid: "templatemo_menu", //menu DIV id
        orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
        classname: 'ddsmoothmenu', //class added to menu's outer DIV
        //customtheme: ["#1c5a80", "#18374a"],
        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })
    function clearText(field)
    {
        if (field.defaultValue == field.value) field.value = '';
        else if (field.value == '') field.value = field.defaultValue;
    }
</script>
<link rel="stylesheet" href="${ctx}/css/slimbox2.css" type="text/css" media="screen" />
<script type="text/JavaScript" src="${ctx}/js/slimbox2.js"></script>