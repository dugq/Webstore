package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.dto.JsonResponse;
import pojo.dto.SquirrelClassificationDto;
import pojo.entity.SquirrelShops;
import service.SquirrelClassificationService;
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

    @RequestMapping
    public String index(Model model){
        List<SquirrelClassificationDto> list = squirrelClassificationService.selectAllDtos();
        model.addAttribute("list",list);
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
