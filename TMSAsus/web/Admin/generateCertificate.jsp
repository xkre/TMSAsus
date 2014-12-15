<%@page import="java.sql.Date"%>
<jsp:directive.include file="AdminMainPage.jsp" />
            <li><a href="manageCourse.jsp"><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a></li>
            <li><a href="generateCertificate.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a></li>
            <li><a href="generateReport.jsp"><i class="glyphicon glyphicon-cloud"></i> Generate Report</a></li>
            <li><a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a></li>
            <li><a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a></li>
            </ul>
            </div>
        </div>
    </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Generate Certificate</h1>
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
                                <th>Course Tutor</th>
                                <th>Venue</th>
                                <th>Start</th>
                                <th>End</th>
                                <th>Duration (hours)</th>
                                <th>Organizer</th>
                                <th>Category</th>
                                <th>Course Status</th>
                                <th>No of Staff in-Charge</th>
                                <th>Generate</th>
                            </tr></thead>
                        <tbody>
                            <%                            
                                ResultSet resultSet, resultSet1;
                                String  template = null,
                                        courseCode = null,
                                        courseName = null,
                                        courseTutor = null,
                                        venue = null,
                                        duration = null,
                                        organizer = null,
                                        category = null,
                                        objective = null,
                                        courseStatus = null,
                                        courseID = null,
                                        temp = null;
                                int count = 1, staffNum = 0;
                                Date startDate = new Date(0);
                                Date endDate = new Date(0);
                                        
                                template = "SELECT * FROM courseinfo";
                                resultSet = DBConnect.doQuery(template);
                                while (resultSet.next()){
                                    courseID     = resultSet.getString("courseID");
                                    courseCode   = resultSet.getString("courseCode");
                                    courseName   = resultSet.getString("courseName");
                                    venue        = resultSet.getString("venue");
                                    objective    = resultSet.getString("objectives");
                                    category     = resultSet.getString("category");
                                    duration     = resultSet.getString("duration");
                                    organizer    = resultSet.getString("organizer");
                                    courseStatus = resultSet.getString("courseStatus");
                                    staffNum     = resultSet.getInt("staffNum");
                                    courseTutor  = resultSet.getString("courseTutor");
                                    startDate    = resultSet.getDate("startDate");
                                    endDate      = resultSet.getDate("endDate");
                                    
                                    if(courseStatus.equals("Done"))
                                    temp = "success";
                                
                                    else 
                                    temp = "active";
                            %>
                            <tr id="<%= courseID %>" class="<%= temp %>">    
                                <td><%= count%></td>
                                <td><%= courseCode %></td>
                                <td><%= courseName %></td>
                                <td><%= courseTutor %></td>
                                <td><%= venue %></td>
                                <td><%= startDate %></td>
                                <td><%= endDate %></td>
                                <td><%= duration %></td>
                                <td><%= organizer %></td>
                                <td><%= category %></td>
                                <td><%= courseStatus %></td>
                                <td><%= staffNum %></td>
                                <td class="text-center">
                                    <a href="certificareWord.jsp?a=<%= courseCode%>&b=<%=courseName%>&c=<%=courseTutor%>&d=<%=venue%>&e=<%=organizer%>&f=<%=category%>">
                                        <i class="glyphicon glyphicon-download-alt" data-toggle="tooltip" data-placement="left" title="generate certificate"></i></a></td>
                                <%  count++;
                                    }
                                %>
                            </tr></tbody>
                </table>
		</div>
                </div>
                </div>
                    </div>
                </div>
            </div></div></div>
</body>

<jsp:include page="footer.jsp"/>