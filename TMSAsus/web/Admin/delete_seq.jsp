<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbConnection.DBConnect"%>
<%@page import="java.sql.ResultSet"%>

    <script type="text/javascript">
        var r = confirm("Delete this sequence?");
    </script>
<%
    String seq_id = request.getParameter("seq_id");
    
    String template1 = "DELETE FROM participationinfo WHERE courseID='" + seq_id + "'";
    String template2 = "DELETE FROM generatereport WHERE courseID='" + seq_id + "'";
    String template3 = "DELETE FROM courseinfo WHERE courseID='" + seq_id + "'";
    
    DBConnect myDBConnection = new DBConnect();
    myDBConnection.loadConnection();
    Connection myConnection = myDBConnection.getConnection();
    Statement stmt = myConnection.createStatement();
    
    try{ 
        stmt.executeUpdate(template1);
        stmt.executeUpdate(template2);
        stmt.executeUpdate(template3);
    }
    catch(SQLException sqle){
        System.err.println("Error connecting: " + sqle);
    }

%>