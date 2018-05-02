package com.neu.controller;

import com.neu.dao.FoodDAO;
import com.neu.exception.FoodException;
import com.neu.pojo.Food;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AjaxController {

    List<Food> foodList;
    public AjaxController() throws FoodException {
        FoodDAO foodDAO = new FoodDAO();
        foodList =foodDAO.getFoodbyCri();
    }

    @RequestMapping(value = "/ajaxservice.htm", method = RequestMethod.POST)
    @ResponseBody
    public String ajaxService(HttpServletRequest request, FoodDAO foodDAO)
    {
//        List<Food> foodList = foodDAO.getFoodList();
        String queryString = request.getParameter("food");
        String result = "";
        for(int i =0;i<foodList.size();i++){
            if(foodList.get(i).getName().toLowerCase().contains(queryString.toLowerCase())){
                result +=foodList.get(i)+",";
            }
        }
        return result;
    }
}
