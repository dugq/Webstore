package web.support;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/3/4.
 */
@Controller("supportIndex")
@RequestMapping("support")
public class Index {
    @RequestMapping("index")
    private String index(){
        return "support/index";
    }
}
