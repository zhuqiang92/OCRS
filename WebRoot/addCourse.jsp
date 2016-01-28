<%@page contentType="text/html;charset=gbk" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="ch04.*" %>
<%@ include file="inc/cmnAuthenticate.jsp" %>
<%
Course course = (Course)session.getAttribute("course");
if ( course == null )
{
    course = new Course();
}
//��ʾѧ�ֺ������ĵط�
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
  <title>��ӿγ�</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <script language="JAVASCRIPT" src="common/cmnScript.js"></script>
  <script language="JAVASCRIPT" src="addCourse.js"></script>
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
<form name="form_main" action="servlet/AddCourse" method="post" 
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
            <a href="servlet/CourseList">�γ����һ��</a>
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
            <br>&nbsp;&nbsp;�������¿γ���ϸ��Ϣ���������¼��ť��
          </td>
        </tr>
        <tr>
          <td height=5>
          </td>
        </tr>
        <tr>
          <td align=center valign=top>
            <table border=0 cellpadding=1 cellspacing=1 bgcolor="#000000" width=680>
              <tr>
                <td width=80 class="td_label" align="center" valign="center">
                  �γ̱��
                </td> 
                <td width=600 class="td_content" align="left" valign="center">
                  <input name="courseId" type="text" size="6" maxlength="6" value="<%=course.getCourseId()%>">
                </td>
              </tr>
              <tr>
                <td width=80 class="td_label" align="center" valign="center">
                  �γ�����
                </td> 
                <td width=600 class="td_content" align="left" valign="center">
                  <input name="courseName" type="text" size="40" maxlength="20" value="<%=course.getCourseName()%>">
                </td>
              </tr>
              <tr>
                <td width=80 class="td_label" align="center" valign="center">
                  ��ʦ����
                </td> 
                <td width=600 class="td_content" align="left" valign="center">
                  <input name="teacher" type="text" size="20" maxlength="20" value="<%=course.getTeacher()%>">
                </td>
              </tr>
              <tr>
                <td width=80 class="td_label" align="center" valign="center">
                  ѧ��
                </td> 
                <td width=600 class="td_content" align="left" valign="center">
                  <input name="point" type="text" size="1" maxlength="1" value="<%=sPoint%>">
                  ��1��6��
                </td>
              </tr>
              <tr>
                <td class="td_label" align="center" valign="center" rowspan=2 height=40>
                  �Ͽ�ʱ��
                </td> 
                <td class="td_content" align="left" valign="top">
                  ��һ�Σ�&nbsp;<span class="sel_span">
                    <div class="sel_div">
                      <select name="time1D" class="sel">
                        <option value="1"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >����һ</option>
                        <option value="2"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >���ڶ�</option>
                        <option value="3"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >������</option>
                        <option value="4"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >������</option>
                        <option value="5"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 0, 1 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >������</option>
                      </select>
                    </div>
                  </span>
                  &nbsp;
                  <span class="sel_span">
                    <div class="sel_div">
                      <select name="time1T" class="sel">
                        <option value="1"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >08:00��10:00</option>
                        <option value="2"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >10:00��12:00</option>
                        <option value="3"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >14:00��16:00</option>
                        <option value="4"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >16:00��18:00</option>
                        <option value="5"
<%
if ( course.getTime1().length() > 1 && course.getTime1().substring( 1, 2 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >19:00��21:00</option>
                      </select>
                    </div>
                  </span>
                </td>
              </tr>
              <tr>
                <td class="td_content" align="left" valign="top">
                  �ڶ��Σ�&nbsp;<span class="sel_span">
                    <div class="sel_div">
                      <select name="time2D" class="sel">
                        <option value="1"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >����һ</option>
                        <option value="2"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >���ڶ�</option>
                        <option value="3"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >������</option>
                        <option value="4"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >������</option>
                        <option value="5"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 0, 1 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >������</option>
                      </select>
                    </div>
                  </span>
                  &nbsp;
                  <span class="sel_span">
                    <div class="sel_div">
                      <select name="time2T" class="sel">
                        <option value="1"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("1") )
{
%>
                        selected
<%
}
%>
                        >08:00��10:00</option>
                        <option value="2"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("2") )
{
%>
                        selected
<%
}
%>
                        >10:00��12:00</option>
                        <option value="3"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("3") )
{
%>
                        selected
<%
}
%>
                        >14:00��16:00</option>
                        <option value="4"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("4") )
{
%>
                        selected
<%
}
%>
                        >16:00��18:00</option>
                        <option value="5"
<%
if ( course.getTime2().length() > 1 && course.getTime2().substring( 1, 2 ).equals("5") )
{
%>
                        selected
<%
}
%>
                        >19:00��21:00</option>
                      </select>
                    </div>
                  </span>
                </td>
              </tr>
              <tr>
                <td width=80 class="td_label" align="center" valign="center">
                  ��������
                </td> 
                <td width=600 class="td_content" align="left" valign="center">
                  <input name="limited" type="text" size="3" maxlength="3" value="<%=sLimited%>">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height=10></td>
        </tr>
        <tr>
          <td height=30 align=center>
            <input type="submit" value="��¼"></input>
            <input type="reset" value="ȡ��"></input>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>