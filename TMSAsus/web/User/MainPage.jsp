<%@page import="javax.mail.Session"%>
<%@ include file="../User/UserMainPage.jsp" %>

<%
    
 %>
 
                        <li>
                            <a href="ViewStatus.jsp"><i class="glyphicon glyphicon-hand-right"></i>  View Status</a>
                        </li>
                        <li>
                            <a href="ApplyCourse.jsp"><i class="glyphicon glyphicon-pencil"></i> Apply Course</a>
                        </li>
                        <li>
                            <a href="ViewHistory.jsp"><i class="glyphicon glyphicon-cloud"></i> View History</a>
                        </li>
                        <li>
                            <a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a>
                        </li>
                        <li>
                            <a href="KJ_VerifyApplication.jsp"><i class="glyphicon glyphicon-leaf"></i> Verify Application</a>
                        </li>
                        <li>
                            <a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
<%
        String query = "SELECT name FROM staffinfo Where staffID="+staffID;
        PreparedStatement statement = con.prepareStatement(query);

        ResultSet result;

        result = db.doQuery(statement);
        result.next();
%>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Welcome to Training Management System,<br/> <%= result.getString("name") %></h1>
                        <div class="panel-body">
                            
                        </div>
			<% db.closeConnection();    %>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
    $('#form').validator()
</script>      
        

</body>
</html>
