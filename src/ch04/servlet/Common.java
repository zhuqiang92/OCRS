/*
 * This product includes software developed by the
 * Apache Software Foundation (http://www.apache.org/).
 */
package ch04.servlet;

import java.sql.*;

import javax.servlet.http.*;

/**
 * 针对一些共通处理的父类
 * @author ShenYK
 * @version 1.0
 */
public class Common extends HttpServlet
{
    public Connection getDBConnection()
    {
        //尝试连接数据库
        try
        {
            //载入MySQL的JDBC驱动类
            Class.forName( "com.mysql.jdbc.Driver" );
            //获得数据库连接
            Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost/ch04?user=root&password=1234" );
            
            return conn;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
}