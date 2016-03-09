<%@page contentType="text/html;charset=utf-8" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ocrs.*" %>
<%@ include file="inc/cmnAuthenticate.jsp" %>
<%
Course course = (Course)session.getAttribute("course");
if ( course == null )
{
    course = new Course();
}
//显示学分和人数的地方
String sPoint = "";
String sLimited = "";
if ( course.getPoint() != 0 )
{
    sPoint = sPoint + course.getPoint();
}
if ( course.getLimited() != 0 )
{
    sLimited = sLimited + course.getLimited();
}
%>
<html>
<head>
    <title>添加课程</title>
    <link rel="shortcut icon" href="img/smlogo.png">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
    <script language="JAVASCRIPT" src="addCourse.js"></script>
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
        <li role="presentation" class="active"><a href="servlet/CourseList">课程情况一览</a></li>
        <li role="presentation"><a href="#">打印选课情况</a></li>
        <li role="presentation"><a href="logout.jsp">退出登录</a></li>
    </ul>
    </div>
    <div class="row col-lg-8">
            <h3>欢迎你，<font color=blue><%=session.getAttribute("realname")%></font>！</h3>
            <h4>请输入新课程详细信息，并点击添加按钮：</h4>
    </div>
    <div class="row col-lg-8 form-group">
            <form class="form-horizontal" name="form_main" action="servlet/AddCourse" method="post" onsubmit="return checkInput();" onreset="resetForm()">
                <div class="form-group">
                    <label class="col-sm-2 control-label">课程编号</label>
                    <div class="col-sm-10">
                        <input name="courseId" type="text" size="6" maxlength="6" value="<%=course.getCourseId()%>" class="form-control" placeholder="请输入6位编号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">课程名称</label>
                    <div class="col-sm-10">
                        <input name="courseName" type="text" size="40" maxlength="20" value="<%=course.getCourseName()%>" class="form-control" placeholder="请输入课程名称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">教师姓名</label>
                    <div class="col-sm-10">
                        <input name="teacher" type="text" size="20" maxlength="20" value="<%=course.getTeacher()%>" class="form-control" placeholder="请输入教师姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">课程学分</label>
                    <div class="col-sm-10">
                        <input name="point" type="text" size="1" maxlength="1" value="<%=sPoint%>" class="form-control" placeholder="请输入课程学分（1～6）">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">第一次</label>
                    <div class="col-sm-3">
                        <select name="time1D" class="form-control">
                            <option value="1"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >星期一</option>
                        <option value="2"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >星期二</option>
                        <option value="3"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >星期三</option>
                        <option value="4"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >星期四</option>
                        <option value="5"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >星期五</option>
                      </select>
                       </div>
                    <div class="col-sm-4">
                      <select name="time1T" class="form-control">
                        <option value="1"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >08:00～10:00</option>
                        <option value="2"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >10:00～12:00</option>
                        <option value="3"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >14:00～16:00</option>
                        <option value="4"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >16:00～18:00</option>
                        <option value="5"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >19:00～21:00</option>
                      </select>
                    </div>
                    </div>
				<div class="form-group">
					<label class="col-sm-2 control-label">第二次</label>
                    <div class="col-sm-3">
                      	<select name="time2D" class="form-control">
                        	<option value="1"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >星期一</option>
                        <option value="2"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >星期二</option>
                        <option value="3"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >星期三</option>
                        <option value="4"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >星期四</option>
                        <option value="5"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >星期五</option>
                      </select>
                    </div>

                    <div class="col-sm-4">
                      <select name="time2T" class="form-control">
                        <option value="1"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >08:00～10:00</option>
                        <option value="2"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >10:00～12:00</option>
                        <option value="3"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >14:00～16:00</option>
                        <option value="4"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >16:00～18:00</option>
                        <option value="5"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >19:00～21:00</option>
                      </select>
                    </div>
				</div>
        		<div class="form-group">
        			<label class="col-sm-2 control-label">上课地点</label>
        			<div class="col-sm-10">
            			<input class="form-control" name="classroom" type="text" size="20" maxlength="20" value="<%=sLimited%>">
        			</div>
        		</div>
        		<div class="form-group">
        			<label class="col-sm-2 control-label">限制人数</label>
        			<div class="col-sm-10">
            			<input class="form-control" name="limited" type="text" size="3" maxlength="3" value="<%=sLimited%>">
        			</div>
        		</div>
        		<div class="form-group">
        			<div class="col-sm-offset-2 col-sm-10">
            			<input type="submit" value="添加" class="btn btn-success"></input>
            			<input type="reset" value="取消" class="btn btn-warning"></input>
            		</div>
            	</div>
           </form>
		</div>
	</div>
</body>
</html>