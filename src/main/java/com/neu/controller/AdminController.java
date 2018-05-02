package com.neu.controller;

import com.neu.dao.FoodDAO;
import com.neu.dao.OrderDAO;
import com.neu.dao.TypesDAO;
import com.neu.dao.UserDAO;
import com.neu.exception.FoodException;
import com.neu.exception.OrderException;
import com.neu.exception.UserException;
import com.neu.pojo.Food;
import com.neu.pojo.Orders;
import com.neu.pojo.Types;
import com.neu.pojo.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {
    @RequestMapping(value = "/admin/mngType.htm", method = RequestMethod.GET)
    public String manageTypes(TypesDAO typesDAO,ModelMap map){
        map.addAttribute("typesList",typesDAO.getTypesList());
        return "manageTypes";
    }

    @RequestMapping(value = "/admin/viewFood.htm",method = RequestMethod.GET)
    public String viewFood(HttpServletRequest request, FoodDAO foodDAO, ModelMap map) throws FoodException {
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        List<Food> foodList = foodDAO.getFoodListByType(typeId);
        map.addAttribute("foodList",foodList);
        return "admin-viewFood";
    }

    @RequestMapping(value = "/admin/updateFood.htm",method = RequestMethod.GET)
    public String updateFood(HttpServletRequest request,FoodDAO foodDAO, ModelMap map) throws FoodException {
        int foodId = Integer.parseInt(request.getParameter("foodId"));
        Food food = foodDAO.findFood(foodId);
        map.addAttribute("food",food);
        return "admin-updateFood";
    }

    @RequestMapping(value = "/admin/updateFood.htm",method = RequestMethod.POST)
    public String updateFoodPost(HttpServletRequest request,FoodDAO foodDAO,ModelMap map) throws FoodException {
        int foodId = Integer.parseInt(request.getParameter("foodId"));
        Food food = foodDAO.findFood(foodId);
        food.setName(request.getParameter("foodName"));
        food.setTitle(request.getParameter("foodTitle"));
        food.setInfo(request.getParameter("foodInfo"));
        food.setPrice(Double.valueOf(request.getParameter("foodPrice")));
        food.setImgSrc("images\\"+request.getParameter("foodImg"));

        Types types = food.getTypes();
        List<Food> foodList = foodDAO.getFoodListByType(types.getId());
        map.addAttribute("foodList",foodList);
        return "admin-viewFood";
    }
    @RequestMapping(value = "/admin/deleteFood.htm",method = RequestMethod.GET)
    public String deleteFood(HttpServletRequest request,FoodDAO foodDAO,ModelMap map) throws FoodException {
        int foodId = Integer.parseInt(request.getParameter("foodId"));
        Food food = foodDAO.deleteFood(foodId);
        Types types = food.getTypes();
        List<Food> foodList = foodDAO.getFoodListByType(types.getId());
        map.addAttribute("foodList",foodList);
        return "admin-viewFood";
    }

    @RequestMapping(value = "/admin/addFood.htm",method = RequestMethod.GET)
    public String showAddFood(HttpServletRequest request,ModelMap map){
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        map.addAttribute("typeId",typeId);
        return "admin-addFood";
    }

    @RequestMapping(value = "/admin/addFood.htm",method = RequestMethod.POST)
    public String addFood(HttpServletRequest request,FoodDAO foodDAO,TypesDAO typesDAO,ModelMap map) throws FoodException {
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        Food food = new Food();
        food.setTypes(typesDAO.getTypeById(typeId));
        food.setName(request.getParameter("foodName"));
        food.setTitle(request.getParameter("foodTitle"));
        food.setInfo(request.getParameter("foodInfo"));
        food.setPrice(Double.valueOf(request.getParameter("foodPrice")));
        food.setImgSrc("images\\"+request.getParameter("foodImg"));
        foodDAO.addFood(food);
        Types types = food.getTypes();
        List<Food> foodList = foodDAO.getFoodListByType(types.getId());
        map.addAttribute("foodList",foodList);
        return "admin-viewFood";
    }

    @RequestMapping(value = "/admin/mngUsers.htm",method = RequestMethod.GET)
    public String mngUser(HttpServletRequest request, UserDAO userDAO) throws UserException {
        List<Users> usersList = userDAO.getAllUsers();
        request.setAttribute("userList",usersList);
        return "admin-manageUsers";
    }
    @RequestMapping(value = "/admin/invalidateUser.htm",method = RequestMethod.GET)
    public String deleteUser(HttpServletRequest request, UserDAO userDAO) throws UserException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        userDAO.invalidateUser(userId);
        return "redirect:/admin/mngUsers.htm";
    }
    @RequestMapping(value = "/admin/viewAllOrders.htm",method = RequestMethod.GET)
    public String viewAllOrders(HttpServletRequest request, OrderDAO orderDAO) throws OrderException {
        List<Orders> ordersList = orderDAO.getOrderList();
        request.setAttribute("orderList",ordersList);
        return "admin-vieworders";
    }

}
