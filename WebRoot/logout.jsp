<%@page contentType="text/html;charset=gbk" %>
<%
session.invalidate();

response.sendRedirect("login.jsp");
%>