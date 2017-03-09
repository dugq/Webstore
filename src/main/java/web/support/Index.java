package web.support;

import internal.basic.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.dto.JsonResponse;
import pojo.dto.SquirrelClassificationDto;
import pojo.entity.SquirrelClassification;
import pojo.entity.SquirrelShops;
import pojo.entity.SquirrelUser;
import service.SquirrelClassificationService;
import service.SquirrelShopsService;

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
    private String addClassify(SquirrelClassification classification, Model model){
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

}
