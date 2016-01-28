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
<html>
<head>
  <title>请登录选课系统</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="login.js"></script>
  <link rel="stylesheet" type="text/css" href="common\cmnStyle.css" TITLE="common"></link>

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
<table border=0 cellpadding=0 cellspacing=0 height=100>
  <tr>
    <td>
      &nbsp;
    </td>
  </tr>
</table>
<form name="form_main" action="servlet/Login" method="post" 
      onsubmit="return checkInput();" onreset="resetForm()">
<table border=0 cellpadding=0 cellspacing=2 bgcolor="#000000" align=center>
  <tr>
    <td>
      <table border=0 cellpadding=0 cellspacing=0 bgcolor="#ffffff" width=300>
        <tr>
          <td>
            <br>&nbsp;&nbsp;请输入用户名和密码并选择用户种别：
          </td>
        </tr>
        <tr>
          <td height=5></td>
        </tr>
        <tr>
          <td align=center>
            <table border=0 cellpadding=0 cellspacing=0 bgcolor="#ffffff">
              <tr>
                <td align=right>用户名：</td>
                <td>
                  <input type="text" name="username" length=10 maxlength=20 value="<%=sUsername%>"></input>
                </td>
              </tr>
              <tr>
                <td align=right>密码：</td>
                <td>
                  <input type="password" name="password" length=10 maxlength=20></input>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height=5></td>
        </tr>
        <tr>
          <td align=center>
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
          </td>
        </tr>
        <tr>
          <td height=5></td>
        </tr>
        <tr>
          <td align=center>
            <input type="submit" value="登录"></input>
            <input type="reset" value="清除"></input>
          </td>
        </tr>
        <tr>
          <td height=10></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>