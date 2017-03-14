package web.shopManage;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import internal.basic.BasicController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.dto.ForegroundPagination;
import pojo.dto.JsonResponse;
import pojo.dto.UserShopsRelaDto;
import pojo.entity.SquirrelCommodity;
import pojo.entity.SquirrelShops;
import pojo.entity.SquirrelUser;
import pojo.entity.UserShopsRela;
import service.SquirrelCommodityService;
import service.SquirrelShopsService;
import service.SquirrelUserService;
import service.UserShopsRelaService;

import java.util.List;

/**
 * Created by duq on 2017/3/14.
 */
@Controller
@RequestMapping("shopsManage/orderManage")
public class OrderManage extends BasicController {
    @Autowired
    private UserShopsRelaService userShopsRelaService;
    @Autowired
    private SquirrelUserService squirrelUserService;
    @Autowired
    private SquirrelShopsService squirrelShopsService;
    @Autowired
    private SquirrelCommodityService squirrelCommodityService;

    @RequestMapping
    public String index(){
        return "shopsManage/orderManageList";
    }
    @RequestMapping("orderPage")
    public String orderPage(Integer pageIndex,Model model,Byte status){
        SquirrelShops squirrelShops = squirrelShopsService.selectByShopperKepper(getMemoryUser().getUserId());
        List<UserShopsRelaDto> dtos = userShopsRelaService.selectDtosByShopIdAndStutas(pageIndex,squirrelShops.getId(),status);
        PageInfo pageInfo = new PageInfo(dtos);
        ForegroundPagination page = ForegroundPagination.valueOf(pageInfo);
        model.addAttribute("list",dtos);
        model.addAttribute("page",page);
        return "shopsManage/orderManageListPage";
    }

    @RequestMapping("modify")
    @ResponseBody
    public JsonResponse modify(Integer id,Byte status){
        UserShopsRela userShopsRela = userShopsRelaService.selectByPrimaryKey(id);
        if(status==3){
            SquirrelCommodity commodity = squirrelCommodityService.selectByPrimaryKey(userShopsRela.getShopId());
            SquirrelUser sale = squirrelUserService.selectByPrimaryKey(commodity.getShopsId());
            SquirrelUser cost = squirrelUserService.selectByPrimaryKey(userShopsRela.getUserId());
            sale.setMoney(sale.getMoney()-commodity.getPrice()*userShopsRela.getNum());
            cost.setMoney(cost.getMoney()+commodity.getPrice()*userShopsRela.getNum());
            squirrelUserService.updateByPrimaryKeySelective(sale);
            squirrelUserService.updateByPrimaryKeySelective(cost);
            commodity.setSales(commodity.getSales()+userShopsRela.getNum());
        }
        userShopsRela.setStatus(status);
        userShopsRelaService.updateByPrimaryKeySelective(userShopsRela);
        return JsonResponse.ofSuccess();
    };
}
