<%@ include file="../User/UserMainPage.jsp" %>

<%                  String query = "Select * FROM staffinfo JOIN logininfo USING(staffID) WHERE staffID ="+staffID;
                    
                    ResultSet result = db.doQuery(query);
                    result.next();
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
                            <a href="editProfile.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a>
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
                    <div class="col-lg-5">
                        <h1 class="page-header">Edit Profile</h1>
                            
                            
			<form class="form-horizontal" role="form" data-toggle="validator">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label" >Acid</label>
                                <div class="col-sm-10">
                                    
                                    <%  
                               String theID = null,
                                      username = null,
                                      newPassword = null, 
                                      oldPasswordForm = null, 
                                      oldPaswordData = null,
                                      email = null,
                                      query2 = null;
                               boolean buttonUpdate = false;
                            %>       
                                    <input type="text" readonly value="<%=result.getString("username")%>" class="form-control" placeholder="Acid"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input name="email" type="email" class="form-control" id="inputEmail" value="<%=result.getString("staffEmail")%>" placeholder="Email" data-error="Email address is invalid" required>
                                </div><div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Old Password</label>
                                <div class="col-sm-10">
                                        <input name="oldPassword" type="password" class="form-control" id="inputPassword3" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">New Password</label>
                                <div class="col-sm-10">
                                        <input name="newPassword" type="password" class="form-control" id="inputPassword3" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                         <button id="updateToast" name="buttonUpdate" type="submit" class="btn btn-primary" value="true">Update</button>
                            <%
                                buttonUpdate = Boolean.parseBoolean(request.getParameter("buttonUpdate"));
                                oldPasswordForm = request.getParameter("oldPassword");
                                newPassword = request.getParameter("newPassword");
                                email = request.getParameter("email");
                                
                                
                                
                                if(buttonUpdate){
                                    
                                        oldPaswordData = result.getString("password");
                                    
                                    if(oldPasswordForm.equals(oldPaswordData)){
                                        query2 = "UPDATE logininfo JOIN staffinfo"
                                                + " SET password='"+ newPassword +"', staffEmail='"+email
                                                + "' WHERE staffID=" + staffID;
                                        try{
                                            PreparedStatement statement = con.prepareCall(query2);
                                            statement.executeUpdate(); %>
                                            <script type="text/javascript">
                                                toastr.success("Success","Information Updated" );    
                                            </script>
                                        <%    
                                        }
                                        catch(SQLException sqle){
                                            System.err.println("Error connecting: " + sqle);
                                            %><script type="text/javascript">
                                                toastr.error("Failed","Somethin When wrong, please inform technician");    
                                            </script><%
                                        }
                                    }
                                    else{ %>
                                        <script type="text/javascript">
                                            toastr.warning("Failed","Old Password doesnt match" );    
                                        </script>
                                        <span class="help-block with-errors" style="color:red">Old Password did not match</span>
                                    <%}
                                }  
                                else 
                            %>  
                                </div>
                            </div>
			</form>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
    $('#form').validator()
</script>      
        

</body>
</html>
