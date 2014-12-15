<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbConnection.DBConnect"%>
<%@page import="dbConnection.DBConnect"%>
<%
    DBConnect myDBConnection = new DBConnect();
    myDBConnection.loadConnection();
    Connection myConnection = myDBConnection.getConnection();
    Statement stmt = myConnection.createStatement();
    
    String name = request.getParameter("");
    String icNum = request.getParameter("");
    String courseCode = request.getParameter("a");
    String courseName = request.getParameter("b");
    String courseTutor = request.getParameter("c");
    String venue = request.getParameter("d");
    String organizer = request.getParameter("e");
    String category = request.getParameter("f");
    String KJ = request.getParameter("g");
    String position = request.getParameter("h");
    String numIC = request.getParameter("i");
    
    System.out.println(position);
    Random rand = new Random();
    int randomNumber = rand.nextInt((100 - 0) + 1);
    String uniqieCertificate = "CEO";
            uniqieCertificate += Integer.toString(randomNumber);
    
    String template = "INSERT INTO generatecertificate (certificateNo, staffID, signerName, signerPosition)"
            + " VALUES ('"+ uniqieCertificate +"', '1', '"+ KJ +"', '" + position +"')";
    
    stmt.executeUpdate(template);

%>

    Congratulation, you have completed this course.
    Name          :<%= KJ%>
    I/C No        :<%= numIC %>
    Course Code   :<%= courseCode%>
    Course Name   :<%= courseName%>
    Course Tutor  :<%= courseTutor%>
    Venue         :<%= venue%>
    Organizer     :<%= organizer%>
    Category      :<%= category%>
    
    Sincery: 
<%@ page contentType="application/msword" %>