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
  <title>在线选课</title>
  <link rel="shortcut icon" href="img/smlogo.png">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="chooseCourse.js"></script>
  <link rel="stylesheet" href="common/css/bootstrap.min.css" type="text/css"></link>

  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.2.0/styles/default.min.css">
  <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.2.0/highlight.min.js"></script> 
 
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
            <li role="presentation" class="active"><a href="servlet/ViewCourse">已选课程列表</a></li>
            <li role="presentation"><a href="#">打印课表</a></li>
            <li role="presentation"><a href="logout.jsp">退出登录</a></li>
        </ul>
    </div>
    <div class="row col-lg-10">
    	<div>
    		<h3> 欢迎你，<font color=blue><%=session.getAttribute("realname")%></font>！你可以选择的课程列表如下：</h3>
    	</div>
		<form name="form_main" action="servlet/ChooseCourse" method="post" 
      		onsubmit="return checkInput();" onreset="resetForm()">

            <table class="table table-hover table-bordered table-sort table-sort-search">
              <thead>
                <th class="table-sort">课程编号</th>
                <th class="table-sort">课程名称</th>
                <th class="table-sort">授课老师</th>
                <th class="table-sort">学分</th>
                <th class="table-sort">上课时间</th>
                <th class="table-sort">上课地点</th>
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
                  <%=course.getClassroom()%>
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
<input type="hidden" name="courseId" value="">
</form>
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
<nav>
  <ul class="pager">
    <li><a href="#">Previous</a></li>
    <li><a href="#">Next</a></li>
  </ul>
</nav>
</div>
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