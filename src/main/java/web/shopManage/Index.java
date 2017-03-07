package web.shopManage;

import internal.basic.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.dto.JsonResponse;
import pojo.entity.SquirrelShops;
import pojo.entity.SquirrelUser;
import service.SquirrelShopsService;

import java.util.Date;

/**
 * Created by Administrator on 2017/3/4.
 */
@Controller("manageIndex")
@RequestMapping("shopsManage")
public class Index extends BasicController{
    @Autowired
    private SquirrelShopsService squirrelShopsService;

    @RequestMapping("index")
    private String index(Model model){
        SquirrelUser user = getMemoryUser();
        SquirrelShops shop = squirrelShopsService.selectByShopperKepper(user.getUserId());
        if(shop!=null){
            model.addAttribute("shop",shop);
        }
        return "shopsManage/index";
    }

    @RequestMapping("save")
    @ResponseBody
    private JsonResponse save(String name,String description,String url){
        SquirrelUser user = getMemoryUser();
        if(StringUtils.isNotEmpty(name) && name.length()>=20){
            return JsonResponse.ofFail("名称太长了哦~请保持在50字以内");
        }
        if(StringUtils.isNotEmpty(description) && description.length()>=50){
            return JsonResponse.ofFail("描述太长了哦~请保持在50字以内");
        }

        SquirrelShops shop = squirrelShopsService.selectByShopperKepper(user.getUserId());
        if(shop==null){
            shop = new SquirrelShops();
            shop.setCreationTime(new Date());
            shop.setShopkeeper(user.getUserId());
            shop.setStatus((byte) 0);
        }
        shop.setName(name);
        shop.setDescription(description);
        shop.setImgUrl(url);
        if(shop.getId()==null){
            squirrelShopsService.insertSelective(shop);
        }else{
            squirrelShopsService.updateByPrimaryKeySelective(shop);
        }
        return JsonResponse.ofSuccess();
    }
    @RequestMapping("saveAndSubmit")
    @ResponseBody
    private JsonResponse saveAndSubmit(String name,String description,String url){
        SquirrelUser user = getMemoryUser();
        if(StringUtils.isEmpty(name)){
            return JsonResponse.ofFail("名称不能为空哦~");
        }
        if(name.length()>=20){
            return JsonResponse.ofFail("名称太长了哦~请保持在50字以内");
        }
        if(StringUtils.isEmpty(description)){
            return JsonResponse.ofFail("描述不能为空哦~");
        }
        if(StringUtils.isNotEmpty(description) && description.length()>=50){
            return JsonResponse.ofFail("描述太长了哦~请保持在50字以内");
        }
        if(StringUtils.isEmpty(url)){
            return JsonResponse.ofFail("封面图不能为空哦~");
        }
        SquirrelShops shop = squirrelShopsService.selectByShopperKepper(user.getUserId());
        if(shop==null){
            shop = new SquirrelShops();
            shop.setCreationTime(new Date());
            shop.setShopkeeper(user.getUserId());
        }
        shop.setName(name);
        shop.setDescription(description);
        shop.setImgUrl(url);
        shop.setStatus((byte) 1);
        if(shop.getId()==null){
            squirrelShopsService.insertSelective(shop);
        }else{
            squirrelShopsService.updateByPrimaryKeySelective(shop);
        }
        return JsonResponse.ofSuccess();
    }


}
