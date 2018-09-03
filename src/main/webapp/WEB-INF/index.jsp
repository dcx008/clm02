<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>撑了么主页</title>
    <jsp:include page="header.jsp"/>
</head>

<body>

<jsp:include page="share.jsp"></jsp:include>

<div id="templatemo_wrapper_h">
    <div id="templatemo_header_wh">
        <div id="templatemo_header" class="header_home">
            <div id="site_title"></div>

            <jsp:include page="title.jsp"/>


            <div class="slider-wrapper theme-orman">
                <!--<div class="ribbon"></div>-->
                <div id="slider" class="nivoSlider">
                    <img src="images/portfolio/01.jpg" alt="slider image 1" />

                    <img src="images/portfolio/02.jpg" alt="slider image 2"/>

                    <img src="images/portfolio/03.jpg" alt="slider image 3" />
                    <img src="images/portfolio/04.jpg" alt="slider image 4" title="#htmlcaption" />
                    <img src="images/portfolio/05.jpg" alt="slider image 5" title="#htmlcaption" />
                </div>

            </div>
            <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
            <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
            <script type="text/javascript">
                $(window).load(function() {
                    $('#slider').nivoSlider({
                        controlNav:false
                    });
                });
            </script>
        </div> <!-- END of header -->
    </div> <!-- END of header wrapper -->
</body>
<script type='text/javascript' src='js/logging.js'></script>
</html>