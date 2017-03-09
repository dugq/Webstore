package web.webstore;

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
import pojo.entity.SquirrelShops;
import service.SquirrelClassificationService;
import service.SquirrelCommodityService;
import service.SquirrelShopsService;

import java.util.List;

/**
 * Created by Administrator on 2017/3/4.
 */
@Controller
@RequestMapping("webstore")
public class Webstore {
    @Autowired
    private SquirrelCommodityService squirrelCommodityService;
    @Autowired
    private SquirrelClassificationService squirrelClassificationService;
    @Autowired
    private SquirrelShopsService squirrelShopsService;

    @RequestMapping("webstore")
    public String search(Model model) {
        List<SquirrelClassificationDto> list = squirrelClassificationService.selectAllDtos();
        List<SquirrelShops> squirrelShops = squirrelShopsService.selectAll();
        model.addAttribute("classesList",list);
        model.addAttribute("shopsList",squirrelShops);
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
}

