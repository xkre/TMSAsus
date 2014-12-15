<%@ include file="../User/UserMainPage.jsp" %>

<%
    Verifier.checkPrivelage(request,response,"head of dept.");
 %>
                        <li>
                            <a href="ViewStatus.jsp"><i class="glyphicon glyphicon-hand-right"></i> View Status</a>
                        </li>
                        <li>
                            <a href="ApplyCourse.jsp"><i class="glyphicon glyphicon-pencil"></i> Apply Course</a>
                        </li>
                        <li>
                            <a href="ViewHistory.jsp"><i class="glyphicon glyphicon-cloud"></i> View History</a>
                        </li>
                        <li>
                            <a href="KJ_VerifyApplication.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-leaf"></i> Verify Application</a>
                        </li>
                        <li>
                            <a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Change Password</a>
                        </li>
                        <li>
                            <a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">View Status</h1>
                        
                        <%
                    String query = "SELECT * FROM courseinfo";
                    PreparedStatement statement = con.prepareStatement(query);

//                    statement.setInt(1, 3);
//                    statement.executeUpdate();
                    ResultSet result;

                    result = db.doQuery(statement);
                %>
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Date Start</th>
                                            <th>Date End</th>
                                            <th>Course Status</th>
                                            <th>Verify</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<%                  int counter = 0; 
                    while (result.next()) {
                        counter++;
%>
                                <tr >
                                    <td><%= counter %></td>
                                    <td><%= result.getString("courseCode")%></td>
                                    <td><%= result.getString("courseName")%></td>
                                    <td><%= result.getString("startDate")%></td>
                                    <td><%= result.getString("endDate")%></td>
                                    <td><%= result.getString("courseStatus")%></td>
                                    <td><a href="./KJ_VerifyApplication2.jsp?courseID=<%= result.getString("courseID")%>"
                                            <i class="glyphicon glyphicon-pencil"></i> View Applicants</a></td>
                                    
                                <%
                                    }db.closeConnection();
                                %>
                                    
                                </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            
                        </div>
                            
                            
			
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
    $('#form').validator()
</script>      
        

</body>
</html>
