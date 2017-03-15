package web.webstore;

import internal.basic.BasicController;
import net.sf.json.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Enum.SortTypeEnum;
import pojo.dto.JsonResponse;
import pojo.dto.SquirrelClassificationDto;
import pojo.dto.SquirrelCommodityDto;
import pojo.entity.SquirrelCommodity;
import pojo.entity.SquirrelShops;
import pojo.entity.SquirrelUser;
import pojo.entity.UserShopsRela;
import service.*;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/3/4.
 */
@Controller
@RequestMapping("webstore")
public class Webstore extends BasicController{
    private static final long serialVersionUID = -8140277508472633799L;
    @Autowired
    private SquirrelCommodityService squirrelCommodityService;
    @Autowired
    private SquirrelClassificationService squirrelClassificationService;
    @Autowired
    private SquirrelShopsService squirrelShopsService;
    @Autowired
    private UserShopsRelaService userShopsRelaService;
    @Autowired
    private SquirrelUserService squirrelUserService;

    @RequestMapping("webstore")
    public String search(Integer classId,Integer shopId,String name, Model model) {
        List<SquirrelClassificationDto> list = squirrelClassificationService.selectAllDtos();
        List<SquirrelShops> squirrelShops = squirrelShopsService.selectAll();
        model.addAttribute("classesList",list);
        model.addAttribute("shopsList",squirrelShops);
        model.addAttribute("classId",classId);
        model.addAttribute("shopId",shopId);
        model.addAttribute("name",name);
        List<SquirrelCommodityDto> squirrelCommodityDtos = squirrelCommodityService.selectHotList();
        model.addAttribute("list",squirrelCommodityDtos);
        return "websotre/search";
    }

    @RequestMapping("searchPage")
    public String searchPage(String name, Integer shopId, Integer classId, @RequestParam(defaultValue = "0") int sortType, Model model) {
        List<SquirrelCommodityDto> squirrelCommodityDtos = squirrelCommodityService.selectDtoByNameShopIdClassIdAndSortType(name, shopId, classId, SortTypeEnum.valueOf(sortType).getExpression(),1);
        model.addAttribute("list",squirrelCommodityDtos);
        return "websotre/searchPage";
    }

    @RequestMapping("searchMorePage")
    @ResponseBody
    public JsonResponse searchMorePage(String name, Integer shopId, Integer classId, @RequestParam(defaultValue = "0") int sortType, Integer pageIndex) {
        List<SquirrelCommodityDto> squirrelCommodityDtos = squirrelCommodityService.selectDtoByNameShopIdClassIdAndSortType(name, shopId, classId, SortTypeEnum.valueOf(sortType).getExpression(),pageIndex);
        JsonResponse response = JsonResponse.ofSuccess();
        response.put("list",squirrelCommodityDtos);
        return response;
    }

    @RequestMapping("buy")
    @ResponseBody
    public JsonResponse buy(Integer id,@RequestParam(defaultValue = "1") Integer num){
        if(id ==null){
            return  JsonResponse.ofFail("请选择商品~");
        }
        if(!doseUserLogin()){
            return JsonResponse.ofFail("请先登录哦~");
        }
        SquirrelCommodity squirrelCommodity = squirrelCommodityService.selectByPrimaryKey(id);
        if(squirrelCommodity==null){
            return  JsonResponse.ofFail("该商品不存在或已下架~");
        }
        if(squirrelCommodity.getSales()<=0){
            return  JsonResponse.ofFail("该刷新页面喽~宝贝已被抢空啦~");
        }
        SquirrelUser user = getMemoryUser();
        if(user.getMoney()<squirrelCommodity.getPrice()*num){
            return  JsonResponse.ofFail("余额不足啦~赶紧充值哦~");
        }
        squirrelCommodity.setSales(squirrelCommodity.getSales()-num);
        squirrelCommodityService.updateByPrimaryKeySelective(squirrelCommodity);
        UserShopsRela rela = new UserShopsRela();
        rela.setCreationTime(new Date());
        rela.setShopId(squirrelCommodity.getId());
        rela.setUserId(getMemoryUser().getUserId());
        userShopsRelaService.insertSelective(rela);
        user.setMoney(user.getMoney()-squirrelCommodity.getPrice()*num);
        squirrelUserService.updateByPrimaryKeySelective(user);
        SquirrelUser sale = squirrelUserService.selectByPrimaryKey(squirrelCommodity.getShopsId());
        sale.setMoney(sale.getMoney()+squirrelCommodity.getPrice()*num);
        squirrelUserService.updateByPrimaryKeySelective(sale);
        return JsonResponse.ofSuccess();
    }
}

