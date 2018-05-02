package com.neu.controller;

import com.neu.dao.FoodDAO;
import com.neu.dao.OrderDAO;
import com.neu.dao.UserDAO;
import com.neu.exception.FoodException;
import com.neu.exception.OrderException;
import com.neu.exception.UserException;
import com.neu.pojo.Food;
import com.neu.pojo.Orderdetail;
import com.neu.pojo.Orders;
import com.neu.pojo.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {
//    @RequestMapping(value = "/viewMyOrder.htm",method = RequestMethod.GET)
//    public String viewMyOrder(HttpServletRequest request, UserDAO userDAO, OrderDAO orderDAO) throws UserException, OrderException {
//        Users user = userDAO.get((String) request.getSession().getAttribute("user"));
//        List<Orders> ordersList = orderDAO.getUserOrder(user);
//        request.setAttribute("ordersList",ordersList);
//        return "viewmyorder";
//    }
//
//    @RequestMapping(value = "/viewDetail.htm", method = RequestMethod.GET)
//    public String orderDetail(OrderDAO orderDAO,HttpServletRequest request) throws OrderException {
//        int orderid = Integer.parseInt(request.getParameter("orderid"));
//        List<Orderdetail> orderdetails = orderDAO.getOrderDetails(orderid);
//        request.setAttribute("orderDetails",orderdetails);
//        return "viewDetail";
//    }
//    @RequestMapping(value = "/selectByName.htm",method = RequestMethod.POST)
//    public String search(HttpServletRequest request, ModelMap map, FoodDAO foodDAO) throws FoodException {
//        String name = request.getParameter("name");
//        String type = request.getParameter("typesName");
//        if (type.equals("0")){
//            return "redirect:/browseAll.htm";
//        }else {
//            List<Food> foodList = foodDAO.searchFood(name,type);
//            map.addAttribute("foodlist",foodList);
//            return "menu";
//        }
//    }
}
