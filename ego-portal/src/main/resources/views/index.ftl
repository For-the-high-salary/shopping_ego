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
        <li><a href="${ctx}/index">首页</a></li>
        <li><a href="page/mall_page.html">商城</a></li>
        <li><a href="page/">求购商场</a></li>
        <li><a href="javascript:void(0)">反馈与意见</a></li>
        <li><a href="javascript:void(0)">联系我们</a></li>
    </ul>
</div>
<nav class="my_nav">
    <ul>
        <li><a href="${ctx}/index">首页</a></li>
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
<#--轮播图-->
<div class="my_slider">
    <#--商品-->
    <#list shop as s>
        <#if s_index<4>
            <div class="my_slide">
                <h1>${s.name}</h1>
                <p>${s.remark}</p>
                <div class="slide_img">
                    <img src="${s.image}" style="width:400px;height: 270px">
                </div>
            </div>
            <#else >
                <div class="my_slide current">
                    <h1>${s.name}</h1>
                    <p>${s.remark}</p>
                    <div class="slide_img">
                        <img src="${s.image}" style="width:400px;height: 270px">
                    </div>
                </div>
        </#if>
    </#list>
    <#--箭头-->
    <div class="left_border">
        <span class="left_turn"></span>
    </div>
    <div class="right_border">
        <span class="right_turn"></span>
    </div>
</div>

<div class="featured_products" style="height: 520px">
    <h2>精选商品</h2>
    <#--<#list shops as s>
        <div class="product">
            <img src="${s.image}" width="100%" height="45%">
            <span class="product_name">${s.name}</span><br>
            <span class="product_cost">￥${s.price}</span><br><br>
            <span class="buy product_1">加入购物车</span>
        </div>
    </#list>-->
    <div id="goodsContent" style="height: 350px"></div>
    <div class="pagination_div" style="margin-left: 37%">
        <#--<a class="pagination_lt">&lt;</a>
        <ul>
            <!--new&ndash;&gt;
            <li class="current_page"><a>1</a></li>
            <li><a>2</a></li>
            <li ><a>3</a></li>
            <li><a>4</a></li>
            <li><a>5</a></li>
        </ul>
        <a class="pagination_gt">&gt;</a>-->
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
    <p style="line-height: 5%">Copyright © 2017-2200.Company name All rights reserved.<a href="/"></a></p>
</footer>
</body>


<!-- 编写商品模板 -->
<script type="template" id="goodsTemplate">
    {{ for(var i = 0; i < it.length; i++){ }}
        <div class="product">
            <img src="{{=it[i].image}}">
            <span class="product_name">{{=it[i].name}}</span><br>
            <span class="product_cost">￥{{=it[i].price}}</span><br><br>
            <span class="buy product_1">加入购物车</span>
        </div>
    {{ } }}
</script>

<!-- 编写分页模板 -->
<script type="template" id="pageTemplate">

    {{ if(it.hasPreviousPage){ }}<#--hasPreviousPage当前页-->
    <a class="pagination_lt" href="javascript:ajax_get_table('{{=it.prePage}}');" style="text-decoration: none"><</a>
    {{ } }}

    {{ for(var i = 1; i <= it.navigatepageNums.length; i++){ }}<#--navigatepageNums显示页数-->
    <ul>
        <li {{ if(i == it.pageNum){ }} class="current_page" {{ } }}>
            <a href="javascript:ajax_get_table('{{=i}}');" style="text-decoration: none">{{=i}}</a>
        </li>
    </ul>
    {{ } }}

    {{ if(it.hasNextPage){ }}
        <a class="pagination_gt" href="javascript:ajax_get_table('{{=it.nextPage}}');" style="text-decoration: none">></a>
    {{ } }}
</script>
<!-- 编写分页模板 -->
<#--<script type="template" id="pageTemplate">

    {{ if(it.hasPreviousPage){ }}
        <a class="pagination_lt" href="javascript:ajax_get_table('{{=it.prePage}}');" style="text-decoration: none"><</a>
    {{ } }}

    {{ for(var i = 1; i <= it.pages; i++){ }}
        &lt;#&ndash;<li class="current_page {{ if(i == it.pageNum){ }}active{{ } }}">
            <a href="javascript:ajax_get_table('{{=i}}');">{{=i}}</a>
        </li>&ndash;&gt;
        <ul>
            <li {{ if(i == it.pageNum){ }} class="current_page" {{ } }}>
                <a href="javascript:ajax_get_table('{{=i}}');" style="text-decoration: none">{{=i}}</a>
            </li>
        </ul>
    {{ } }}

    {{ if(it.hasNextPage){ }}
        <a class="pagination_gt" href="javascript:ajax_get_table('{{=it.nextPage}}');" style="text-decoration: none">></a>
    {{ } }}
</script>-->

<script>
    $(document).ready(function () {
        // ajax 加载商品列表
        ajax_get_table(1);

    });

    //ajax抓取页面 page为当前第几页
    function ajax_get_table(page) {
        $.ajax({
            url: "${ctx}/listForPage",
            type: "POST",
            data: {
                pageNum: page,
                pageSize: 4
            },
            dataType: "JSON",
            success: function (result) {
                if (200 == result.code) {
                    if (result.pageInfo.list.length > 0) {
                        console.log(result.pageInfo.list);
                        //获取商品列表模板
                        var goodsTemp = doT.template($("#goodsTemplate").text());
                        //填充数据
                        $("#goodsContent").html(goodsTemp(result.pageInfo.list));
                        //获取分页模板
                        var pageTemp = doT.template($("#pageTemplate").text());
                        //填充数据
                        $(".pagination_div").html(pageTemp(result.pageInfo));
                    } else {
                        layer.msg("该分类或品牌暂无商品信息！");
                    }
                } else {
                    layer.msg("该分类或品牌暂无商品信息！");
                }
            },
            error: function (result) {
                console.log(result)
            }
        });
    }
</script>
</html>