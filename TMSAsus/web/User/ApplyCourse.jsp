<%@ include file="../User/UserMainPage.jsp" %>

<%
    
 %>




<li>
    <a href="ViewStatus.jsp"  ><i class="glyphicon glyphicon-hand-right"></i> View Status</a>
</li>
<li>
    <a href="ApplyCourse.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-pencil"></i> Apply Course</a>
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
                <h1 class="page-header">Available Courses</h1>
                <%

                    String query = "Select * from courseinfo WHERE courseStatus = 'Available'";
                    PreparedStatement statement = con.prepareStatement(query);

//                    statement.setInt(1, 3);
//                    statement.executeUpdate();
                    ResultSet result, result2;

                    result = db.doQuery(statement);
                    result2 = db.doQuery("SELECT courseID from participationinfo WHERE staffID="+staffID);
                    ArrayList courseIDList = new ArrayList<Integer>();
                    while(result2.next())
                        courseIDList.add(result2.getInt("courseID"));
                    
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
                                    <th>Application</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while (result.next()) {%>
                                <tr >
                                    <td><%= result.getString("courseID")%></td>
                                    <td><%= result.getString("courseCode")%></td>
                                    <td><%= result.getString("courseName")%></td>
                                    <td><%= result.getString("startDate")%></td>
                                    <td><%= result.getString("endDate")%></td>
                                    
                                    <td><a href=<% if (!courseIDList.contains(result.getInt("courseID"))){%>
                                    "javascript:myFunction(<%=result.getString("courseID")%>);">
                                            <i class="glyphicon glyphicon-pencil"></i> Apply</a><% } %></td>
                                </tr>

                                <%
                                    }db.closeConnection();
                                %>

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
    function myFunction(a)
    {
        var b = a;
        BootstrapDialog.show({
            message: 'Are you sure to apply this course?',
            buttons: [{
                    label: 'Yes',
                    cssClass: 'btn-primary',
                    action: function(){
                        window.location.href("../ApplyCourse?courseID="+b);
                    }
                },  {
                    label: 'No',
                    action: function(dialogRef){
                        dialogRef.close();
                    }
            }]
        });
    };
</script>
</body>
</html>
