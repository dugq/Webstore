package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.dto.JsonResponse;
import pojo.dto.SquirrelClassificationDto;
import pojo.entity.SquirrelShops;
import pojo.dto.SquirrelShopsDto;
import pojo.entity.SquirrelCommodity;
import service.SquirrelClassificationService;
import service.SquirrelShopsService;
import service.SquirrelCommodityService;
import service.SquirrelShopsService;

import java.util.List;

/**
 * Created by Administrator on 2017/2/26.
 */
@Controller
@RequestMapping
public class Index {
    @Autowired
    private SquirrelClassificationService squirrelClassificationService;

    @Autowired
    private SquirrelShopsService squirrelShopsService;
    @Autowired
    private SquirrelCommodityService squirrelCommodityService;

    @RequestMapping
    public String index(Model model,Integer sales){
        List<SquirrelClassificationDto> list = squirrelClassificationService.selectAllDtos();
        SquirrelShopsDto shopsDto = new SquirrelShopsDto();
        if(null!=sales) {
            SquirrelCommodity commodity = squirrelCommodityService.selectCommodityBySales(sales);
            shopsDto.setSales(commodity.getSales());
            shopsDto.setCommodityName(commodity.getName());
        }
        List<SquirrelShopsDto> shopList=squirrelShopsService.selectBySalesDesc(shopsDto.getSales());
        model.addAttribute("list",list);
        model.addAttribute("shopList",shopList);
        return "index";
    }

    @RequestMapping("loadPage")
    @ResponseBody
    public JsonResponse loadPage(Integer pageIndex){
        List<SquirrelShops> squirrelShopss = squirrelShopsService.selectAllWithPage(pageIndex);
        JsonResponse response = JsonResponse.ofSuccess();
        response.put("list",squirrelShopss);
        return response;
    }



}
