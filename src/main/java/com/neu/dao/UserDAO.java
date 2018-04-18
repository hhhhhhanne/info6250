package com.neu.dao;

import com.neu.pojo.Users;
import org.hibernate.HibernateException;
import org.hibernate.Query;



public class UserDAO extends DAO {

    public UserDAO() {
    }

    public Users get(String username, String password) throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("from Users where username = :username and password = :password");
            q.setString("username", username);
            q.setString("password", password);
            Users user = (Users) q.uniqueResult();
            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get user " + username, e);
        }
    }

    public Users get(String username){
        try {
            begin();
            Query q = getSession().createQuery("from Users where username = :username");
            q.setString("username", username);
            Users user = (Users) q.uniqueResult();
            commit();
            return user;
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return null;

    }
    public Users getByEmail(String email){
        try {
            begin();
            Query q = getSession().createQuery("from Users where email = :email");
            q.setString("email", email);
            Users user = (Users) q.uniqueResult();
            commit();
            return user;
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }


    public Users register(Users u) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            getSession().save(u);
            commit();
            return u;

        } catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
    }

    public boolean updateUser(String username) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            Query q = getSession().createQuery("from Users where username = :username");
            q.setString("username", username);
            Users user = (Users) q.uniqueResult();
            if(user!=null){
                user.setStatus(1);
                getSession().update(user);
                commit();
                return true;
            }else{
                return false;
            }

        } catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }

    }


}