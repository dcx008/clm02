<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>收货信息</title>
    <jsp:include page="header.jsp"/>

    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        p{margin-left:5px; font-size:14px;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?ak=0U9NKzX4swaS2mOQI5QUyQgUKa6GAF8b&v=2.0&services=false"></script>
    <script type="text/javascript">
        //失去焦点函数

        $("#receive_address").ready(function(){


            $("input").blur(function(){
                var receive_address = document.getElementById("receive_address").value;
                var local = new BMap.LocalSearch(map, {
                    renderOptions:{map: map}
                });

                local.search(receive_address);

            });

        });
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
    
    <div id="content" class="right">
    	<h2>新增收货信息</h2>
        
		<h3>收获详细信息</h3>
        <form action="/addUserNewReceiveInfo">
            <div class="content_half left form_field" style="color:white">
                收货人：
                <input name="receiver" type="text" id="receiver" maxlength="40" />				<br/>
                收货地址:
                <input name="receiveAddress" type="text" id="receive_address" maxlength="40" />				<br/>
                收货时间:
                <input name="receiveTime" type="date" id="receive_time" maxlength="40" />
            </div>

            <div class="content_half right form_field" style="color:white">
                邮编:
                <input name="postCode" type="text" id="postcode" maxlength="40" />
                电话:
                <input name="receiveTelephone" type="text" id="receive_telepho" maxlength="40" />
                <span style="color:red">(必填信息)</span>
            </div>



            <div class="cleaner h40"></div>

            <input type="submit" style="margin-left: 650px" value="确认"/>
        </form>


        <div>
            <input name="search" type="text" id="search" maxlength="40" />
            <input type="button" name="" id="btn" value="查询" onclick="get()"/>
        </div>
        <!-- 地图-->
        <div id="content1" class="content" style="margin-top: 20px;margin-bottom: 50px">
            <div style="width:600px;height:470px;border:0px solid gray" id="container"></div>
            <p id="aa" style="color: red"></p>
            <script type="text/javascript">
                //创建Map实例
                var map = new BMap.Map("container");
                var point = new BMap.Point(120.140121,30.283079);
                map.centerAndZoom(point,15);
                //添加鼠标滚动缩放
                map.enableScrollWheelZoom();

                //添加缩略图控件
                map.addControl(new BMap.OverviewMapControl({isOpen:false,anchor:BMAP_ANCHOR_BOTTOM_RIGHT}));
                //添加缩放平移控件
                map.addControl(new BMap.NavigationControl());
                //添加比例尺控件
                map.addControl(new BMap.ScaleControl());
                //添加地图类型控件
                map.addControl(new BMap.MapTypeControl());

                //设置标注的图标
                var icon = new BMap.Icon("images/hello.png",new BMap.Size(50,70));
                //设置标注的经纬度
                var marker = new BMap.Marker(new BMap.Point(120.140121,30.283079),{icon:icon});
                var stCtrl = new BMap.PanoramaControl(); //构造全景控件
                stCtrl.setOffset(new BMap.Size(20, 40));
                map.addControl(stCtrl);//添加全景控件
                //把标注添加到地图上
                map.addOverlay(marker);
                var content = "&lt;table>";
                content = content + "&lt;tr>&lt;td> 编号：007&lt;/td>&lt;/tr>";
                content = content + "&lt;tr>&lt;td> 地点：西湖区仓地火炬大厦&lt;/td>&lt;/tr>";
                content = content + "&lt;tr>&lt;td> 时间：2017-10-21&lt;/td>&lt;/tr>";
                content += "</table>";
                var infowindow = new BMap.InfoWindow(content);
                marker.addEventListener("click",function(){
                    this.openInfoWindow(infowindow);
                });



                var geoc = new BMap.Geocoder();

                //点击地图，获取经纬度坐标
                map.addEventListener("click",function(e){
                    var pt = e.point;
                    geoc.getLocation(pt, function(rs){
                        var addComp = rs.addressComponents;
                        <!--alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);-->
                        document.getElementById("receive_address").value=addComp.province  + addComp.city + addComp.district + addComp.street  + addComp.streetNumber;
                        document.getElementById("aa").innerHTML ="你点击的地址是:"+addComp.province  + addComp.city + addComp.district + addComp.street  + addComp.streetNumber;
                    });

                });
                var navigationControl = new BMap.NavigationControl({
                    // 靠左上角位置
                    anchor: BMAP_ANCHOR_TOP_LEFT,
                    // LARGE类型
                    type: BMAP_NAVIGATION_CONTROL_LARGE,
                    // 启用显示定位
                    //enableGeolocation: true
                });
                map.addControl(navigationControl);
                // 添加定位控件
                var geolocationControl = new BMap.GeolocationControl();
                geolocationControl.addEventListener("locationSuccess", function(e){
                    // 定位成功事件
                    var address = '';
                    address += e.addressComponent.province;
                    address += e.addressComponent.city;
                    address += e.addressComponent.district;
                    address += e.addressComponent.street;
                    address += e.addressComponent.streetNumber;
                    <!--alert("当前定位地址为：" + address);-->
                });
                geolocationControl.addEventListener("locationError",function(e){
                    // 定位失败事件
                    alert(e.message);
                });
                map.addControl(geolocationControl);
                //map.enableScrollWheelZoom();
                //map.enableInertialDragging();

                //map.enableContinuousZoom();

                var size = new BMap.Size(50, 20);
                map.addControl(new BMap.CityListControl({
                    anchor: BMAP_ANCHOR_TOP_LEFT,
                    offset: size,
                    // 切换城市之间事件
                    // onChangeBefore: function(){
                    //    alert('before');
                    // },
                    // 切换城市之后事件
                    // onChangeAfter:function(){
                    //   alert('after');
                    // }
                }));


                var local = new BMap.LocalSearch(map, {
                    renderOptions:{map: map}
                });
                function get(){
                    local.search(document.getElementById("search").value);
                };

            </script>
        </div>
    </div>
            

           
        
    </div>
    
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->


    <jsp:include page="footer.jsp"/>

</div>

</body>
<script type='text/javascript' src='js/logging.js'></script>
</html>