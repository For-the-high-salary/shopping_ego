package com.ego.portal.controller;

import com.ego.common.result.BaseResult;
import com.ego.portal.pojo.ShopInformation;
import com.ego.portal.service.ShopInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ShopInformationController {

    @Autowired
    private ShopInformationService shopInformationService;

    //跳转首页页面
    @RequestMapping("index")
    public String shop(Model model){
        //首页-轮播图的商品展示-根据商品数量升序前5条数据
        model.addAttribute("shop",shopInformationService.shop());
        return "index";
    }

}
