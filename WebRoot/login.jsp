<%@page contentType="text/html;charset=gbk" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ch04.*" %>
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
  <title>���¼ѡ��ϵͳ</title>
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="login.js"></script>
  <link rel="stylesheet" type="text/css" href="common/bootstrap.min.css" TITLE="common"></link>
  <style type="text/css">
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
<div class="container">
  <form class="form-login" name="form_main" action="servlet/Login" method="post" 
      onsubmit="return checkInput();" onreset="resetForm()">
<h3>���¼ѡ��ϵͳ</h3>
  <input type="text" class="form-control" name="username" placeholder="ѧ�Ż��û���" value="<%=sUsername%>" required autofocus></input>
            
  <input type="password" class="form-control" name="password" placeholder="����" required></input>


     
  <input type="radio" name="role" value="0" style="border-width: 0px;"
<%
if( sRole.equals("0") )
{
%>
            checked
<%
}
%>
          >ѧ�� &nbsp;
  <input type="radio" name="role" value="1" style="border-width: 0px;"
<%
if( sRole.equals("1") )
{
%>
            checked
<%
}
%>
          >��ʦ
          
  <button class="btn btn-lg btn-primary btn-block" type="submit">��¼</button>
</form>
</div>
</body>
</html>