package com.neu.dao;

/**
 * 通用DAO接口
 */
import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.procedure.ProcedureCall;

public interface BaseDAO<T> {

    /**
     * 保存一个对象
     */
    public Serializable save(T o);

    /**
     * 更新一个对象
     */
    public void update(T o);

    /**
     * 保存或更新对象
     */
    public void saveOrUpdate(T o);

    /**
     * 合并对象
     */
    public T merge(T o);

    /**
     * 根据id删除一个对象
     */
    public void deleteById(Serializable id);

    /**
     * 删除一个对象
     */
    public void delete(T o);

    /**
     * 批量删除
     */
    public Integer deleteBatch(Serializable[] ids);
    public Integer deleteBatch(List<Serializable> ids);

    public T getById(Serializable id);

    public T get(String hql);

    public T get(String hql, Object[] param);

    public T get(String hql, List<Object> param);

    /**
     * 查询集合
     */
    public List<T> find(String hql);

    /**
     * 查询集合
     */
    public List<T> find(String hql, Object[] param);

    /**
     * 查询集合
     */
    public List<T> find(String hql, List<Object> param);

    /**
     * 查询集合(带分页)
     */
    public List<T> find(String hql, Integer start, Integer rows);

    /**
     * 查询集合(带分页)
     */
    public List<T> find(String hql, Object[] param, Integer start, Integer rows);

    /**
     * 查询集合(带分页)
     */
    public List<T> find(String hql, List<Object> param, Integer start, Integer rows);

    public List<T> find(Integer start, Integer rows);

    public List<T> findAll();

    public List<T> nativeFind(String sql);

    public List<T> nativeFind(String sql, Map<String, Object> param);

    public Object uniqueResult(String hql);

    public Object uniqueResult(String hql, Object[] param);

    public Object uniqueResult(String hql, List<Object> param);

    public Object count();

    /**
     * 执行HQL语句
     */
    public Integer executeHql(String hql);

    /**
     * 执行HQL语句
     */
    public Integer executeHql(String hql, Object[] param);

    /**
     * 执行HQL语句
     */
    public Integer executeHql(String hql, List<Object> param);


    /**
     * 执行SQL语句
     */
    public Integer executeSql(String sql);

    /**
     * 执行SQL语句
     */
    public Integer executeSql(String sql,  Map<String, Object> param);

    /**
     * 执行存储过程
     */
    public ProcedureCall callProc(String name);

}