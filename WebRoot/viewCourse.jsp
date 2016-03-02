<%@page contentType="text/html;charset=utf-8" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ch04.*" %>
<%@ include file="inc/cmnAuthenticate.jsp" %>
<%
Vector vCourses = (Vector)session.getAttribute("courses");
if ( vCourses == null )
{
    vCourses = new Vector();
}
//计算总学分
int iSumPoint = 0;
%>
<html>
<head>
  <title>选课结果一览</title>
  <link rel="shortcut icon" href="img/smlogo.png">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="viewCourse.js"></script>
  <link rel="stylesheet" href="common/css/bootstrap.min.css" type="text/css"></link>
  <script language="JAVASCRIPT">
<%
    if ( session.getAttribute("errMsg") != null )
    {
%>
        var sErrMsg = "<%=session.getAttribute("errMsg")%>";
<%
    }
    else
    {
%>
        var sErrMsg = "";
<%
    }
%>
  </script>
</head>
<body>
<form name="form_main" action="servlet/ViewCourse" method="post" 
      onsubmit="return checkInput();" onreset="resetForm()">
<table border=0 cellpadding=0 cellspacing=2 bgcolor="#000000" align=center>
  <tr>
    <td>
      <table border=0 cellpadding=0 cellspacing=0 bgcolor="#ffffff" width=700>
        <tr>
          <td align=left height=20>
            欢迎你，<font color=blue><%=session.getAttribute("realname")%></font>！
          </td>
          <td align=right>
            <a href="servlet/ChooseCourse">继续选课</a>
            &nbsp;| &nbsp;
            <a href="logout.jsp">退出登录</a>
            &nbsp;
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <table border=0 cellpadding=0 cellspacing=0 bgcolor="#ffffff"><!-- width=700 -->
        <tr>
          <td>
            <br>&nbsp;&nbsp;你已经选择的课程列表如下：
          </td>
        </tr>
        <tr>
          <td height=5>
          </td>
        </tr>
        <tr>
          <td align=center height=300 valign=top>
            <table class="table table-hover table-bordered" border=0 cellpadding=0 cellspacing=2 bgcolor="#ffffff"><!-- width=680 -->
              <thead bgcolor=#CCCCFF height=18>
                <th align=center>课程编号</th>
                <th align=center>课程名称</th>
                <th align=center>授课老师</th>
                <th align=center>学分</th>
                <th align=center>上课时间</th>
                <th align=center>上课地点</th>
                <th align=center>操作</th>
              </thead>
              <tbody> 
<%
for ( int i=0; i<vCourses.size(); i++ )
{
    Course course = (Course)vCourses.get(i);
    //累加总学分
    iSumPoint = iSumPoint + course.getPoint();
%>
              <tr>
                <td align=center>
                  <%=course.getCourseId()%>
                </td>
                <td>
                  <%=course.getCourseName()%>
                </td>
                <td>
                  <%=course.getTeacher()%>
                </td>
                <td align=center>
                  <%=course.getPoint()%>
                </td>
                <td align=center>
                  <%=course.getTime1Express()%><br><%=course.getTime2Express()%>
                </td>
                <td align=center>
                  <%=course.getClassroom()%>
                </td>
                <td align=center>
                  <button class="btn btn-danger btn-xs" onclick="myDelete('<%=course.getCourseId()%>')"><span class="glyphicon glyphicon-remove"></span>&nbsp;删除</button>
                </td>
                
              </tr>
<%
}
%>
              
              <tr>
                <td colspan=7>
                  你当前选课的总学分为：<font color=blue>&nbsp;<%=iSumPoint%>&nbsp;</font>分。
                </td>
              </tr>
             </tbody>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<input type="hidden" name="deletedId" value=""><!-- 2016/2/20 -->
</form>
</body>
</html>