<!-- 设置项目根路径全局变量 -->
<#assign ctx=request.contextPath/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发布的商品</title>
    <link rel="icon" href="${ctx}/img/page_icon.png">
    <link rel="stylesheet" href="${ctx}/css/home_page/header_and_nav.css">
    <link href="${ctx}/css/personal/my_publish_product.css" rel="stylesheet">
    <script src="${ctx}/js/jquery-3.4.1.js"></script>
    <script src="${ctx}/js/home/header_model_js.js"></script>
    <!-- 引入 doT.js -->
    <script type="text/javascript" src="${ctx}/js/doT.min.js"></script>
    <script src="${ctx}/js/layer/layer-min.js"></script>
</head>
<body>
<header>
    <span class="short_nav"></span>
    <div class="home_icon">
        <a href="../../index.html" style="text-decoration: none;color: white">C2C</a>
    </div>
    <input type="text" placeholder="Search" name="search" class="nav_search_input">
    <span class="search_icon"></span>
    <span class="user_icon"></span>
    <!--修改为用户名-->
    <span class="login_or_register_string">
        <a href="../login_page.html">登陆</a> ， <a href="../login_page.html">注册</a>
        <!--<a href="page/personal/personal_info.html" class="user_name_a">这是一个用户名这是一个用户名这是一个用户名</a>-->
    </span>
</header>
<div class="short_nav_show">
    <ul>
        <li><a href="../../index.html">首页</a></li>
        <li><a href="../mall_page.html">商城</a></li>
        <li><a href="../publish_product.html">发布商品</a></li>
        <li><a href="../require_product.html">求购商品</a></li>
        <li><a href="../shopping_cart.html">我的购物车</a></li>
        <li><a href="javascript:void(0)">反馈与意见</a></li>
        <li><a href="javascript:void(0)">联系我们</a></li>
    </ul>
</div>
<nav class="my_nav">
    <ul>
        <li><a href="../../index.html">首页</a></li>
        <li><a href="../mall_page.html">商城</a></li>
        <li><a href="../publish_product.html">发布商品</a></li>
        <li><a href="../require_product.html">求购商品</a></li>
        <li><a href="../shopping_cart.html">我的购物车</a></li>
        <li><a href="javascript:void(0)">反馈与意见</a></li>
        <li><a href="javascript:void(0)">联系我们</a></li>
    </ul>
</nav>
<<!--商品详情，加多一个多余的div，然分页按钮可以显示在内容之下-->
<div class="temp_content" onmousedown="hideParticular()">
    <!--注意需要加一个br，不然会在同一行显示-->
    <div class="product_content_div" id="content">
    </div>

    <input type="hidden" id="pageNum" name="pageNum" value="1"/>
    <input type="hidden" id="pageSize" name="pageSize" value="6"/>
    <input type="hidden" id="name" name="name"/>
    <div class="pagination_div" onmouseleave="hideParticular()" style="align-content: center">

    </div>
    <footer>
        <p>Copyright © 2014.Company name All rights reserved.</p>
    </footer>
</div>

<!-- 编写商品模板 -->
<script type="template" id="shopInfoTemplate">
    {{ for(var i = 0; i < it.length; i++){ }}
    <div class="detail_product">
        <input type="hidden" value="">
        <img src="{{=it[i].image}}" height="196px" style="width: 186px;height: 196px"><br>
        <span class="detail_product_name">{{=it[i].name}}</span><br>
        <span class="detail_product_cost"> {{=it[i].price}} $</span><br>
        <span class="detail_type">{{=it[i].kind}}</span>
        <div class="delete_and_update">
            <a href="${ctx}/release/RIndex?id={{=it[i].id}}"><img src="${ctx}/img/pencil.jpg" class="update_publish"></a>
            <img src="${ctx}/img/delete_icon.jpg" class="delete_publish" onclick="deleteInfo('{{=it[i].id}}')">
        </div>
    </div>
    {{ } }}
</script>



<!-- 编写模板 -->
<script type="template" id="goodsKindsTemplate">

    {{ for(var i = 0; i < it.length; i++){ }}
    <li class="cat_item">
        <h4 class="cat_tit"><a href="#" class="cat_tit_link">{{=it[i].name}}</a></h4>
        <div class="cat_cont">
            <div class="cat_cont_lft">
                {{ for(var j = 0; j < it[i].childrenList.length; j++){ }}
                <dl class="cf">
                    <dt><a href="#">{{=it[i].childrenList[j].name}}</a></dt>
                    <dd>
                        <ul>
                            {{ for(var k = 0; k < it[i].childrenList[j].childrenList.length; k++){ }}
                            <li class="first"><a href="javascript:ajax_get_table(1)" id="name_{{=it[i].childrenList[j].childrenList[k].id}}" onclick="getName({{=it[i].childrenList[j].childrenList[k].id}})">{{=it[i].childrenList[j].childrenList[k].name}}</a></li>
                            {{ } }}
                        </ul>
                    </dd>
                </dl>
                {{ } }}

            </div>
        </div>
        {{ } }}
