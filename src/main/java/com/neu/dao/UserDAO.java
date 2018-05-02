package com.neu.dao;

import com.neu.exception.UserException;
import com.neu.pojo.Users;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import java.util.List;


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
            throw new UserException("could not get user",e);
        }
    }

    public Users get(String username) throws UserException {
        try {
            begin();
            Query q = getSession().createQuery("from Users where username = :username");
            q.setString("username", username);
            Users user = (Users) q.uniqueResult();
            commit();
            return user;
        }catch(Exception e){
            System.out.println(e.getMessage());
            rollback();
            throw new UserException("could not get user",e);
        }
    }
    public Users getByEmail(String email) throws UserException {
        try {
            begin();
            Query q = getSession().createQuery("from Users where email = :email");
            q.setString("email", email);
            Users user = (Users) q.uniqueResult();
            commit();
            return user;
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw new UserException("could not get user",e);
        }
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
            throw new UserException("could not create user",e);
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
            throw new UserException("could not update user",e);
        }
    }

    public List<Users> getAllUsers() throws UserException {
        try {
            begin();
            Query q =  getSession().createQuery("from Users ");
            List<Users> usersList = q.list();
            commit();
            return usersList;
        }catch (HibernateException e){
            rollback();
            throw new UserException("could not get userList");
        }
    }

    public Users invalidateUser(int userId) throws UserException {
        try {
            begin();
            Query q = getSession().createQuery("from Users u where u.id=?");
            q.setParameter(0,userId);
            Users u = (Users)q.uniqueResult();
            u.setStatus(0);
            getSession().update(u);
            commit();
            return u;
        }catch (HibernateException e){
            rollback();
            throw new UserException("could not delete");
        }
    }

}