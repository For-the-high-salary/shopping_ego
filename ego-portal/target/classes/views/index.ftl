<!DOCTYPE html>
<html lang="en">
<head>
    <#include "common.ftl">
</head>
<body>
<!--整体结构很明确，就是轮播图的位置用了绝对位置感觉很不好，
然后接下来那些都用了绝对位置，很尴尬-->
<header>
    <span class="short_nav"></span>
    <div class="home_icon">
        <a href="#" style="text-decoration: none;color: white">C2C</a>
    </div>
    <input type="text" placeholder="Search" name="search" class="nav_search_input">
    <span class="search_icon"></span>
    <span class="user_icon"></span>
    <span class="login_or_register_string">
        <!--判断是否有登陆，两者相互替换-->
        <#--<a href="page/login_page.html">登陆</a> ， <a href="page/login_page.html">注册</a>-->
        <a href="page/personal/personal_info.html" class="user_name_a">admin</a>
    </span>
</header>
<div class="short_nav_show">
    <ul>
        <li><a href="#">首页</a></li>
        <li><a href="page/mall_page.html">商城</a></li>
        <li><a href="page/">求购商场</a></li>
        <li><a href="javascript:void(0)">反馈与意见</a></li>
        <li><a href="javascript:void(0)">联系我们</a></li>
    </ul>
</div>
<nav class="my_nav">
    <ul>
        <li><a href="#">首页</a></li>
        <li><a href="page/mall_page.html">商城</a></li>
        <li><a href="page/">求购商城</a></li>
        <li><a href="javascript:void(0)">反馈与意见</a></li>
        <li><a href="javascript:void(0)">联系我们</a></li>
    </ul>
</nav>

<div class="personal_nav">
    <ul>
        <li><a href="personal_info.do">个人信息</a></li>
        <li><a href="/wsk/publish_product.do">发布商品</a></li>
        <li><a href="/wsk/require_product.do">发布求购信息</a></li>
        <li><a href="/wsk/shopping_cart.do">我的购物车</a></li>
        <li><a href="/wsk/my_publish_product_page.do">我发布的商品</a></li>
        <li><a href="/wsk/my_require_product_page.do">我求购的商品</a></li>
        <li><a class="login_out" href="/wsk/logout.do">退出</a></li>
    </ul>
</div>
<div class="my_slider">
    <#list shop as s>
        <div class="my_slide current">
            <h1>${s.name}</h1>
            <p>${s.remark}</p>
            <div class="slide_img">
                <img src="${s.image}" width="60%">
            </div>
        </div>
    </#list>

    <div class="left_border">
        <span class="left_turn"></span>
    </div>
    <div class="right_border">
        <span class="right_turn"></span>
    </div>
</div>
<div class="featured_products" style="height: 500px">
    <h2>精选商品</h2>
    <div class="product">
        <img src="img/home/feature_prodects/cont1.jpg" width="100%">
        <span class="product_name">Big block Lether Bag</span>
        <span class="product_cost">$350.00</span><br><br>
        <span class="buy product_1">加入购物车</span>
    </div>
    <div class="product">
        <img src="img/home/feature_prodects/cont2.jpg" width="100%">
        <span class="product_name">Big block Lether Bag</span>
        <span class="product_cost">$350.00</span><br><br>
        <span class="buy product_2">加入购物车</span>
    </div>
    <div class="product">
        <img src="img/home/feature_prodects/cont4.jpg" width="100%">
        <span class="product_name">Big block Lether Bag</span>
        <span class="product_cost">$350.00</span><br><br>
        <span class="buy product_3">加入购物车</span>
    </div>
    <div class="product">
        <img src="img/home/feature_prodects/cont4.jpg" width="100%">
        <span class="product_name">Big block Lether Bag<br></span>
        <span class="product_cost">$350.00</span><br><br>
        <span class="buy product_4">加入购物车</span>
    </div>
    <div class="product">
        <img src="img/home/feature_prodects/cont1.jpg" width="100%">
        <span class="product_name">Big block Lether Bag</span>
        <span class="product_cost">$350.00</span><br><br>
        <span class="buy product_5">加入购物车</span>
    </div>
</div>
<div class="home_page_info">
    <div class="bottom_info">
        <h2>
            关于我们
        </h2>
        <p>
            该网站成立与2017年，是仲恺农业工程学院最大的校内二手交易网站。拥有2000万注册用户和10万注册企业和合作伙伴。日常在线活动用户约90万。交易金额最大可达1亿/日。
        </p>
    </div>
    <div class="bottom_info">
        <h2>
            团队信息
        </h2>
        <p>该网站由WSK和XYF协力完成。有疑问可以发送问题至邮箱 wushukai1103@gmail.com
        </p>
    </div>
    <div class="bottom_info">
        <h2>
            版权声明
        </h2>
        <p>本网站社区发布的所有信息，都视为发布者同意本网站免费予以使用；同时本网站认为其发布的信息有侵权、违法等行为的，有权予以修改、删除或通知发布者予以纠正的权利，发布者不得阻止或拒绝。
        </p>
    </div>
</div>
<footer>
    <p>Copyright © 2017-2200.Company name All rights reserved.<a href="/"></a></p>
</footer>
</body>
</html>