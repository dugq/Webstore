package web;

import internal.basic.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Enum.UserTypeEnum;
import pojo.dto.JsonResponse;
import pojo.entity.SquirrelUser;
import service.SquirrelUserService;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
            model.addAttribute("error","账号或密码为空~");
            return "login";
        }
        SquirrelUser user = squirrelUserService.selectByUserName(userName);
        if(user!=null && user.getPassword().equals(password.trim())){
            getSession().setAttribute(SquirrelUser.SESSION_KIY,user);
        }else{
            model.addAttribute("error","用户名或密码错误，请重试~");
            return "login";
        }
        return "redirect:/";
    }

    @RequestMapping("logout")
    public String logout( Model model){
        getSession().removeAttribute(SquirrelUser.SESSION_KIY);
        return "redirect:/";
    }

    @RequestMapping("register")
    @ResponseBody
    public JsonResponse register(String userName, String password, String email, String realName, String rePassword){
        String error = null;
        if(StringUtils.isEmpty(userName)){
            error = "用户名不可以为空哦~";
        }else if(StringUtils.isEmpty(password)){
            error = "密码不可以为空哦~";
        }else if(!password.equals(rePassword)){
            error = "两次输入的密码不同哦~";
        }else if(!isEmail(email)){
            error = "请输入合法的邮箱吧~";
        }
        if(StringUtils.isNotEmpty(error)){
            return JsonResponse.ofFail(error);
        }
        SquirrelUser user = buildSquirrelUser(userName, password, email, realName);
        squirrelUserService.insertSelective(user);
        JsonResponse response = JsonResponse.ofSuccess();
        response.put("message","注册成功，请登录吧~");
        return response;
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
    private SquirrelUser buildSquirrelUser(String userName, String password, String email, String realName) {
        SquirrelUser user = new SquirrelUser();
        user.setEmail(email);
        user.setMoney((double) 0);
        user.setPassword(password);
        user.setUserName(userName);
        user.setRealName(realName);
        user.setUserType((byte) UserTypeEnum.consumer.getValue());
        return user;
    }
}
