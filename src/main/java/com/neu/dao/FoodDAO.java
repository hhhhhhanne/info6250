package com.neu.dao;

import com.neu.pojo.Food;
import com.neu.pojo.Types;
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
    public List<Food> getFoodListByType(String typeName){
        begin();
        Query q = getSession().createQuery("from Food f where f.types.name=?");
        q.setParameter(0,typeName);
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
    public List<Types> getTypesList(){
        begin();
        Query q = getSession().createQuery("from Types");
        List<Types> typesList = q.list();
        commit();
        return typesList;
    }
    public List<Food> searchFood(String name){
        begin();
        Query q = getSession().createQuery("from Food f where f.name like ?");
        List<Food> foodList = q.list();
        commit();
        return foodList;
    }
}
