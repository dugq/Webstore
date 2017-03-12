package web.personal;

import internal.basic.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.dto.JsonResponse;
import pojo.dto.UserShopsRelaDto;
import pojo.entity.SquirrelUser;
import service.SquirrelUserService;
import service.UserShopsRelaService;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2017/3/12.
 */
@Controller
@RequestMapping("personal")
public class PersonalController extends BasicController {
    private static final long serialVersionUID = -382049424042736019L;
    @Autowired
    private SquirrelUserService squirrelUserService;
    @Autowired
    private UserShopsRelaService userShopsRelaService;

    @RequestMapping("index")
    public String index(Model model) {
        SquirrelUser user = getMemoryUser();
        model.addAttribute("user",user);
        return "personal/index";
    }

    @RequestMapping("modify")
    @ResponseBody
    public JsonResponse modify(String name,String email,Double money){
        if(StringUtils.isEmpty(name) && StringUtils.isEmpty(email) && money ==null){
            return JsonResponse.ofFail("参数错误");
        }
        SquirrelUser user = getMemoryUser();
        if(StringUtils.isNotEmpty(name)){
            user.setUserName(name);
        }
        if(StringUtils.isNotEmpty(email)){
            if(!isEmail(email)){
                return JsonResponse.ofFail("请输入正确的邮箱哦~");
            }
            user.setEmail(email);
        }
        if(money!=null){
            user.setMoney(user.getMoney()+money);
        }
        squirrelUserService.updateByPrimaryKeySelective(user);
        return JsonResponse.ofSuccess();
    }

    @RequestMapping("buyHistory")
    public String buyHistory(Model model){
        SquirrelUser user = getMemoryUser();
        List<UserShopsRelaDto> list = userShopsRelaService.selectDtosByUserId(user.getUserId());
        model.addAttribute("list",list);
        return "personal/buyHistory";
    }
    private boolean isEmail(String email) {
        if(StringUtils.isEmpty(email)){
            return false;
        }
        String str = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
        Pattern p = Pattern.compile(str);
        Matcher m = p.matcher(email);
        return m.matches();
    }
}
