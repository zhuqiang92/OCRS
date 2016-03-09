<%@page contentType="text/html;charset=utf-8" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ocrs.*" %>
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
    <Style type="text/css">
    .banner {
        background-color: #373737;
    }
    
    .banner .container {
        background-color: #009b9b;
        min-height: 200px;
        padding: 40px 30px 30px 40px;
    }
    </style>
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
            <li role="presentation" class="active"><a href="servlet/ChooseCourse">继续选课</a></li>
            <li role="presentation"><a href="#">学生选课情况</a></li>
            <li role="presentation"><a href="#">打印课表</a></li>
            <li role="presentation"><a href="logout.jsp">退出登录</a></li>
        </ul>
    </div>
    <div class="row col-lg-10">
    	<div>
    		<h3> 欢迎你，<font color=blue><%=session.getAttribute("realname")%></font>！你已经选择的课程列表如下：</h3>
    	</div>
        <form name="form_main" action="servlet/ViewCourse" method="post" onsubmit="return checkInput();" onreset="resetForm()">
                                    <table class="table table-hover table-bordered">
                                        <!-- width=680 -->
                                        <thead>
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
%><tr>
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
        <%=course.getTime1Express()%>
            <br>
            <%=course.getTime2Express()%>
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
            你当前选课的总学分为：
            <font color=blue>&nbsp;
                <%=iSumPoint%>&nbsp;</font>分。
        </td>
    </tr>
    </tbody>
    </table>

    <input type="hidden" name="deletedId" value="">
    <!-- 2016/2/20 -->
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
    </div>
    </div>
    </body>

    </html>
