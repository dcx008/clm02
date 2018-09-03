<%--
  Created by IntelliJ IDEA.
  User: BIG
  Date: 2017/10/20
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <jsp:include page="head.jsp"/>
    <title>3D饼状图</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span class="c-gray en">&gt;</span> 3D饼状图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">刷新</i></a></nav>
<div class="page-container">

    <div id="container" style="min-width:1000px;height:700px"></div>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="foot.jsp"/><!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="js/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="js/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="js/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript">

   /* var json =JSON.parse(date)*/
    /*console.log(JSON.parse(date))*/
  /* var zNodes =
           alert(zNodes)*/
  /* var json =JSON.parse(date.key())
*/
   /*function toJson(mapJSON){
       var json = (new Function("return " + mapJSON))();
       alert(json)
       return json;
   }*/
   var zNodes =${mapJSON};
           console.log(zNodes);
   var DATA=[];
   for(var i=0;i<zNodes.length;i++){

       DATA.push([zNodes[i].category,zNodes[i].buynum]);
   };


 /*  var obj = jQuery.parseJSON(data)*/

   $(function () {
       $('#container').highcharts({
           chart: {
               type: 'pie',
               options3d: {
                   enabled: true,
                   alpha: 45,
                   beta: 0
               }
           },
           title: {
               text: '最新人气菜品推荐'
           },
           tooltip: {
               pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   depth: 35,
                   dataLabels: {
                       enabled: true,
                       format: '{point.name}'
                   }
               }
           },
           series: [{
               type: 'pie',
               name: 'Browser share',
               data: DATA,


           }]
       });
   });
</script>
</body>
</html>