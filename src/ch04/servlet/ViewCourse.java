/*
 * This product includes software developed by the
 * Apache Software Foundation (http://www.apache.org/).
 */
package ch04.servlet;

import java.io.*;
import java.util.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import ch04.*;

/**
 * 针对学生选课登录结果页面的Servlet
 * @author ZhuQiang
 * @version 1.0
 */
public class ViewCourse extends Common
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
        
        //2016/2/20获取表单变量
        String sCourseId = request.getParameter("courseId");
        
        //选出所有备选的课程
        String sUsername = (String)mySession.getAttribute( "username" );
        Vector allCourses = getAllSelectedCourse( sUsername );
        /*2016/2/22
        deleteCourse(sCourseId);
        */
        mySession.setAttribute( "courses", allCourses );
        response.sendRedirect("../viewCourse.jsp");
        return;
    }
    
    public void doPost ( HttpServletRequest request, 
                           HttpServletResponse response )
        throws ServletException, IOException 
    {
        doGet( request, response );
    }
    
    //获取用户所有已经选取的课程列表
    private Vector getAllSelectedCourse( String sUsername )
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
            String sQuery = "select course.* from course, elective "
                          + "where course.course_id = elective.course_id "
                          + "and elective.username='" + sUsername + "' "
                          + "order by course_id";
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
    
    //2016/2/20删除某一已选课程
    private void deleteCourse(String courseId){
        //获得数据库连接
        Connection conn = this.getDBConnection();
       
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
        	stmt = conn.createStatement();
        	//尝试进行删除
            String sqlDelete = "delete from elective where course_id="+courseId;
			stmt.executeUpdate( sqlDelete );
		} catch (SQLException e) {
			e.printStackTrace();
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