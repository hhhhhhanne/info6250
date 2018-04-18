package com.neu.dao;

import com.neu.pojo.Food;
import org.hibernate.query.Query;


import java.util.List;

public class FoodDAO extends DAO{
    public FoodDAO() {
    }
    public List<Food> getFoodList(){
        begin();
        Query q = getSession().createQuery("from Food");
        List<Food> foodList = q.list();
        commit();
        return foodList;
    }
    public Food findFood(int id){
        begin();
        Query q = getSession().createQuery("from Food f where f.id=?");
        q.setParameter(0,id);
        Food food = (Food) q.uniqueResult();
        commit();
        return food;
    }
}
