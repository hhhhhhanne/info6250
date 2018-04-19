package com.neu.dao;

import com.neu.pojo.Orders;
import com.neu.pojo.Orderdetail;
import com.neu.pojo.Users;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.List;

public class OrderDAO extends DAO{
    public OrderDAO() {
    }
    public List<Orders> getOrderList(){
        begin();
        Query q = getSession().createQuery("from Orders");
        List<Orders> foodList = q.list();
        commit();
        return foodList;
    }
    public Orders addOrder(Orders o) throws Exception{
        try {
            begin();
            getSession().save(o);
            commit();
            return o;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
    }
    public Orderdetail addOrderdetail(Orderdetail orderdetail){
        begin();
        getSession().save(orderdetail);
        commit();
        return orderdetail;
    }
    public List<Orders> getUserOrder(Users user){
        begin();
        Query q = getSession().createQuery("from Orders o where o.users=?");
        q.setParameter(0,user);
        List<Orders> ordersList = q.list();
        commit();
        return ordersList;
    }
    public List<Orderdetail> getOrderDetails(int orderid){
        begin();
        Query q = getSession().createQuery("from Orderdetail od where od.order.id=?");
        q.setParameter(0,orderid);
        List<Orderdetail> orderdetails = q.list();
        commit();
        return orderdetails;
    }

}
