/*
 * This product includes software developed by the
 * Apache Software Foundation (http://www.apache.org/).
 */
package ocrs.servlet;

import java.io.*;
import java.util.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import ocrs.*;


/**
 * 针对教师查看选课结果页面的Servlet
 * @author Zhu Qiang
 * @version 1.0
 */
public class CourseList extends Common
{
    public void doGet ( HttpServletRequest request, 
                        HttpServletResponse response )
        throws ServletException, IOException
    {
        //设置提交表单的中文编码
        request.setCharacterEncoding("utf-8");
        HttpSession mySession = request.getSession(true);
        
        //清空错误消息
        mySession.setAttribute("errMsg","");
        
        //列出所有课程的选课情况
        Vector allCourses = getAllCourseInfo();
        mySession.setAttribute( "courses", allCourses );
        response.sendRedirect("../courseList.jsp");
        return;
    }
    
    public void doPost ( HttpServletRequest request, 
                           HttpServletResponse response )
        throws ServletException, IOException 
    {
        doGet( request, response );
    }
    
    //获取用户所有已经选取的课程列表
    private Vector getAllCourseInfo()
    {
        //获得数据库连接
        Connection conn = this.getDBConnection();
        if ( conn == null )
        {
            return null;
        }
        Statement stmt = null;
        ResultSet rs = null;
        
        try
        {
            stmt = conn.createStatement();
            //执行SQL语句
            //格式：IF(Condition,A,B)
            //意义：当Condition为TRUE时，返回A；当Condition为FALSE时，返回B。
            String sQuery = "select course.*,IF(elective.course_id, count(*), 0) as amount "
                          + "from course left join elective "
                          + "on course.course_id = elective.course_id "
                          + "group by course.course_id";
            System.out.println(sQuery);
            rs = stmt.executeQuery( sQuery );
            //留着在页面上显示的课程列表
            Vector courses = new Vector();
            while ( rs.next() )
            {
                Course course = new Course();
                course.setCourseId( rs.getString( "course_id" ) );
                course.setCourseName( rs.getString( "course_name" ) );
                course.setTeacher( rs.getString( "teacher" ) );
                course.setPoint( rs.getInt( "point" ) );
                course.setTime1( rs.getString( "time_1" ) );
                course.setTime2( rs.getString( "time_2" ) );
                course.setClassroom( rs.getString( "classroom" ) );
                course.setLimited( rs.getInt( "limited" ) );
                course.setAmount( rs.getInt( "amount" ) );
                
                courses.add(course);
            }
            return courses;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            try
            {
                rs.close();
                stmt.close();
                conn.close();
            }catch(Exception ex)
            {
            }
        }
    }

}