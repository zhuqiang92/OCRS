/*
 * This product includes software developed by the
 * Apache Software Foundation (http://www.apache.org/).
 */
package ch04.servlet;

import java.sql.*;

import javax.servlet.http.*;

/**
 * ���һЩ��ͨ����ĸ���
 * @author ShenYK
 * @version 1.0
 */
public class Common extends HttpServlet
{
    public Connection getDBConnection()
    {
        //����������ݿ�
        try
        {
            //����MySQL��JDBC����
            Class.forName( "com.mysql.jdbc.Driver" );
            //�����ݿ�����
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