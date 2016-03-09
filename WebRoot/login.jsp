<%@page contentType="text/html;charset=utf-8" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ocrs.*" %>
<%
String sUsername = (String)session.getAttribute("username");
if ( sUsername == null )
{
    sUsername = "";
}
String sRole = (String)session.getAttribute("role");
if ( sRole == null )
{
    sRole = "0";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>请登录选课系统</title>
  <link rel="shortcut icon" href="img/smlogo.png">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="login.js"></script>
  <link rel="stylesheet" href="common/css/bootstrap.min.css" type="text/css"></link>
  <style type="text/css">
    .bg_container {
    position: absolute;
    overflow: hidden;
    height: 100%;
    width: 100%;
}
.bg_image {
    background: url(img/login.png);
    background-size: 1757px 845px;
    height: 1191px;
    width: 1884px;
    background-repeat: no-repeat;
    background-position: center top;
    position: absolute;
    left: 50%;
    margin-left: -942px;
    opacity: .8;
}
.login{
    width: 650px;
    height: 400px;
    position: absolute;
    top: 10%;
    bottom: initial;
    left: 0;
    right: 0;
    margin: auto;
}
    .form-login{
      max-width: 330px;
      padding: 15px;
      margin:0 auto;
    }
    input{
      margin-bottom: 3px;
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
<div class="bg_image"></div>
<div class="login">
<form class="form-login" name="form_main" action="servlet/Login" method="post" 
      onsubmit="return checkInput();" onreset="resetForm()">
      <img src="img/index_logo.gif"></img>
<h3>请登录选课系统</h3>
  <input type="text" class="form-control" name="username" placeholder="学号或用户名" value="<%=sUsername%>" required autofocus></input>
            
  <input type="password" class="form-control" name="password" placeholder="密码" required></input>

  <input type="radio" name="role" value="0" style="border-width: 0px;"
<%
if( sRole.equals("0") )
{
%>
            checked
<%
}
%>
          >学生 &nbsp;
  <input type="radio" name="role" value="1" style="border-width: 0px;"
<%
if( sRole.equals("1") )
{
%>
            checked
<%
}
%>
          >教师
          
  <button class="btn btn-lg btn-primary btn-block" type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
</form>
</div>
</body>
</html>