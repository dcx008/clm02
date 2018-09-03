<%--
  Created by IntelliJ IDEA.
  User: BIG
  Date: 2017/10/20
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
   <jsp:include page="head.jsp"/>
    <title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">刷新</i></a></nav>
<div class="page-container">
    <div class="text-c">
<form action="/searchMoUser" method="post">
        <input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="keyword">
        <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
</form>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','member-add','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有数据：<strong></strong> 条</span> </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="all" value=""></th>
                <th width="80">用户ID</th>
                <th width="100">用户名</th>
                <th width="40">用户等级</th>
                <th width="90">地址</th>
                <th width="70">电话</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="sum" value="0"></c:set>
            <c:forEach items="${userList}" var="u">
            <tr class="text-c">
                <td><input type="checkbox" value="1" name="check"></td>
                <td  name="user">${u.userId}</td>
                <td><a style="cursor:pointer" class="text-primary" onclick="member_show('张三','/member-show','10001','360','400')">${u.username}</a></td>
                <td>${u.level}</td>
                <td>${u.userInfo.address}</td>
                <td class="td-status"><span class="label label-success radius">${u.userInfo.telephone}</span></td>
                <td class="td-manage">
                    <a title="编辑" id="bian" href="javascript:;" onclick="member_edit('编辑','/member-edit','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont" style="color: #00c800">编辑</i></a>
                    <a title="删除" href="javascript:;" id="${u.userId}" onclick="member_del(this)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont" style="color:#aa5500">删除</i></a></td>
            </tr>
                <c:set var="sum" value="${sum+1}"/>
            </c:forEach>
            </tbody>
            <td hidden="hidden">${sum}</td>
        </table>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="foot.jsp"/><!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="js/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="js/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">


    $(function(){
        $('.table-sort').dataTable({
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,5]}// 制定列不参与排序
            ]
        });
        var sum = $("td[hidden='hidden']").text();
          $("strong").text(sum);

        $("a[class='text-primary']").click(function () {
           var id = $(this).parents("tr").find("td[name='user']").text();
            alert(id);
            layer_show('','/member-show','360','300',id);
        })

        $("a[title='编辑']").click(function () {
            var id = $(this).parents("tr").find("td[name='user']").text();
            layer_show('','/member-edit','550','450',id);
        })

    });
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-查看*/
   /* function member_show(title,url,id,w,h){

        var id = $(this).parent("td").siblings("td[name='user']").text();
        alert(id);
        layer_show(title,url,w,h);
    }*/
    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                    $(obj).remove();
                    layer.msg('已停用!',{icon: 5,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
    /*用户-编辑*/
    /*function member_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }*/
    /*密码-修改*/
    function change_password(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-删除*/
    function member_del(obj){
        /*layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '/memberDelete',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });*/
     if(!window.confirm("是否删除")){
         return;
     }
        var userId = $(obj).attr("id");
        var _obj=obj;
        $.post("/member-delete",{"userId":userId},function (result) {
            if(result=="true"){
                alert("success");
                $(_obj).parents("tr").remove();
            }else {
                alert("error");
        }
    });
    }
    function datadel() {
        if(!window.confirm("是否删除")) {
            return;
        }
        var array = [];
        var i = 0;
        $("input:checked").each(function () {
                if($(this).attr("name")!="all"){
                     array[i] = $(this).parents("tr").find("td[name='user']").text();
                    i = i+1;
            }
        })
        $.ajax({
            url:"/member-deleteAll",
            data:{"array":array},
            dataType:"text",
            type:"POST",
            traditional: true,
            success:function (result){
                console.log(result)
                if(result=="true"){
                    alert("success");
                    $("input:checked").each(function () {
                        if($(this).attr("name")!="all"){
                            $(this).parents("tr").remove();
                        }
                    })
                }
            }
        });
    }
</script>
</body>
</html>
