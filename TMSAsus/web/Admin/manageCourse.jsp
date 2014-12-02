<jsp:include page="../Admin/AdminMainPage.jsp"/>

                        <li>
                            <a href="manageCourse.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a>
                        </li>
                        <li>
                            <a href="generateCertificate.jsp"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a>
                        </li>
                        <li>
                            <a href="generateProject.jsp"><i class="glyphicon glyphicon-cloud"></i> Generate Project</a>
                        </li>
                        <li>
                            <a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a>
                        </li>
                        <li>
                            <a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Manage Course</h1>
                        
                             
    <div class="container">
	<div class="row clearfix">
                <button type="submit" class="btn btn-primary">Create New Course</button>
                <br /><br />
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
                                <th>Time</th>
                                <th>Category</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr></thead>
                        <tbody>
                            <tr class="success">
                                <td>1</td>
                                <td>SCSJ1012</td>
                                <td>Programming Techinique I</td>
                                <td>Dr Dayang Nurhayati</td>
                                <td>Bilik Kuliah I</td>
                                <td>8.00-10.00</td>
                                <td>Entah</td>
                                <td class="text-center"><a href="" class="glyphicon glyphicon-refresh" ></a></td>
                                <td class="text-center"><a href="" class="glyphicon glyphicon-remove"></a></td>
                            </tr></tbody>
                </table>
		</div>
                </div>
                </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>