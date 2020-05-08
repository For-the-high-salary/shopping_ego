package com.ego.portal.service.impl;

import com.ego.portal.mapper.ShopInformationMapper;
import com.ego.portal.pojo.ShopInformation;
import com.ego.portal.pojo.ShopInformationExample;
import com.ego.portal.service.ShopInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopInformationServiceImpl implements ShopInformationService {

    @Autowired
    private ShopInformationMapper shopInformationMapper;

    //首页-轮播图的商品展示-根据商品数量升序前5条数据
    @Override
    public List<ShopInformation> shop() {

        return shopInformationMapper.select();
    }
}
