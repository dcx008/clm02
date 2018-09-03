<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="sidebar" class="left">
    <div class="sidebar_box"><span class="bottom"></span>
        <h3>商品分类</h3>
        <div class="content">
            <ul class="sidebar_list">
                <ul class="sidebar_list">
                    <li><a href="/category?category=头盘冷菜">头盘冷菜</a></li>
                    <li><a href="/category?category=煲煲共享">煲煲共享</a></li>
                    <li><a href="/category?category=私房美味">私房美味</a></li>
                    <li><a href="/category?category=招牌菜">招牌菜</a></li>
                    <li><a href="/category?category=家常风味">家常风味</a></li>
                    <li><a href="/category?category=田园时蔬">田园时蔬</a></li>
                    <li><a href="/category?category=西式快餐">西式快餐</a></li>
                    <li><a href="/category?category=美味靓汤">美味靓汤</a></li>
                    <li><a href="/category?category=精美点心">精美点心</a></li>
                    <li><a href="/category?category=米饭">米饭</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <div class="sidebar_box"><span class="bottom"></span>
        <h3>销量榜首</h3>
        <div class="content special">
            <a href="toproductdetail?productId=${pro.productId}"><img src="${pro.imgurl}" alt="" style="width:220px;height:180px"/></a>
            <a href="toproductdetail?productId=${pro.productId}">${pro.productName}</a>
            <p style="color:white">
                价格:
                <span class="price special_price">￥${pro.productPrice}</span>
            </p>
        </div>
    </div>
</div>