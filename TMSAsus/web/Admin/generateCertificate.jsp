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
                                ResultSet resultSet, resultSet1, resultSet2;
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
                                        template1 = null,
                                        template2 = null,
                                        courseID = null,
                                        position = null,
                                        KJ = null,
                                        numIC = null,
                                        temp = null;
                                String[][] getStaffName = new String[100][1];
                                String[][] getStaffInfo = new String[100][4];
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
                                    
                                    template1 = "SELECT courseID, name from participationinfo "
                                            + "JOIN courseinfo USING (courseID) JOIN staffinfo USING (staffID)";
                                    resultSet1 = DBConnect.doQuery(template1);
                                        while (resultSet1.next()){
                                            getStaffName[Integer.parseInt(resultSet1.getString("courseID"))][0] = resultSet1.getString("name");   
                                        }
                                        
                                    template2 = "SELECT name,position,numIC FROM staffinfo where position='Head of Dept.'";
                                    resultSet2 = DBConnect.doQuery(template2);
                                    int template2int=0;
                                        while (resultSet2.next()){
                                            getStaffInfo[template2int][0] = courseID;
                                            getStaffInfo[template2int][1] = resultSet2.getString("name");
                                            getStaffInfo[template2int][2] = resultSet2.getString("position");
                                            getStaffInfo[template2int][3] = resultSet2.getString("numIC");
                                            template2int++;
                                        }
                                        
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
                                    <a href="certificareWord.jsp?a=<%= courseCode%>&b=<%=courseName%>&c=<%=courseTutor%>&d=<%=venue%>&e=<%=organizer%>
                                       &f=<%=category%>&g=<%= getStaffInfo[count-1][1] %>&h=<%= getStaffInfo[count-1][2] %>&i=<%= getStaffInfo[count-1][3] %>">
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
