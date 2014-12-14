<%@ include file="../User/UserMainPage.jsp" %>

<%
    int courseID = Integer.parseInt(request.getParameter("courseID"));
    int departmentID = 1;
    //hard coded
 %>
                        <li>
                            <a href="ViewStatus.jsp"  class="list-group-item-info"><i class="glyphicon glyphicon-hand-right"></i> View Status</a>
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
                            <a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a>
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


                    String query = "SELECT * "
                            + "FROM participationinfo "
                            + "JOIN staffInfo USING (staffID) "
                            + "JOIN department USING (departmentID) "
                            + "JOIN faculty ON (faculty.facultyID = staffinfo.facultyID) "
                            + "where courseID="+courseID;//+" AND departmentID="+departmentID;
//                    String query2 = "Select * from staffinfo where staffID=?";
                    PreparedStatement statement = con.prepareStatement(query);
//                    PreparedStatement statement2 = con.prepareStatement(query2);
                    ResultSet result;
                    result = db.doQuery(statement);

                %>
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Staff No</th>
                                            <th>Staff Name</th>
                                            <th>Staff IC No</th>
                                            <th>Department</th>
                                            <th>Faculty</th>
                                            <th>Verify</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<%                  int counter = 0; 
                    while (result.next()) {
                        counter++;
//                        statement2.setInt(1, result.getInt(staffID));
//                        result2 = statement2.executeQuery();
                        
%>
                                <tr >
                                    <td><%= counter %></td>
                                    <td><%= result.getString("staffNo")%></td>
                                    <td><%= result.getString("name")%></td>
                                    <td><%= result.getString("numIC")%></td>
                                    <td><%= result.getString("departmentName")%></td>
                                    <td><%= result.getString("facultyShortForm")%></td>
                                    <td>Approve Application</td>
                                    
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
