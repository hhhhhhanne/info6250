package com.neu.dao;

import com.neu.pojo.Types;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.List;

public class TypesDAO extends DAO {
    public List<Types> getTypesList(){
        try {
            begin();
            List<Types> typesList = getSession().createQuery("from Types ").list();
            commit();
            return typesList;
        }catch (HibernateException e){
            rollback();
            throw e;
        }

    }
    public Types addTypes(Types type){
        try{
            begin();
            getSession().save(type);
            commit();
            return type;
        }catch (HibernateException e){
            rollback();
            throw e;
        }
    }

    public Types deleteTypes(Types type){
        try {
            begin();
            getSession().delete(type);
            commit();
            return type;
        }catch (HibernateException e){
            rollback();
            throw e;
        }
    }

    public Types updateTypes(Types types){
        try {
            begin();
            getSession().update(types);
            commit();
            return types;
        }catch (HibernateException e){
            rollback();
            throw e;
        }
    }
    public Types getTypeById(int typeId){
        try {
            begin();
            Query q = getSession().createQuery("from Types t where t.id=?");
            q.setParameter(0,typeId);
            commit();
            return (Types) q.uniqueResult();
        }catch (HibernateException e){
            rollback();
            throw e;
        }
    }
}