</script>

<script>
    function updateInfo() {
        
    }
    
    function deleteInfo(id) {
        layer.confirm('你确定要删除这条发布信息？',
            {
                icon: 7, //询问框icon图标
                title:'删除',//询问框标题
                btn:['取消','删除']//询问框按钮
            },
            function(){
                layer.closeAll();
            },
            function(){
               $.ajax({
                   type:"post",
                   url:"${ctx}/issue/delete/"+id,
                   dataType: "JSON",
                   success: function (result) {
                       if(result.code=200){
                           layer.alert("删除成功")
                           location.reload([true])
                       }else{
                           layer.alert("删除失败")
                       }
                   }

               })
            }
        );
    }

    function hideParticular() {
        if ($('.particular_type_div').is(":visible")) {
            $('.particular_type_div').hide(0);
        }
    }
    //商品分类点击查询
    function getName(id){
        var name = $("#name_"+id).html();
        console.log(name);
        $("#name").val(name);
    }

    $(document).ready(function () {
        // ajax 加载商品列表
        var page = $("#pageNum").val();
        ajax_get_table(page);


    });
    //ajax 抓取页面 page 为当前第几页
    function ajax_get_table(page) {
        $.ajax({
            url: "${ctx}/issue/list",
            type: "POST",
            data: {
                name: $("#name").val(),
                pageNum: page,
                pageSize: $("#pageSize").val()
            },
            dataType: "JSON",
            success: function (result) {

                if (200 == result.code) {

                    if (result.pageInfo.list.length > 0) {
                        //获取商品列表模板
                        var goodsTemp = doT.template($("#shopInfoTemplate").text());
                        //填充数据
                        $("#content").html(goodsTemp(result.pageInfo.list));

                        /*//获取分页模板
                        var pageTemp = doT.template($("#pageTemplate").text());
                        //填充数据
                        $(".pagination_div").html(pageTemp(result.pageInfo));*/

                        pageInfoBar(result.pageInfo,"pagination_div")

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




    function pageInfoBar(pageInfo, barDivId) {
        var barDiv = $("." + barDivId);
        /*var context = "<span>当前页：" + pageInfo.pageNum + "&nbsp;总页数："
            + pageInfo.pages + "&nbsp;&nbsp;总记录数："+pageInfo.total+"</span>";*/
        var context = "<div class='query-content-page-btn'><ul>";
        if (pageInfo.pageNum > 1) {
            context += "<li class='prev-next' onclick=prePage('"
                + pageInfo.prePage + "')><</li>";
        }
        for (var i = 0; i < pageInfo.navigatepageNums.length; i++) {
            if (pageInfo.pageNum == pageInfo.navigatepageNums[i]) {
                context += "<li class='current_page' onclick=numPage('"
                    + pageInfo.navigatepageNums[i]
                    + "')>"
                    + pageInfo.navigatepageNums[i] + "</li>"
            } else {
                context += "<li onclick=numPage('"
                    + pageInfo.navigatepageNums[i] + "')>"
                    + pageInfo.navigatepageNums[i] + "</li>"
            }

        }

        if (pageInfo.pageNum < pageInfo.pages) {
            context += "<li class='bus-border-right prev-next' onclick=nextPage('"
                + pageInfo.nextPage + "')>></li>";
        }
        context += "</ul></div>";
        barDiv.html(context);
    }

    // 下一页
    function nextPage() {
        // 获取当前页的值 加一 然后重新赋值给当前页
        var page = parseInt($("#pageNum").val()) + 1;
        $("#pageNum").val(page);
        // 调用搜索函数
        ajax_get_table(page);
    }

    //上一页
    function prePage() {
        // 获取当前页的值 减一 然后重新赋值给当前页
        var page = parseInt($("#pageNum").val()) - 1;
        $("#pageNum").val(page);
        // 调用搜索函数
        ajax_get_table(page);
    }


    // 第几页
    function numPage(num) {
        // 获取点击的按钮值 然后重新赋值给当前页
        $("#pageNum").val(num);

        // 调用搜索函数
        ajax_get_table(num);
    }
</script>
</div>
</body>
</html>