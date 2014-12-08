<%@ include file="../User/UserMainPage.jsp" %>
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
                                    <input type="text" readonly class="form-control" placeholder="Acid"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail" placeholder="Email" data-error="Bruh, that email address is invalid" required>
                                </div><div class="help-block with-errors"></div>
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
