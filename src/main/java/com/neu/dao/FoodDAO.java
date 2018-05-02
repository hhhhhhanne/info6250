package com.neu.dao;

import com.neu.exception.FoodException;
import com.neu.pojo.Food;
import com.neu.pojo.Types;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;


import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class FoodDAO extends DAO{
    public FoodDAO() {
    }
    public List<Food> getFoodList() throws FoodException {
        try{
            begin();
            Query q = getSession().createQuery("from Food");
            List<Food> foodList = q.list();
            commit();
            return foodList;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("could not get food list", e);
        }

    }
    public List<Food> getFoodListByType(String typeName) throws FoodException {
        try {
            begin();
            Query q = getSession().createQuery("from Food f where f.types.name=?");
            q.setParameter(0,typeName);
            List<Food> foodList = q.list();
            commit();
            return foodList;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("could not get food list", e);
        }

    }
    public Food findFood(int id) throws FoodException {
        try {
            begin();
            Query q = getSession().createQuery("from Food f where f.id=?");
            q.setParameter(0,id);
            Food food = (Food) q.uniqueResult();
            commit();
            return food;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("could not get food", e);
        }

    }
    public List<Types> getTypesList() throws FoodException {
        try{
            begin();
            Query q = getSession().createQuery("from Types");
            List<Types> typesList = q.list();
            commit();
            return typesList;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("could not get types", e);
        }
    }
    public List<Food> searchFood(String name,String type) throws FoodException {
        try {
            begin();
            Query q = getSession().createQuery("from Food f where f.name like ? and f.types.name=?");
            q.setParameter(0,name);
            q.setParameter(1,type);
            List<Food> foodList = q.list();
            commit();
            return foodList;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("could not get type and food", e);
        }

    }
    public List<Food> getFoodListByType(int typeid) throws FoodException {
        try {
            begin();
            Query q = getSession().createQuery("from Food f where f.types.id=?");
            q.setParameter(0,typeid);
            List<Food> foodList = q.list();
            commit();
            return foodList;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("could not get food list", e);
        }
    }
    public Food deleteFood(int foodId) throws FoodException {
        try {
            begin();
            Query q = getSession().createQuery("from Food f where f.id=?");
            q.setParameter(0,foodId);
            Food food = (Food) q.uniqueResult();
            getSession().delete(food);
            commit();
            return food;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("delete failure",e);
        }
    }
    public Food addFood(Food food) throws FoodException {
        try {
            begin();
            getSession().save(food);
            commit();
            return food;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("add failure",e);
        }
    }
    public List<Food> getFoodbyCri() throws FoodException {
        try {
            begin();
            Criteria c = getSession().createCriteria(Food.class);
            List<Food> list = c.list();
            commit();
            return list;
        }catch (HibernateException e){
            rollback();
            throw new FoodException("failure",e);
        }
    }
}
