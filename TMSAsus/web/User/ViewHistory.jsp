<%@ include file="../User/UserMainPage.jsp" %>

<%
        
%>
                        <li>
                            <a href="ViewStatus.jsp"><i class="glyphicon glyphicon-hand-right"></i> View Status</a>
                        </li>
                        <li>
                            <a href="ApplyCourse.jsp"><i class="glyphicon glyphicon-pencil"></i> Apply Course</a>
                        </li>
                        <li>
                            <a href="ViewHistory.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-cloud"></i> View History</a>
                        </li>
                        <li>
                            <a href="editProfile.jsp" ><i class="glyphicon glyphicon-leaf"></i> Edit Profile</a>
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
                        <h1 class="page-header">View History</h1>
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Category</th>
                                            <th>Date Start</th>
                                            <th>Date End</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr >
                                            <td>1</td>
                                            <td>SCSJ</td>
                                            <td>Software Enggineering</td>
                                            <td>Lecture only</td>
                                            <td>14/12/14</td>
                                            <td>15/12/14</td>
                                            
                                        </tr>
                                        <tr >
                                            <td>2</td>
                                            <td>SCSD</td>
                                            <td>Database</td>
                                            <td>Lecture and Pactical</td>
                                            <td>19/12/14</td>
                                            <td>20/12/14</td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            
                        </div>
                            
                            
			
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
    $('#form').validator()
</script>      
        

</body>
</html>
