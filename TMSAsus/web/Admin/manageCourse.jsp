<jsp:include page="../Admin/AdminMainPage.jsp"/>
                        <li>
                            <a href="manageCourse.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a>
                        </li>
                        <li>
                            <a href="generateCertificate.jsp"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a>
                        </li>
                        <li>
                            <a href="generateReport.jsp"><i class="glyphicon glyphicon-cloud"></i> Generate Report</a>
                        </li>
                        <li>
                            <a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a>
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
                    <div class="col-lg-12">
                        <h1 class="page-header">Manage Course</h1>
                                     
    <div class="container">
	<div class="row clearfix">
                <button type="button" class="btn btn-primary" data-toggle="modal" 
                        data-target=".bs-example-modal-lg">Create New Course
                </button>
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
                                <th>Start</th>
                                <th>End</th>
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
                                <td>8.00</td>
                                <td>10.00</td>
                                <td>Entah</td>
                                <td class="text-center"><a class="glyphicon glyphicon-refresh" data-toggle="modal" data-target="#updateCourse"></a></td>
                                <td class="text-center"><a class="glyphicon glyphicon-remove" data-toggle="modal" data-target="#deleteCourse"></a></td>
                            </tr></tbody>
                    </table>
		</div>
                </div>
                </div>
                </div>
            </div>
        </div>
    </div>
   
  <!-- /.CREATE COURSE -->      
  <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myLargeModalLabel">Create New Course</h4>
        </div>
        <div class="modal-body">
          <div class="container">
            <div class="row clearfix">
		<div class="col-md-12 column">
                    <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Course Code</label>
                                <div class="col-sm-5"><input type="email" class="form-control" id="courseCode" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Course Name</label>
                                <div class="col-sm-5"><input type="password" class="form-control" id="courseName" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Course Tutor</label>
                                <div class="col-sm-5"><input type="password" class="form-control" id="courseTutor" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Venue</label>
                                <div class="col-sm-5"><input type="password" class="form-control" id="Venue" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Course Category</label>
                                <div class="col-sm-5">
                                    <select class="form-control">
                                        <option>Category A</option>
                                        <option>Category b</option>
                                        <option>Category c</option>
                                        <option>Category d</option>
                                        <option>Category e</option>
                                    </select>
                                </div></div>
                            <div class="form-group">
                                
                            </div></div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Create Course</button>
                                    </div></div>
                </form></div></div>
          </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
  
  <!-- /.UPDATE COURSE-->
  <div id="updateCourse" class="modal fade .bs-example-modal-lg-update" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myLargeModalLabel">Update Course</h4>
        </div>
        <div class="modal-body">
          <div class="container">
            <div class="row clearfix">
		<div class="col-md-12 column">
                    <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Course Code</label>
                                <div class="col-sm-5"><input type="email" class="form-control" id="courseCode" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Course Name</label>
                                <div class="col-sm-5"><input type="password" class="form-control" id="courseName" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Course Tutor</label>
                                <div class="col-sm-5"><input type="password" class="form-control" id="courseTutor" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Venue</label>
                                <div class="col-sm-5"><input type="password" class="form-control" id="Venue" />
                                </div></div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Course Category</label>
                                <div class="col-sm-5">
                                    <select class="form-control">
                                        <option>Category A</option>
                                        <option>Category b</option>
                                        <option>Category c</option>
                                        <option>Category d</option>
                                        <option>Category e</option>
                                    </select>
                                </div></div>
                            <div class="form-group">
                                
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Update Course</button>
                                    </div></div>
                </form></div></div>
          </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
  <!-- /.Delete -->
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
</html>