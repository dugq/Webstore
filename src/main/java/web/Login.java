package web;

import internal.basic.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.entity.SquirrelUser;
import service.SquirrelUserService;

/**
 * Created by Administrator on 2017/2/27.
 */
@Controller
@RequestMapping
public class Login extends BasicController{
    private static final long serialVersionUID = 603446469129492906L;
    @Autowired
    private SquirrelUserService squirrelUserService;

    @RequestMapping("toLogin")
    public String toLoginPage(){
        return "login";
    }

    @RequestMapping("login")
    public String login(String userName, String password, Model model){
        if(StringUtils.isEmpty(userName) && StringUtils.isEmpty(password)){
            model.addAttribute("error","账号或密码为空");
            return "login";
        }
        SquirrelUser user = squirrelUserService.selectByUserName(userName);
        if(user!=null && user.getPassword().equals(password.trim())){
            getSession().setAttribute(SquirrelUser.SESSION_KIY,user);
        }
        return "redirect:/";
    }
}
