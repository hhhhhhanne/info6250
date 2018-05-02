package com.neu.controller;

import com.neu.dao.FoodDAO;
import com.neu.exception.FoodException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String showIndex(ModelMap map,FoodDAO foodDAO) throws FoodException {
        map.addAttribute("foodlist",foodDAO.getFoodList());
        map.addAttribute("typesList",foodDAO.getTypesList());
        return "index";
    }

    @RequestMapping(value = "/user-dashboard.htm",method = RequestMethod.GET)
    public String showUserdashboard(){
        return "user-dashboard";
    }

    @RequestMapping(value = "/menu.htm",method = RequestMethod.GET)
    public String showMenu(ModelMap map, FoodDAO foodDAO, HttpServletRequest request) throws FoodException {
        if (request.getParameter("type")==null){
            map.addAttribute("foodlist",foodDAO.getFoodList());
            map.addAttribute("typesList",foodDAO.getTypesList());
            return "menu";
        }else {
            map.addAttribute("foodlist",foodDAO.getFoodListByType(request.getParameter("type")));
            map.addAttribute("typesList",foodDAO.getTypesList());
            return "menu";
        }
    }

    @RequestMapping(value = "/error.htm",method = RequestMethod.GET)
    public String showError(){return "error";}

    @RequestMapping(value = "/browseAll.htm",method = RequestMethod.GET)
    public String showBrowse(){
        return "browseAll";
    }
}
