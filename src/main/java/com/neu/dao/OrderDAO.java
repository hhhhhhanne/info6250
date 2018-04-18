package com.neu.dao;

import com.neu.pojo.Orders;
import com.neu.pojo.Orderdetail;
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

}
