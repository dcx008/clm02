<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: BIG
  Date: 2017/10/20
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="head.jsp"/>
    <script language="javascript" src="../../js/date/common.js"></script>
    <script type="text/javascript" src="js/date/datepicker/WdatePicker.js"></script>
    <title>订单列表</title>
</head>
<body>
<form name="icform" method="post">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">刷新</i></a></nav>
<div class="page-container">

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l"><a href="order-list" onclick="" class="btn btn-danger radius" style="background-color:#00c800;border-color:#00c800"><i class="Hui-iconfont">&#xe6e2;</i> 全部订单</a> </span>
        <span class="l"><a href="order-paystate?payState=0" onclick="" class="btn btn-danger radius" style=" "><i class="Hui-iconfont">&#xe6e2;</i> 未支付</a> </span>
        <span class="l"><a href="order-paystate?payState=1" onclick="" class="btn btn-danger radius" style="background-color:#00c800;border-color:#00c800"><i class="Hui-iconfont">&#xe6e2;</i> 已支付</a> </span>
        <span class="l"><a href="#" onclick="not_null('orders-delete','_self');this.blur();" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span>
        <span class="l"><a href="#" onclick="order_print('order-print','_self');this.blur();" class="btn btn-danger radius" style="background-color:#00c800;border-color:#00c800"><i class="Hui-iconfont">&#xe6e2;</i> 批量打印</a> </span>
        <span class="r">共有数据：<strong>${num}</strong> 条</span> </div>
    <div class="mt-20">

        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="80">订单ID</th>
                <th width="80">用户ID</th>
                <th width="80">收货人</th>
                <th width="100">收货地址</th>
                <th width="80">订单总价</th>
                <th width="120">下单时间</th>
                <th width="80">订单状态</th>
                <th width="100">操作</th>
            </tr>

            </thead>

            <tbody>
                <c:forEach items="${orderList}" var="o" varStatus="status">
                <tr class="text-c">
                    <td><input name="orderId" type="checkbox" value="${o.orderId}" ></td>
                    <td><a href="order-show?orderId=${o.orderId}"><strong>${o.orderId}</strong></a></td>
                    <td>${o.user.userId}</td>
                    <td>${o.receiveInfo.receiver}</td>
                    <td>${o.receiveInfo.receiveAddress}</td>
                    <td class="text-c">${o.money}</td>
                    <td><fmt:formatDate value="${o.orderTime}" pattern="yyyy-MM-dd"/></td>
                    <td class="td-status">
                        <c:if test="${o.paystate==1}"><a href="stop?orderId=${o.orderId}" style="color: green">已支付</a></c:if>
                        <c:if test="${o.paystate==0}"><a href="start?orderId=${o.orderId}" style="color: red">未支付</a></c:if>
                    </td>
                    <td class="td-manage"><a style="text-decoration:none" onClick="picture_stop(this,'${o.orderId}')" href="javascript:;" title="下架"><i class="Hui-iconfont">下架</i></a>
                        <a style="text-decoration:none" class="ml-5" onClick="$(this).load('order-delete',{'orderId': ${o.orderId}},function(result) {
                          if(result=='true'){
                            $(this).parents('tr').remove()
                          }
                        });" href="javascript:;" title="删除"><i class="Hui-iconfont" style="color:#aa5500">删除</i></a></td>
                </tr>
                </c:forEach>
            </tbody>



        </table>
    </div>
</div>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="foot.jsp"/> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../../js/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../js/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../js/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,6]}// 制定列不参与排序
        ]
    });

    /*订单查看*/
    function order_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    function order_print(url,h){

        var check = document.getElementsByTagName('input');


        for(i=0;i<check.length;i++){
            if(check[i].checked==true){//选中
                formSubmit(url,h);
                return false;
            }
        }

        alert("请选择想要批量打印的订单");
        //return true;
    }

    function not_null(url,h){

        var check = document.getElementsByTagName('input');


            for(i=0;i<check.length;i++){
                if(check[i].checked==true){//选中
                    //alert("已选择删除的对象");
                    formSubmit(url,h);
                    return false;
                }
            }

        alert("请选择想要批量删除的对象");
        //return true;
    }

    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }



    /*图片-查看*/
    function picture_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-审核*/
    function picture_shenhe(obj,id){
        layer.confirm('审核文章？', {
                    btn: ['通过','不通过'],
                    shade: false
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                    $(obj).remove();
                    layer.msg('已发布', {icon:6,time:1000});
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                    $(obj).remove();
                    layer.msg('未通过', {icon:5,time:1000});
                });
    }

    /*图片-下架*/
    function picture_stop(obj,id){
        layer.confirm('订单未完成？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-warning radius">未完成</span>');
            $(obj).remove();
            layer.msg('未完成',{icon: 5,time:1000});
        });
    }

    /*图片-发布*/
    function picture_start(obj,id){
        layer.confirm('订单已完成？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已完成</span>');
            $(obj).remove();
            layer.msg('已完成!',{icon: 6,time:1000});
        });
    }

    /*图片-申请上线*/
    function picture_shenqing(obj,id){
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
    }

    /*图片-编辑*/
    function picture_edit(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-删除*/
    function picture_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>
    </form>
</body>
</html>