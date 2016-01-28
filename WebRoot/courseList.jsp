<%@page contentType="text/html;charset=gbk" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ch04.*" %>
<%@ include file="inc/cmnAuthenticate.jsp" %>
<%
Vector vCourses = (Vector)session.getAttribute("courses");
if ( vCourses == null )
{
    vCourses = new Vector();
}
%>
<html>
<head>
  <title>ѡ�����һ��</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="courseList.js"></script>
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
<table border=0 cellpadding=0 cellspacing=0 height=10>
  <tr>
    <td>
      &nbsp;
    </td>
  </tr>
</table>
<form name="form_main" action="servlet/CourseList" method="post" 
      onsubmit="return checkInput();" onreset="resetForm()">
<table border=0 cellpadding=0 cellspacing=2 bgcolor="#000000" align=center>
  <tr>
    <td>
      <table border=0 cellpadding=0 cellspacing=0 bgcolor="#ffffff" width=700>
        <tr>
          <td align=left height=20>
            ��ӭ�㣬<font color=blue><%=session.getAttribute("realname")%></font>��
          </td>
          <td align=right>
            <a href="servlet/AddCourse">����¿γ�</a>
            &nbsp;| &nbsp;
            <a href="logout.jsp">�˳���¼</a>
            &nbsp;
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <table border=0 cellpadding=0 cellspacing=0 bgcolor="#ffffff" width=700>
        <tr>
          <td>
            <br>&nbsp;&nbsp;Ŀǰ��ѡ��������£�
          </td>
        </tr>
        <tr>
          <td height=5>
          </td>
        </tr>
        <tr>
          <td align=center height=300 valign=top>
            <table border=0 cellpadding=0 cellspacing=2 bgcolor="#ffffff" width=680>
              <tr bgcolor=#cccccc height=18>
                <td width=50 align=center>
                  �γ̱��
                </td>
                <td width=250 align=center>
                  �γ�����
                </td>
                <td width=50 align=center>
                  �ڿ���ʦ
                </td>
                <td width=40 align=center>
                  ѧ��
                </td>
                <td width=150 align=center>
                  �Ͽ�ʱ��
                </td>
                <td width=50 align=center>
                  ��������
                </td>
                <td width=50 align=center>
                  ��ѡ����
                </td>
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
                  <%=course.getLimited()%>
                </td>
                <td align=center>
                  <%=course.getAmount()%>
                </td>
              </tr>
<%
}
%>
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
</form>
</body>
</html>