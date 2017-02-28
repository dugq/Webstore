package web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/2/26.
 */
@Controller
@RequestMapping
public class Index {
    @RequestMapping
    public String index(){

        return "index";
    }
}
