
<%@ include file="../Admin/AdminMainPage.jsp" %>
            <li><a href="manageCourse.jsp" ><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a></li>
            <li><a href="generateCertificate.jsp"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a></li>
            <li><a href="generateReport.jsp"><i class="glyphicon glyphicon-cloud"></i> Generate Report</a></li>
            <li><a href="editProfile.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a></li>
            <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a></li>
            </ul>
            </div>
        </div>
    </nav>

<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5">       
                <h1 class="page-header">Edit Profile</h1>
                <form class="form-horizontal" role="form" data-toggle="validator">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" >Username</label>
                        <div class="col-sm-10">
                            <%  
                               String adminID = null,
                                      username = null,
                                      template = null,
                                      newPassword = null, 
                                      oldPasswordForm = null, 
                                      oldPaswordData = null,
                                      email = null;
                               ResultSet resultSet;
                               boolean buttonUpdate = false;
                               
                               template = "SELECT * FROM logininfo WHERE privelage='Admin'";
                               resultSet = DBConnect.doQuery(template);
                               while (resultSet.next()){
                                   adminID = resultSet.getString("staffID");
                                   username = resultSet.getString("username");
                                }
                            %>             
                            <input type="text" readonly class="form-control" placeholder="<%= username %>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <%  
                                template = "SELECT * FROM staffinfo WHERE staffID='" + adminID +"'";
                                resultSet = DBConnect.doQuery(template);
                                while (resultSet.next()){
                                    email = resultSet.getString("staffEmail");
                                }
                            %> 
                            <input type="email" class="form-control" id="inputEmail" value="<%= email %>" data-error="Email address is invalid" required>
                            <div class="col-sm-10 help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Old Password</label>
                        <div class="col-sm-10">
                           <input name="oldPassword" type="password" data-minlength="6" class="form-control" id="inputPassword" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">New Password</label>
                        <div class="col-sm-10">
                           <input name="newPassword" type="password" data-minlength="6" class="form-control" id="inputPassword" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button name="buttonUpdate" type="submit" class="btn btn-primary" value="true">Update</button>
                            <%
                                buttonUpdate = Boolean.parseBoolean(request.getParameter("buttonUpdate"));
                                oldPasswordForm = request.getParameter("oldPassword");
                                newPassword = request.getParameter("newPassword");
                                
                                if(buttonUpdate){
                                    resultSet = DBConnect.doQuery("SELECT * FROM logininfo WHERE staffID='" + adminID +"'");
                                    while (resultSet.next()){
                                        oldPaswordData = resultSet.getString("password");
                                    }
                                    
                                    if(oldPasswordForm.equals(oldPaswordData)){
                                        out.println("oldPasswordForm :" + oldPasswordForm +"\noldPaswordData: " +oldPaswordData );
                                        template = "UPDATE logininfo SET password='"+ newPassword +"' WHERE staffID='" + adminID +"'";
                                        stmt.executeUpdate(template);
                                    }
                                    
                                    else{ %>
                                        <span class="help-block with-errors" style="color:red">Old Password did not match</span>
                                    <%}
                                }  
                                else 
                            %>  
                        </div>
                    </div>
                </form>
        </div>
</div></div></div>

<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/bootstrap-datepicker.js" type="text/javascript"></script>
<script type="text/javascript">
    $('#form').validator()
</script>      
<script type="text/javascript">
   $(document).ready(function(){
       $('#dp3').datepicker();
   })
</script>

</body>
<jsp:include page="footer.jsp"/>
