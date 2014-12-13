<%
    String courseCode = request.getParameter("a");
    String courseName = request.getParameter("b");
    String courseTutor = request.getParameter("c");
    String venue = request.getParameter("d");
    String organizer = request.getParameter("e");
    String category = request.getParameter("f");
%>

    Congratulation, Here ur Certificate
    Course Code   :<%= courseCode%>
    Course Name   :<%= courseName%>
    Course Tutor  :<%= courseTutor%>
    Venue         :<%= venue%>
    Organizer     :<%= organizer%>
    Category      :<%= category%>
    
    Sincery: 
<%@ page contentType="application/msword" %>