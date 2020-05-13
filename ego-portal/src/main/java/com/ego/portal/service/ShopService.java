package com.ego.portal.service;

import com.ego.common.result.BaseResult;
import com.ego.portal.mapper.ShopInformationMapper;
import com.ego.portal.pojo.ShopInformation;

/**
 * 商品信息保存
 */
public interface ShopService {
    //保存
    BaseResult save(ShopInformation shopInformation,String Aid);
    //查询当前信息
    ShopInformation selectById(String id);
}
