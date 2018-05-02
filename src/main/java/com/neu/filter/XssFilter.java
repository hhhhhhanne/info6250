package com.neu.filter;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

public class XssFilter implements Filter {
    FilterConfig filterConfig = null;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        //获得所有请求参数名
        Enumeration params = req.getParameterNames();

        String sql = "";
        while (params.hasMoreElements()) {
            //得到参数名
            String name = params.nextElement().toString();
            //System.out.println("name===========================" + name + "--");
            //得到参数对应值
            String[] value = req.getParameterValues(name);
            for (int i = 0; i < value.length; i++) {
                sql = sql + value[i];
            }
        }
        System.out.println("string be matched：" + sql);
        if (sqlValidate(sql)) {
            res.sendRedirect("error");
        } else {
            chain. doFilter (new XssHttpServletRequestWrapper((HttpServletRequest) request), response);
        }
    }

    //校验
    protected static boolean sqlValidate(String str) {
        str = str.toLowerCase();//统一转为小写
        //String badStr = "and|exec";
        String badStr = "'|and|exec|execute|insert|select|delete|update|count|drop|chr|mid|master|truncate|char|declare|sitename|net user|xp_cmdshell|like";
        /*String badStr = "'|and|exec|execute|insert|create|drop|table|from|grant|use|group_concat|column_name|" +
                "information_schema.columns|table_schema|union|where|select|delete|update|order|by|count|*|" +
                "chr|mid|master|truncate|char|declare|or|;|-|--|+|,|like|//|/|%|#";    */    //过滤掉的sql关键字，可以手动添加
        String[] badStrs = badStr.split("\\|");
        for (int i = 0; i < badStrs.length; i++) {
            if (str.indexOf(badStrs[i]) != -1) {
                System.out.println("matched：" + badStrs[i]);
                return true;
            }
        }
        return false;
    }

    public void destroy() {
        this.filterConfig = null;
    }
}
