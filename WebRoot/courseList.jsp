<%@page contentType="text/html;charset=utf-8" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ocrs.*" %>
<%@include file="inc/cmnAuthenticate.jsp" %>
<%
Vector vCourses = (Vector)session.getAttribute("courses");
if ( vCourses == null )
{
    vCourses = new Vector();
}
%>
<html>
<head>
  <title>选课情况一览</title>
  <link rel="shortcut icon" href="img/smlogo.png">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="courseList.js"></script>
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
<header class="top" role="header">
        <div class="container">
            <a href="#" class="navbar-brand pull-left">江苏科技大学</a>
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="glyphicon glyphicon-align-justify"></span>
            </button>
            <nav class="navbar-collapse collapse" role="navigation">
                <ul class="navbar-nav nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>
<div class="container">
    <div class="row col-lg-2">
        <ul class="nav nav-pills nav-stacked">
          <li role="presentation" class="active"><a href="servlet/AddCourse">添加新课程</a></li>
          <li role="presentation"><a href="#">学生选课情况</a></li>
          <li role="presentation"><a href="logout.jsp">退出登录</a></li>
       </ul>
    </div>

<div class="row col-lg-10" >
<form name="form_main" action="servlet/CourseList" method="post" 
      onsubmit="return checkInput();" onreset="resetForm()">
<tablealign=center>
  <tr>
    <td>
      <table width=700>
        <tr>
          <td align=left height=20>
            欢迎你，<font color=blue><%=session.getAttribute("realname")%></font>！
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <table>
        <tr>
          <td>
            <br>&nbsp;&nbsp;目前的选课情况如下：
          </td>
        </tr>
        <tr>
          <td height=5>
          </td>
        </tr>
        <tr>
          <td align=center height=300 valign=top>
             <table class="table table-hover table-bordered">
              <thead>
                <th align=center>课程编号</th>
                <th align=center>课程名称</th>
                <th align=center>授课老师</th>
                <th align=center>学分</th>
                <th align=center>上课时间</th>
                <th align=center>上课地点</th>
                <th align=center>限制人数</th>
                <th align=center>已选人数</th>
              </thead>
              <tbody>
<%
for ( int i=0; i<vCourses.size(); i++ )
{
    Course course = (Course)vCourses.get(i);
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
                  <%=course.getLimited()%>
                </td>
                <td align=center>
                  <%=course.getAmount()%>
                </td>
              </tr>
<%
}
%>
              </tbody>
            </table>
          </td>
        </tr>
        <tr>
          <td height=10></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</form>
</div>
</div>
</body>
</html>