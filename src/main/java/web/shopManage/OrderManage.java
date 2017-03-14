package web.shopManage;

import com.github.pagehelper.PageInfo;
import internal.basic.BasicController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.dto.ForegroundPagination;
import pojo.dto.UserShopsRelaDto;
import pojo.entity.SquirrelShops;
import pojo.entity.SquirrelUser;
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
}
