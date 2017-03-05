package web.webstore;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/3/4.
 */
@Controller
@RequestMapping("webstore")
public class Webstore {
    @RequestMapping("webstore")
    public String search(){

        return "websotre/search";
    }
}

