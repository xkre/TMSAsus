<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbConnection.DBConnect"%>
<%@ include file="../Admin/AdminMainPage.jsp" %>
            <li><a href="manageCourse.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a></li>
            <li><a href="generateCertificate.jsp"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a></li>
            <li><a href="generateReport.jsp"><i class="glyphicon glyphicon-cloud"></i> Generate Report</a></li>
            <li><a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a></li>
            <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a></li>
            </ul>
            </div>
        </div>
    </nav>
    <script type="text/javascript">
            $('.targetDiv').hide();
    </script>
    
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Course</h1>

        <div class="container">
        <div class="row clearfix">
            <button id="createCourse" type="button" class="small show btn btn-primary" target="1" show>Create New Course </button>
            
        <!-- /.CREATE COURSE -->    
        <div class="targetDiv" id="div1">
            <div class="container">
              <div class="row clearfix">
                  <div class="col-md-8 column">
                      <h3 class="page-header">Create New Course</h3>
                      <form class="form-horizontal" role="myFormUpdate" data-toggle="validator">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Course Code</label>
                            <div class="col-sm-5">
                                <input name="courseCodeInput" type="text" pattern="^[a-zA-Z0-9]{6,}$" data-minlength="6" class="form-control" id="courseCode" data-error="Invalid Course Code" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label class="col-sm-2 control-label">Course Name</label>
                            <div class="col-sm-5">
                                <input name="courseNameInput" type="text" pattern="^[a-zA-Z0-9 ]{6,}" data-minlength="6" class="form-control" id="courseCode" data-error="Invalid Course Name" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">Course Tutor</label>
                            <div class="col-sm-5">
                                <input name="courseTutorInput" type="text" pattern="^[a-zA-Z ]{6,}" data-minlength="6" maxlength="25" class="form-control" id="courseCode" data-error="Invalid Course Tutor" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Venue</label>
                            <div class="col-sm-5">
                                <input name="venueInput" type="text" pattern="^[a-zA-Z0-9 ]{6,}" data-minlength="6" maxlength="20" class="form-control" id="courseCode" data-error="Invalid Venue" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Objective</label>
                            <div class="col-sm-5">
                                <input name="objectiveInput" type="text" pattern="^[a-zA-Z0-9 ]{4,}" data-minlength="4" maxlength="20" class="form-control" id="courseCode" data-error="Invalid Objective" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Organizer</label>
                            <div class="col-sm-5">
                                <input name="organizerInput" type="text" pattern="^[a-zA-Z0-9 ]{4,}" data-minlength="4" maxlength="20" class="form-control" id="courseCode" data-error="Invalid Organizer" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Course Category</label>
                            <div class="col-sm-5">
                                <select name="courseCategoryInput" class="form-control">
                                    <option>Academic</option>
                                    <option>Non-academic</option>
                                    <option>Latihan ICT</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Start Date</label>
                            <div class="col-sm-5">
                                <div class="input-append date input-group" id="dp1" data-date=" " data-date-format="dd-mm-yyyy">
                                    <input name="startDateInput" class="form-control input-sm" value="" type="text" data-required="true"/>
                                        <span class="add-on input-group-addon" style="background:transparent;"><i class="glyphicon glyphicon-calendar text-danger"></i>
                                        </span>
                        </div></div></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">End Date</label>
                            <div class="col-sm-5">
                                <div class="input-append date input-group" id="dp2" data-date=" " data-date-format="dd-mm-yyyy">
                                    <input name="endDateInput" class="form-control input-sm" value="" type="text" data-required="true"/>
                                        <span class="add-on input-group-addon" style="background:transparent;"><i class="glyphicon glyphicon-calendar text-danger"></i>
                                        </span>
                                </div> </div></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Course Status</label>
                            <div class="col-sm-5">
                                <select name="courseStatusInput" class="form-control">
                                    <option>Done</option>
                                    <option>Plan</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Staff Number</label>
                            <div class="col-sm-5">
                                <select name="staffNumberInput" class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Duration(Hour)</label>
                            <div class="col-sm-5">
                                <select name="durationInput" class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button name="creatButtonCourse" value="true" type="submit" class="btn btn-primary">Create Course</button>
                            </div>
                        </div>
            </form>
            <%
                String  courseCodeInput = null,
                        courseNameInput = null,
                        courseTutorInput = null,
                        venueInput = null,
                        objectiveInput = null,
                        organizerInput = null,
                        courseCategoryInput = null,
                        startDateInput = null,
                        endDateInput = null,
                        courseStatusInput = null,
                        staffNumberInput = null,
                        durationInput = null,
                        template = null,
                        temp = null;
                
                boolean creatButtonCourse = Boolean.parseBoolean(request.getParameter("creatButtonCourse"));
                
                if(creatButtonCourse){
                    courseCodeInput     = request.getParameter("courseCodeInput");
                    courseNameInput     = request.getParameter("courseNameInput");
                    courseTutorInput    = request.getParameter("courseTutorInput");
                    venueInput          = request.getParameter("venueInput");
                    objectiveInput      = request.getParameter("objectiveInput");         
                    organizerInput      = request.getParameter("organizerInput");        
                    courseCategoryInput = request.getParameter("courseCategoryInput");        
                    startDateInput      = request.getParameter("startDateInput");       
                    endDateInput        = request.getParameter("endDateInput");       
                    courseStatusInput   = request.getParameter("courseStatusInput");       
                    staffNumberInput    = request.getParameter("staffNumberInput");       
                    durationInput       = request.getParameter("durationInput");
                    
                    String[] parts = startDateInput.split("-", 3);
                    startDateInput = parts[2] + "-" + parts[1] + "-" + parts[0];    //part2(year), part1(month), part0(day)
                    
                    parts = endDateInput.split("-", 3);
                    endDateInput = parts[2] + "-" + parts[1] + "-" + parts[0];      //part2(year), part1(month), part0(day)
                    
                template = "INSERT INTO courseinfo (courseCode, courseName, "
                       + "startDate, endDate, venue, objectives, category, duration, "
                       + "organizer, courseStatus, staffNum, courseTutor) "
                       + "VALUES ('"+ courseCodeInput +"', '"+ courseNameInput +"', "
                       + "'"+ startDateInput +"', '"+ endDateInput +"', '"+ venueInput +"', '"+ objectiveInput +"', '"+ courseCategoryInput +"', '"+ durationInput +"', "
                       + "'"+ organizerInput +"', '"+ courseStatusInput +"', '"+ staffNumberInput +"', '"+ courseTutorInput +"')";
                
                    try{stmt.executeUpdate(template);}
                    catch(SQLException sqle) {System.err.println("Error connecting: " + sqle);}
                }
            %>
            </div></div></div>
        </div>         
                
        <!-- /.LISTED COURSE -->  
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
                            <th>Duration</th>
                            <th>Organizer</th>
                            <th>Category</th>
                            <th>Course Status</th>
                            <th>No Staff</th>
                            <th>Action</th>
                        </tr></thead>
                    <tbody>
                        <%                            
                            ResultSet resultSet;
                            String  templateManageCourse = null,
                                    courseCodeManageCourse = null,
                                    courseNameManageCourse = null,
                                    courseTutorManageCourse = null,
                                    venueManageCourse = null,
                                    durationManageCourse = null,
                                    organizerManageCourse = null,
                                    categoryManageCourse = null,
                                    objectiveManageCourse = null,
                                    courseStatusManageCourse = null,
                                    courseIDManageCourse = null,
                                    tempManageCourse = null;
                            int count = 1, staffNumManageCourse = 0, globalUpdatecourseID = 0;
                            Date startDate = new Date(0);
                            Date endDate = new Date(0);

                            template = "SELECT * FROM courseinfo";
                            resultSet = DBConnect.doQuery(template);
                            while (resultSet.next()){
                                courseIDManageCourse     = resultSet.getString("courseID");
                                courseCodeManageCourse   = resultSet.getString("courseCode");
                                courseNameManageCourse   = resultSet.getString("courseName");
                                venueManageCourse        = resultSet.getString("venue");
                                objectiveManageCourse    = resultSet.getString("objectives");
                                categoryManageCourse     = resultSet.getString("category");
                                durationManageCourse     = resultSet.getString("duration");
                                organizerManageCourse    = resultSet.getString("organizer");
                                courseStatusManageCourse = resultSet.getString("courseStatus");
                                staffNumManageCourse     = resultSet.getInt("staffNum");
                                courseTutorManageCourse  = resultSet.getString("courseTutor");
                                startDate                = resultSet.getDate("startDate");
                                endDate                  = resultSet.getDate("endDate");

                                if(courseStatusManageCourse.equals("Done"))
                                temp = "success";

                                else 
                                temp = "active";
                        %>
                            <tr class="<%= temp %>">    
                                <td><%= count%></td>
                                <td><%= courseCodeManageCourse %></td>
                                <td><%= courseNameManageCourse %></td>
                                <td><%= courseTutorManageCourse %></td>
                                <td><%= venueManageCourse %></td>
                                <td><%= startDate %></td>
                                <td><%= endDate %></td>
                                <td><%= durationManageCourse %></td>
                                <td><%= organizerManageCourse %></td>
                                <td><%= categoryManageCourse %></td>
                                <td><%= courseStatusManageCourse %></td>
                                <td><%= staffNumManageCourse %></td>
                                <td class="text-center">
                                    <i class="updateCourse glyphicon glyphicon-refresh" target="2" data-toggle="tooltip" data-placement="left" title="update" onclick="myUpdateFunction(<%= courseIDManageCourse %>)"></i>
                                    <i class="glyphicon glyphicon-remove" data-toggle="modal" data-target="#deleteCourse"></i>
                                </td> 
                                <%  count++;
                                    }
                                %>
                            </tr></tbody>
                </table><%= globalUpdatecourseID %>
        </div></div>
                              
        <!-- UPDATE COURSE -->    
        <div class="targetDiv" id="div2">
            <div class="container">
              <div class="row clearfix">
                  <div class="col-md-8 column">
                      <h3 class="page-header">Update Course</h3>
                      <form class="form-horizontal" role="myFormUpdate" data-toggle="validator">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Course Code</label>
                            <div class="col-sm-5">
                                <input name="courseCodeInput" type="text" pattern="^[a-zA-Z0-9]{6,}$" data-minlength="6" class="form-control" id="courseCode" data-error="Invalid Course Code" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label class="col-sm-2 control-label">Course Name</label>
                            <div class="col-sm-5">
                                <input name="courseNameInput" type="text" pattern="^[a-zA-Z0-9 ]{6,}" data-minlength="6" class="form-control" id="courseCode" data-error="Invalid Course Name" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">Course Tutor</label>
                            <div class="col-sm-5">
                                <input name="courseTutorInput" type="text" pattern="^[a-zA-Z ]{6,}" data-minlength="6" maxlength="25" class="form-control" id="courseCode" data-error="Invalid Course Tutor" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Venue</label>
                            <div class="col-sm-5">
                                <input name="venueInput" type="text" pattern="^[a-zA-Z0-9 ]{6,}" data-minlength="6" maxlength="20" class="form-control" id="courseCode" data-error="Invalid Venue" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Objective</label>
                            <div class="col-sm-5">
                                <input name="objectiveInput" type="text" pattern="^[a-zA-Z0-9 ]{4,}" data-minlength="4" maxlength="20" class="form-control" id="courseCode" data-error="Invalid Objective" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Organizer</label>
                            <div class="col-sm-5">
                                <input name="organizerInput" type="text" pattern="^[a-zA-Z0-9 ]{4,}" data-minlength="4" maxlength="20" class="form-control" id="courseCode" data-error="Invalid Organizer" required/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Course Category</label>
                            <div class="col-sm-5">
                                <select name="courseCategoryInput" class="form-control">
                                    <option>Academic</option>
                                    <option>Non-academic</option>
                                    <option>Latihan ICT</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Start Date</label>
                            <div class="col-sm-5">
                                <div class="input-append date input-group" id="dp3" data-date=" " data-date-format="dd-mm-yyyy">
                                    <input name="startDateInput" class="form-control input-sm" value="" type="text" data-required="true"/>
                                        <span class="add-on input-group-addon" style="background:transparent;"><i class="glyphicon glyphicon-calendar text-danger"></i>
                                        </span>
                        </div></div></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">End Date</label>
                            <div class="col-sm-5">
                                <div class="input-append date input-group" id="dp4" data-date=" " data-date-format="dd-mm-yyyy">
                                    <input name="endDateInput" class="form-control input-sm" value="" type="text" data-required="true"/>
                                        <span class="add-on input-group-addon" style="background:transparent;"><i class="glyphicon glyphicon-calendar text-danger"></i>
                                        </span>
                                </div> </div></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Course Status</label>
                            <div class="col-sm-5">
                                <select name="courseStatusInput" class="form-control">
                                    <option>Done</option>
                                    <option>Plan</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Staff Number</label>
                            <div class="col-sm-5">
                                <select name="staffNumberInput" class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Duration(Hour)</label>
                            <div class="col-sm-5">
                                <select name="durationInput" class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button name="updateButtonCourse" value="true" type="submit" class="btn btn-primary">Update Course</button>
                            </div>
                        </div>
            </form>
            <%
            boolean updateButtonCourse = Boolean.parseBoolean(request.getParameter("updateButtonCourse"));
                
                if(updateButtonCourse){
                    courseCodeInput     = request.getParameter("courseCodeInput");
                    courseNameInput     = request.getParameter("courseNameInput");
                    courseTutorInput    = request.getParameter("courseTutorInput");
                    venueInput          = request.getParameter("venueInput");
                    objectiveInput      = request.getParameter("objectiveInput");         
                    organizerInput      = request.getParameter("organizerInput");        
                    courseCategoryInput = request.getParameter("courseCategoryInput");        
                    startDateInput      = request.getParameter("startDateInput");       
                    endDateInput        = request.getParameter("endDateInput");       
                    courseStatusInput   = request.getParameter("courseStatusInput");       
                    staffNumberInput    = request.getParameter("staffNumberInput");       
                    durationInput       = request.getParameter("durationInput");
                    
                    String[] parts = startDateInput.split("-", 3);
                    startDateInput = parts[2] + "-" + parts[1] + "-" + parts[0];    //part2(year), part1(month), part0(day)
                    
                    parts = endDateInput.split("-", 3);
                    endDateInput = parts[2] + "-" + parts[1] + "-" + parts[0];      //part2(year), part1(month), part0(day)
                    
                 template = "UPDATE courseinfo SET courseCode='"+ courseCodeInput +"', courseName='"+ courseNameInput +"', "
                    + "startDate='"+ startDateInput +"', endDate='"+ endDateInput +"', venue='"+ venueInput +"', objectives='"+ objectiveInput +"',"
                    + "category='"+ courseCategoryInput +"', duration='0"+ durationInput +":00:00', organizer='"+ organizerInput +"', "
                    + "courseStatus='"+ courseStatusInput +"', staffNum='"+ staffNumberInput +"', courseTutor='"+ courseTutorInput +"' WHERE courseID='2'";//"+ 2+"'";

                    try{stmt.executeUpdate(template);}
                    catch(SQLException sqle) {System.err.println("Error connecting: " + sqle);}
                }
            %>      
                  </div></div></div>
        </div>         
    </div></div></div></div></div></div></div>

  <!-- /.DELETE COURSE -->
  <div id="deleteCourse" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">Comfirmation</h4>
        </div>
        <div class="modal-body text-center">
        <button type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
        </div>   
    </div>
  </div>
</div>
  
</body>
<script src="../js/bootstrap-datepicker.js" type="text/javascript"></script>
<script type="text/javascript">
    $('#myFormUpdate').validator();
    $('#myFormCreate').validator();
</script>       
<script type="text/javascript">
   $(document).ready(function(){
       $('#dp1').datepicker();
       $('#dp2').datepicker();
       $('#dp3').datepicker();
       $('#dp4').datepicker();
   });
</script>
<script type="text/javascript">
    $('.targetDiv').hide();
    $(document).ready(function(){
        $("#createCourse").click(function(){
            $("#div1").toggle();
        });
    });
    
    $(document).ready(function(){
        $('.updateCourse').click(function(){
            $("#div2").toggle();
        });
    });
</script>
<script type="text/javascript">
    function myUpdateFunction(var x) {
       <%-- globalUpdatecourseID --%>  //x;
    }
</script>
<jsp:include page="footer.jsp"/>