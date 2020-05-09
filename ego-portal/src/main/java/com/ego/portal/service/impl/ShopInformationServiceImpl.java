package com.ego.portal.service.impl;

import com.ego.common.result.BaseResult;
import com.ego.portal.mapper.ShopInformationMapper;
import com.ego.portal.pojo.ShopInformation;
import com.ego.portal.pojo.ShopInformationExample;
import com.ego.portal.service.ShopInformationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

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


    //精品商品分页查询
    @Override
    public BaseResult selectGoodsListByPage(Integer pageNum, Integer pageSize) {
        //构建分页对象
        PageHelper.startPage(pageNum,pageSize);
        //查询
        List<ShopInformation> list = shopInformationMapper.selectByExample(new ShopInformationExample());
        //将查询结果设置至分页对象
        if (!CollectionUtils.isEmpty(list)){
            PageInfo<ShopInformation> pageInfo = new PageInfo<>(list,5);
            return BaseResult.success(pageInfo);
        }
        return BaseResult.error();
    }


    //首页-精品的商品展示-根据商品数量升序第5到10条数据
    @Override
    public List<ShopInformation> shops() {

        return shopInformationMapper.selectbySales();
    }


}
