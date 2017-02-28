package internal.basic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import pojo.Enum.UserType;
import pojo.entity.SquirrelUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.Serializable;

/**
 * Created by Administrator on 2017/2/27.
 */
public  class BasicController  implements ApplicationContextAware, Serializable{
    private static final long serialVersionUID = 2519622392605364334L;
    protected Logger log = LoggerFactory.getLogger(this.getClass());// 日志
    protected ApplicationContext springContext;

    protected HttpServletRequest getRequest() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }
    /**
     * 获取当前登录业务平台的用户信息.
     */
    public SquirrelUser getMemoryUser() {
        HttpSession httpSession = getSession();
        return (SquirrelUser) httpSession.getAttribute(SquirrelUser.SESSION_KIY);
    }

    public HttpSession getSession() {
        return getRequest().getSession();
    }

    protected boolean doseUserLogin() {
        SquirrelUser user = getMemoryUser();
        return user != null;
    }

    protected boolean isUserAdmin() {
       if(!doseUserLogin()){
           return false;
       }else{
           if(getMemoryUser().getUserType()== UserType.ADMIN.getValue()){
               return true;
           }else{
               return false;
           }
       }
    }
    protected UserType getUserType() {
        if(!doseUserLogin()){
            return null;
        }else{
                return UserType.valueOf(getMemoryUser().getUserType());
        }
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.springContext = applicationContext;
    }
}
