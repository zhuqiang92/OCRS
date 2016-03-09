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
 * 针对学生选课登录结果页面的Servlet
 * @author Zhu Qiang
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
        
        String sUsername = (String)mySession.getAttribute( "username" );
        
        //是否进入默认页面
        if ( !request.getParameterNames().hasMoreElements() )
        {
            //如果是默认进入页面，则选出所有备选的课程
            Vector allCourses = getAllSelectedCourse( sUsername );
            mySession.setAttribute( "courses", allCourses );
            response.sendRedirect("../viewCourse.jsp");
            return;
        }
        else
        {
            //获取表单变量
            String sDeletedId = request.getParameter("deletedId");
            //尝试进行删除
            boolean bDelete = deleteCourse(sUsername, sDeletedId);
            //如果删除成功，则跳转到选课结果一览页面
            if ( bDelete )
            {
                //response.sendRedirect("../viewCourse.jsp");//This is also OK!!
                response.sendRedirect("../servlet/ViewCourse");
                return;
            }
            else
            {
            	Vector allCourses = getAllSelectedCourse( sUsername );
                mySession.setAttribute( "courses", allCourses );
                response.sendRedirect("../viewCourse.jsp");
                return;
            }
        }
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
                course.setClassroom( rs.getString( "classroom" ) );
                
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
    private boolean deleteCourse(String username, String courseId){
        //获得数据库连接
        Connection conn = this.getDBConnection();
       
        Statement stmt = null;
        //ResultSet rs = null;
        
        try {
        	stmt = conn.createStatement();
        	//尝试进行删除
        	System.out.println("delete from elective where username = " + username + " and course_id = " + courseId);
            //String sqlDelete = "delete from elective where course_id = " + courseId;
        	String sqlDelete = "delete from elective where username = '" + username + "' and course_id = '" + courseId+"'";
			stmt.executeUpdate( sqlDelete );
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
        	return false;
		}
        finally
        {
            try
            {
                //rs.close();
                stmt.close();
                conn.close();
            }catch(Exception ex)
            {
            }
        }
    }
}