<%@ include file="../Admin/AdminMainPage.jsp" %>
                        <li>
                            <a href="manageCourse.jsp"><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a>
                        </li>
                        <li>
                            <a href="generateCertificate.jsp"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a>
                        </li>
                        <li>
                            <a href="generateReport.jsp"><i class="glyphicon glyphicon-cloud"></i> Generate Report</a>
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
                            <div class="container">
                            <div class="row">
                                <div class='col-sm-6'>
                                    <div class="form-group">
                                        <div class='input-group date' id='datetimepicker1'>
                                            <input type='text' class="form-control" />
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                            
			<form class="form-horizontal" role="form" data-toggle="validator">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label" >Acid</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control" placeholder="Acid"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">Email</label>
                                <input type="email" class="form-control" id="inputEmail" placeholder="Email" data-error="Bruh, that email address is invalid" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Old Password</label>
                                <div class="col-sm-10">
                                        <input type="password" class="form-control" id="inputPassword3" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">New Password</label>
                                <div class="col-sm-10">
                                        <input type="password" class="form-control" id="inputPassword3" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                         <button type="submit" class="btn btn-default">Update</button>
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
