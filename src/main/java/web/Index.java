package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.dto.SquirrelClassificationDto;
import service.SquirrelClassificationService;

import java.util.List;

/**
 * Created by Administrator on 2017/2/26.
 */
@Controller
@RequestMapping
public class Index {
    @Autowired
    private SquirrelClassificationService squirrelClassificationService;
    @RequestMapping
    public String index(Model model){
        List<SquirrelClassificationDto> list = squirrelClassificationService.selectAllDtos();
        model.addAttribute("list",list);
        return "index";
    }
}
