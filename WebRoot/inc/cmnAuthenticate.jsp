<%@page contentType="text/html;charset=gbk" %>
<%@page language="java" import="java.util.*" %>
<%
if(session.getAttribute("username") == null )
{
    session.invalidate();
    response.sendRedirect("login.jsp");
    return;
}
%>