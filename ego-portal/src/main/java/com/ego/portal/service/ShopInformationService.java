package com.ego.portal.service;

import com.ego.portal.pojo.ShopInformation;


import java.util.List;


public interface ShopInformationService {

    //首页-轮播图的商品展示-根据商品数量升序前5条数据
    public List<ShopInformation> shop();
}
