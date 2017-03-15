package web.shopManage;

import com.github.pagehelper.PageInfo;
import internal.basic.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.dto.ForegroundPagination;
import pojo.dto.JsonResponse;
import pojo.dto.Pagination;
import pojo.dto.SquirrelClassificationDto;
import pojo.entity.SquirrelCommodity;
import pojo.entity.SquirrelShops;
import pojo.entity.SquirrelUser;
import service.SquirrelClassificationService;
import service.SquirrelCommodityService;
import service.SquirrelShopsService;

import javax.xml.validation.Validator;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/3/5.
 */
@Controller
@RequestMapping("shopsManage/commodityManage")
public class commodityManage extends BasicController{
    @Autowired
    private SquirrelShopsService squirrelShopsService;
    @Autowired
    private SquirrelCommodityService squirrelCommodityService;
    @Autowired
    private SquirrelClassificationService squirrelClassificationService;

    @RequestMapping
    public String index(int pageIndex, Model model){
        SquirrelUser memoryUser = getMemoryUser();
        SquirrelShops squirrelShops = squirrelShopsService.selectByShopperKepper(memoryUser.getUserId());
        Pagination page = new Pagination(pageIndex,10);
        if(squirrelShops!=null){
            List<SquirrelCommodity> commodities = squirrelCommodityService.selectByShopId(squirrelShops.getId(),page);
            PageInfo pageInfo = new PageInfo(commodities);
            ForegroundPagination forePage = ForegroundPagination.valueOf(pageInfo);
            forePage.setNavigatePage(5);
            forePage.setUrl("/shopsManage/commodityManage?");
            model.addAttribute("page",forePage);
            model.addAttribute("commodities",commodities);
        }
        return "shopsManage/commodityList";
    }

    @RequestMapping("addCommodity")
    public String addCommodity(SquirrelCommodity commodity,Model model){
        String message = validator(commodity);
        if(StringUtils.isNotEmpty(message)){
            model.addAttribute("error",message);
            model.addAttribute("commodity",commodity);
            return "shopsManage/addCommodity";
        }
        if(commodity.getId()==null){
            commodity.setCreationTime(new Date());
            SquirrelUser memoryUser = getMemoryUser();
            commodity.setCreationUser(memoryUser.getUserId());
            SquirrelShops squirrelShops = squirrelShopsService.selectByShopperKepper(memoryUser.getUserId());
            commodity.setShopsId(squirrelShops.getId());
            squirrelCommodityService.insertSelective(commodity);
        }else{
            squirrelCommodityService.updateByPrimaryKeySelective(commodity);
        }
        return "redirect:/shopsManage/index?pageIndex=1";
    }

    private String validator(SquirrelCommodity commodity) {
        String message = null;
        if(StringUtils.isEmpty(commodity.getName())){
            message="商品名称不能为空";
        }
        else if(commodity.getPrice()==null){
            message="价格不可为空~";
        }
        else if(commodity.getSales()==null){
            message="数量不可为空~";
        }
        else if(StringUtils.isEmpty(commodity.getDescription())){
            message="商品描述不能为空";
        }
        else if(commodity.getClassId()==null){
            message="商品分类不能为空";
        }
        else if(StringUtils.isEmpty(commodity.getImgUrl())){
            message="商品图片不能为空";
        }
        return message;
    }

    @RequestMapping("toAddCommodity")
    public String toAddCommodity(Integer id,Model model){
        List<SquirrelClassificationDto> squirrelClassificationDtos = squirrelClassificationService.selectAllDtos();
        model.addAttribute("classes",squirrelClassificationDtos);
        if(id!=null){
            SquirrelCommodity squirrelCommodity = squirrelCommodityService.selectByPrimaryKey(id);
            model.addAttribute("commodity" ,squirrelCommodity);
        }
        return "shopsManage/addCommodity";
    }
}
