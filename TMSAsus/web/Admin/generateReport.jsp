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
                            </tr></thead>
                        <tbody>
                            <tr class="success">
                                <td>1</td>
                                <td>SCSJ1012</td>
                                <td>Programming Techinique I</td>
                                <td>17/30</td>
                            </tr></tbody>
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
