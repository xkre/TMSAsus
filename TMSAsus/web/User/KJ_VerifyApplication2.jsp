<%@ include file="../User/UserMainPage.jsp" %>

<%
    int courseID = Integer.parseInt(request.getParameter("courseID"));
    int departmentID = 1, updateResult = -1;
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
                        int staffIDUpdate = 0;
                        if (request.getParameter("success")!=null){
                            if (request.getParameter("success").equals("1"))
                            {  %>
                                <script type="text/javascript">
                                    toastr.success("Approve Successful", "Success");
                                </script>
                            <% }
                        else
                            {  %>
                                <script type="text/javascript">
                                    toastr.error("Failed","Somethin When wrong, please inform technician");    
                                </script>
                            <% }}
                        if (request.getHeader("referer")!=null)
                        if (request.getHeader("referer").contains("KJ_VerifyApplication2")){
                        if (request.getParameter("update")!= null)
                            if (Boolean.parseBoolean(request.getParameter("update"))){
                            try{
                                staffIDUpdate = Integer.parseInt(request.getParameter("staffID"));
                                String updateQuery = "UPDATE participationinfo "
                                        + "SET participantStatus='Enrol' "
                                        + "WHERE staffID="+staffIDUpdate+" AND courseID="+courseID;
                                PreparedStatement updateStatement = con.prepareStatement(updateQuery);
                                updateResult = updateStatement.executeUpdate();
                            }
                            catch (SQLException e){
                                System.err.println("ERROR "+e);
                                response.sendRedirect("./KJ_VerifyApplication2.jsp?courseID="+courseID+"&success=0");
                            }
                        }}
                        %>
                        
                        <%
                    String query = "SELECT * "
                            + "FROM participationinfo "
                            + "JOIN staffInfo USING (staffID) "
                            + "JOIN department USING (departmentID) "
                            + "JOIN faculty ON (faculty.facultyID = staffinfo.facultyID) "
                            + "where courseID="+courseID+" AND participantStatus='Unverified'";//+" AND departmentID="+departmentID;
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
%>
                                <tr >
                                    <td><%= counter %></td>
                                    <td><%= result.getString("staffNo")%></td>
                                    <td><%= result.getString("name")%></td>
                                    <td><%= result.getString("numIC")%></td>
                                    <td><%= result.getString("departmentName")%></td>
                                    <td><%= result.getString("facultyShortForm")%></td>
                                    <td><a href="./KJ_VerifyApplication2.jsp?staffID=<%= result.getString("staffID")%>&courseID=<%= result.getString("courseID")%>&update=true"
                                            <i class="glyphicon glyphicon-pencil"></i> Approve</a></td>
                                <%
                                    }db.closeConnection();
                                    
                                if (updateResult == 1){  
                                    response.sendRedirect("./KJ_VerifyApplication2.jsp?courseID="+courseID+"&success=1");
                                }
                                else if (updateResult ==0){ 
                                    response.sendRedirect("./KJ_VerifyApplication2.jsp?courseID="+courseID+"&success=0");
                                }
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
    $('#form').validator();
</script>      
        

</body>
</html>
