package web.support;

import com.github.pagehelper.PageInfo;
import internal.basic.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Enum.UserTypeEnum;
import pojo.dto.*;
import pojo.entity.SquirrelClassification;
import pojo.entity.SquirrelCommodity;
import pojo.entity.SquirrelShops;
import pojo.entity.SquirrelUser;
import service.SquirrelClassificationService;
import service.SquirrelCommodityService;
import service.SquirrelShopsService;
import service.SquirrelUserService;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/3/4.
 */
@Controller("supportIndex")
@RequestMapping("support")
public class Index extends BasicController{
    @Autowired
    private SquirrelShopsService squirrelShopsService;
    @Autowired
    private SquirrelClassificationService squirrelClassificationService;
    @Autowired
    private SquirrelUserService squirrelUserService;
    @Autowired
    private SquirrelCommodityService squirrelCommodityService;

    @RequestMapping("index")
    private String index(Model model){

        return "support/index";
    }

    @RequestMapping("classify/list")
    public String listClassify(Model model){
        List<SquirrelClassificationDto> list = squirrelClassificationService.selectAllDtos();
        model.addAttribute("list",list);
        return "support/listClassify";
    }

    @RequestMapping("classify/add")
    public String addClassify(SquirrelClassification classification, Model model){
        if(StringUtils.isEmpty(classification.getName())){
            model.addAttribute("error","名称不可为空。");
        }else if(  squirrelClassificationService.selectByName(classification.getName()).size()>0){
            model.addAttribute("error","名称重复啦~");
        }else{
            classification.setCreationTime(new Date());
            squirrelClassificationService.insertSelective(classification);
            model.addAttribute("message","新增成功。");
        }
        List<SquirrelClassificationDto> list = squirrelClassificationService.selectAllDtos();
        model.addAttribute("list",list);
        return "support/listClassify";
    }

    @RequestMapping("shopManage/list")
    public String shopManageList( Model model){
        List<SquirrelShopsDto> dtos= squirrelShopsService.selectAllDto();
        model.addAttribute("list",dtos);
        return "support/listShops";
    }
    @RequestMapping("shopManage/show")
    public String showShop( Model model,int shopId){
        SquirrelShops shop = squirrelShopsService.selectByPrimaryKey(shopId);
        model.addAttribute("shop",shop);
        return "support/listShop";
    }

    @RequestMapping("shopManage/showCommdity")
    public String showCommdity( Model model,int shopId,int pageIndex){
        Pagination page = new Pagination(pageIndex,10);
        List<SquirrelCommodity> commodities = squirrelCommodityService.selectByShopId(shopId,page);
        PageInfo pageInfo = new PageInfo(commodities);
        ForegroundPagination forePage = ForegroundPagination.valueOf(pageInfo);
        forePage.setNavigatePage(5);
        forePage.setUrl("/support/shopManage/showCommdity?");
        model.addAttribute("page",forePage);
        model.addAttribute("commodities",commodities);
        return "support/showCommdty";
    }


    @RequestMapping("shopManage/modifyShop")
    @ResponseBody
    public JsonResponse modifyShop(Integer id,Byte status){
        if(isUserAdmin()){
            SquirrelShops shop = new SquirrelShops();
            shop.setId(id);
            shop.setStatus(status);
            squirrelShopsService.updateByPrimaryKeySelective(shop);
            return JsonResponse.ofSuccess();
        }else{
            return JsonResponse.ofFail("没有权限");
        }
    }
    @RequestMapping("personalManage/list")
    public String personalManageList( Model model){
        List<SquirrelUser> dtos = squirrelUserService.selectAll();
        model.addAttribute("list",dtos);
        return "support/listPerson";
    }

    @RequestMapping("personalManage/modifyPersonalInfo")
    @ResponseBody
    public JsonResponse modifyPersonalInfo(Integer type,Double money,Integer id){
        if(id == null){
            return JsonResponse.ofFail("用户为空！");
        }
        if(type == null && money==null){
            return JsonResponse.ofFail("参数为空！");
        }
        SquirrelUser user = squirrelUserService.selectByPrimaryKey(id);
        if(type!=null){
            user.setUserType((byte) UserTypeEnum.SHOPKEEPER.getValue());
        }
        if(money!=null){
            user.setMoney(user.getMoney()+money);
        }
        squirrelUserService.updateByPrimaryKeySelective(user);
        return JsonResponse.ofSuccess();
    }
}
