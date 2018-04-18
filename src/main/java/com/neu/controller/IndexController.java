package com.neu.controller;

import com.neu.dao.FoodDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String showIndex(){
        return "index";
    }

    @RequestMapping(value = "/user-dashboard.htm",method = RequestMethod.GET)
    public String showUserdashboard(){
        return "user-dashboard";
    }

    @RequestMapping(value = "/menu.htm",method = RequestMethod.GET)
    public String showMenu(ModelMap map, FoodDAO foodDAO){
        map.addAttribute("foodlist",foodDAO.getFoodList());
        return "menu";
    }

    @RequestMapping(value = "/error.htm",method = RequestMethod.GET)
    public String showError(){return "error";}
}
