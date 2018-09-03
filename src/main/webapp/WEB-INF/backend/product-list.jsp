<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BIG
  Date: 2017/10/20
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="head.jsp"/>
    <title>产品列表</title>
</head>
<body>
<form name="icform" method="post">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span>产品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">刷新</i></a></nav>

    <div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span class="l">
                <a href="#" onclick="not_null('product-dels','_self');this.blur();" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span>&nbsp&nbsp&nbsp
        <span><a class="btn btn-primary radius" data-title="添加商品" data-href="product-add" onclick="Hui_admin_tab(this)"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a></span>
        <span class="r">共有数据：<strong>${count}</strong> 条</span>
    </div>
    <div>
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c" >
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">产品ID</th>
                <th width="80">产品名</th>
                <th width="100">产品价格</th>
                <th width="180">产品分类</th>
                <th width="120">商品图片</th>
                <th width="60">产品数量</th>
                <th width="60">备注信息</th>
                <th width="60">发布状态</th>
                <th width="120">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="p">
                <tr >
                    <td style="text-align: center"><input type="checkbox" value="${p.productId}" name="productId"></td>
                    <td style="text-align: center">${p.productId}</td>
                    <td style="text-align: center">${p.productName}</td>
                    <td style="text-align: center">${p.productPrice}</td>
                    <td style="text-align: center">${p.category}</td>
                    <td><p style="text-align: center"><img src="${p.imgurl}" style="width: 140px;height: 80px" ></p></td>
                    <td style="text-align: center">${p.pnum}</td>
                    <td style="text-align: center">${p.remark}</td>
                    <td class="td-status" style="text-align: center"><span class="label label-success radius">已发布</span></td>
                    <td style="text-align: center">
                        <a style="text-decoration:none" onClick="article_stop(this,'10001')" href="javascript:;" title="下架"><i class="Hui-iconfont" style="font-style: normal;font-size: smaller">下架</i></a>
                        <a style="text-decoration:none" class="ml-5" onClick="article_edit(${p.productId})" href="product-edit?productId=${p.productId}" title="编辑"><i class="Hui-iconfont" style="color: #00c800">编辑</i></a>
                        <a onclick="$(this).load('product-del',{'productId': ${p.productId}},function(result) {
                                if(result=='true'){
                                $(this).parents('tr').remove()
                                }
                                });
                                " title="删除" ><i style="font-style: normal;color: #aa5500">删除</i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="foot.jsp"/>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="js/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="js/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">


    function formSubmit (url,sTarget){
        document.forms[0].target = sTarget //在当前页面中进行展现
        document.forms[0].action = url;    //sysadmin/dept/start
        document.forms[0].submit();
        return true;
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


    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "pading":false,
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,8]}// 不参与排序的列
        ]
    });

    /*资讯-添加*/
    function article_add(title,url,w,h){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*资讯-编辑*/
    function article_edit(id){
        var lis =document.getElementsByTagName("a");
        for (var i = 0; i < lis.length; i++) {
            lis[i]._index = i;
            lis[i].onclick = function() {
                alert(lis[this._index].innerHTML);
            };
        }
    }
    /*资讯-删除*/
    function article_del2(obj,id) {
        $(this).empty();
    }
    function article_del(obj,id) {
        $(this).load("backendProductDelete", {productId:id},function (result) {
            if(result=='true'){
                alert(1);
                $(this).parent("tr").remove();
            }
        });
    }
    /*资讯-审核*/
    function article_shenhe(obj,id){
        layer.confirm('审核文章？', {
                    btn: ['通过','不通过','取消'],
                    shade: false,
                    closeBtn: 0
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                    $(obj).remove();
                    layer.msg('已发布', {icon:6,time:1000});
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                    $(obj).remove();
                    layer.msg('未通过', {icon:5,time:1000});
                });
    }
    /*资讯-下架*/
    function article_stop(obj,id){
        layer.confirm('确认要下架吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
            $(obj).remove();
            layer.msg('已下架!',{icon: 5,time:1000});
        });
    }

    /*资讯-发布*/
    function article_start(obj,id){
        layer.confirm('确认要发布吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!',{icon: 6,time:1000});
        });
    }
    /*资讯-申请上线*/
    function article_shenqing(obj,id){
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
    }

</script>
</form>
</body>
</html>