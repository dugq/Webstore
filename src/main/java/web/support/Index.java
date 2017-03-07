package web.support;

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
@Controller("supportIndex")
@RequestMapping("support")
public class Index extends BasicController{
    @Autowired
    private SquirrelShopsService squirrelShopsService;

    @RequestMapping("index")
    private String index(Model model){

        return "support/index";
    }



}
