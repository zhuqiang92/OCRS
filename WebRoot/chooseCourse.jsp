<%@page contentType="text/html;charset=utf-8" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ch04.*" %>
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
  <title>在线选课</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="chooseCourse.js"></script>
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
<div class="container">

<table >
  <tr>
    <td>
      &nbsp;
    </td>
  </tr>
</table>
<form name="form_main" action="servlet/ChooseCourse" method="post" 
      onsubmit="return checkInput();" onreset="resetForm()">
<table align=center>
  <tr>
    <td>
      <table>
        <tr>
          <td align=left height=20>
            欢迎你，<font color=blue><%=session.getAttribute("realname")%></font>！
          </td>
          <td align=right>
            <a href="servlet/ViewCourse">已选课程列表</a>
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
      <table>
        <tr>
          <td>
            <br>&nbsp;&nbsp;你可以选择的课程列表如下：
          </td>
        </tr>
        <tr>
          <td height=5>
          </td>
        </tr>
        <tr>
          <td align=center height=300 valign=top>
            <table class="table table-hover table-bordered table-sort table-sort-search" border=0 cellpadding=0 cellspacing=2 bgcolor="#ffffff"><!-- width=680 -->
              <thead bgcolor=#CCCCFF height=18>
                <th class="table-sort">课程编号</th>
                <th class="table-sort">课程名称</th>
                <th class="table-sort">授课老师</th>
                <th class="table-sort">学分</th>
                <th class="table-sort">上课时间</th>
                <th class="table-sort">操作</th>
                <th class="table-sort">限制人数</th>
                <th class="table-sort">已选人数</th>
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
<%
//如果选课人数大于限制人数，不能再选了
if ( course.getLimited() <= course.getAmount() )
{
%>
                  <button class='btn btn-warning btn-xs' disabled><span class="glyphicon glyphicon-lock"></span>&nbsp;已满</button>
<%
}
else
{
%>
                  <button class="btn btn-success btn-xs" onclick="choose('<%=course.getCourseId()%>')"><span class="glyphicon glyphicon-ok"></span>&nbsp;选课</button>
<%
}
%>
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
<input type="hidden" name="courseId" value="">
</form>
</div>
<script type="text/javascript" src="common/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="common/tablesort.js"></script>
<script type="text/javascript">
            // For Demo Purposes
            $(function () {
                $('table.table-sort').tablesort();
                hljs.initHighlightingOnLoad(); // Syntax Hilighting
            });
</script>
</body>
</html>