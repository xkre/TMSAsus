<%@ include file="../Admin/AdminMainPage.jsp" %>
            <li><a href="manageCourse.jsp"><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a></li>
            <li><a href="generateCertificate.jsp"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a></li>
            <li><a href="generateReport.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-cloud"></i> Generate Report</a></li>
            <li><a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a></li>
            <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a></li>
            </ul>
            </div>
        </div>
    </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Generate Report</h1>
                        <div class="container">
	<div class="row clearfix">
		<div class="col-md-10 column table-responsive">    
                <table class="table table-hover table-bordered">
                    <caption><h4>Course List</h4></caption>
                        <thead>
                            <tr class="warning">
                                <th>No</th>
                                <th>Course Code</th>
                                <th>Course Name</th>
                                <th>Attandence</th>
                                <th>Action</th>
                            </tr></thead>
                        <tbody>
                            <%
                               ResultSet resultSet;
                               String template = null,
                                      courseCode = null,
                                      courseName = null,
                                      courseID = null,
                                      temp = null,
                                      courseStatus = null;
                                int total = 0,
                                    attentStudent = 0;
                                int count = 1;
                               
                               template = "SELECT * FROM courseinfo";
                               resultSet = DBConnect.doQuery(template);
                               while (resultSet.next()){
                                   courseID     = resultSet.getString("courseID");
                                   courseCode   = resultSet.getString("courseCode");
                                   courseName   = resultSet.getString("courseName");
                                   courseStatus   = resultSet.getString("courseStatus");
                                   
                               template = "SELECT SUM(attendanceStatus),COUNT(attendanceStatus) FROM participationinfo WHERE courseID=" + courseID;
                               resultSet = DBConnect.doQuery(template);
                               while (resultSet.next()){
                                   int a = resultSet.getInt(1);
                                   int b = resultSet.getInt(2);
                                   attentStudent += a;
                                   total += b;
                                }
                                
                                if(courseStatus.equals("done"))
                                    temp = "success";
                                
                                else 
                                    temp = "active";
                            %>  
                                <tr class="<%= temp %>">
                                    <td><%= count %></td>
                                    <td><%= courseCode %></td>
                                    <td><%= courseName %></td>
                                    <td><%= attentStudent %>/<%= total %></td>
                                    <td class="text-center">
                                        <a href="" class="glyphicon glyphicon-forward" data-toggle="tooltip" data-placement="left" title="generate report"></a>
                                    </td>
                                </tr>
                                <%}%>
                        </tbody>
                </table>
		</div>
                </div>
                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="footer.jsp"/>