<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ include file="../Admin/AdminMainPage.jsp" %>
<script type="text/javascript">
        $('.targetDiv').hide();
</script>
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
                                <th>Action</th>
                            </tr></thead>
                        <tbody>
                            <%
                               ResultSet resultSet, resultSet2;
                               String template = null,
                                      courseCode = null,
                                      courseName = null,
                                      courseID = null,
                                      temp = null,
                                      courseStatus = null;
                                int total = 0,
                                    attentStudent = 0,
                                    courseIDCount = 0,
                                    courseIDCount_increment = 0;
                                int[][] dataGraph = new int[12][2];
                                int count = 1;
                                Date startDate = new Date(0);
                                Date endDate = new Date(0);
                                int[][] multi;
                               
                               template = "SELECT COUNT(courseID) FROM courseinfo";
                               resultSet = DBConnect.doQuery(template);
                               while (resultSet.next()){
                                   int a = resultSet.getInt(1);
                                   courseIDCount +=a;
                               }
                               multi = new int[courseIDCount][9];
                                
                               template = "SELECT * FROM courseinfo";
                               resultSet = DBConnect.doQuery(template);
                               while (resultSet.next()){
                                   courseID     = resultSet.getString("courseID");
                                   courseCode   = resultSet.getString("courseCode");
                                   courseName   = resultSet.getString("courseName");
                                   courseStatus = resultSet.getString("courseStatus");
                                   startDate    = resultSet.getDate("startDate");
                                   endDate      = resultSet.getDate("endDate");
                                   
                                   template = "SELECT SUM(attendanceStatus),COUNT(attendanceStatus) FROM participationinfo WHERE courseID=" + courseID;
                                   resultSet2 = DBConnect.doQuery(template);
                                   while (resultSet2.next()){
                                       int a = resultSet2.getInt(1);
                                       int b = resultSet2.getInt(2);
                                       attentStudent += a;
                                       total += b;
                                   }
;
                                   DateFormat dateFormatDay = new SimpleDateFormat("dd");
                                   DateFormat dateFormatMonth = new SimpleDateFormat("MM");
                                   DateFormat dateFormatYear = new SimpleDateFormat("yyyy");                                    
                                   multi[courseIDCount_increment][0] = Integer.parseInt(courseID);                            //Course ID
                                   multi[courseIDCount_increment][1] = Integer.parseInt(dateFormatDay.format(startDate));     //startDate Day
                                   multi[courseIDCount_increment][2] = Integer.parseInt(dateFormatMonth.format(startDate));   //startDate month
                                   multi[courseIDCount_increment][3] = Integer.parseInt(dateFormatYear.format(startDate));    //startDate year
                                   multi[courseIDCount_increment][4] = Integer.parseInt(dateFormatDay.format(endDate));       //startDate Day
                                   multi[courseIDCount_increment][5] = Integer.parseInt(dateFormatMonth.format(endDate));     //startDate month
                                   multi[courseIDCount_increment][6] = Integer.parseInt(dateFormatYear.format(endDate));      //startDate year
                                   multi[courseIDCount_increment][7] = attentStudent;      //Attend
                                   multi[courseIDCount_increment][8] = total;      //Total
                                   
                                   //System.out.println(Arrays.deepToString(multi));
                                   int[] monthArray ={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
                                   
                                   for(int x=0; x<12; x++){
                                        if(multi[courseIDCount_increment][2] == monthArray[x]){
                                            dataGraph[x][0] += attentStudent;
                                            dataGraph[x][1] += total-attentStudent;
                                        }       
                                    }
                                   
                                   System.out.println(Arrays.deepToString(dataGraph));
                                   
                                   courseIDCount_increment++;
                                   
                                   if(courseStatus.equals("Done"))
                                        temp = "success";

                                   else 
                                        temp = "active";
                            %>  
                                <tr class="<%= temp %>">
                                    <td><%= count %></td>
                                    <td><%= courseCode %></td>
                                    <td><%= courseName %></td>
                                    <td><%= attentStudent %>/<%= total %></td>
                                    <td class="text-center">
                                        <!--a href="../Admin/generateChart.jsp?attend=<%= attentStudent %>&total=<%= total %>"-->
                                        <i onclick="myFunction(<%= attentStudent %>, <%= total %>)" class="generateGraph glyphicon glyphicon-forward" data-toggle="tooltip" data-placement="left" title="generate report"></i></a
                                    </td>
                                </tr>
                                <%
                                attentStudent =0;
                                total =0;
                                count++;
                            }%>
                        </tbody>
                </table>
		</div>
                </div>
                </div>
                        <div class="container" style="min-width: 310px; height: 100px; max-width: 600px; margin: 0 auto"></div>
                        <div class="container1" style="min-width: 310px; height: 300px; max-width: 600px; margin: 0 auto"></div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
function myFunction(attentStudent, total)
  {
    // Radialize the colors
    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    });
    
    // Build the chart
    $('.container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: 'Attendance Report For Course "<%= courseName %>"'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    },
                    connectorColor: 'silver'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Percentage',
            data: [
                ['Attend',  attentStudent ],
                ['Absence', total-attentStudent]
            ]
        }]
    });
    
    $('.container1').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Monthly Average Attendace'
        },
        subtitle: {
            text: 'Course Name'
        },
        xAxis: {
            categories: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
            ]
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Frequency'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.0f} student</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Attend',
            data: [<%= dataGraph[0][0] %>, <%= dataGraph[1][0] %>, <%= dataGraph[2][0] %>, <%= dataGraph[3][0] %>, <%= dataGraph[4][0] %>, <%= dataGraph[5][0] %>, 
                    <%= dataGraph[6][0] %>, <%= dataGraph[7][0] %>, <%= dataGraph[8][0] %>, <%= dataGraph[9][0] %>, <%= dataGraph[10][0] %>, <%= dataGraph[11][0] %>, ]
        }, {
            name: 'Absence',
            data: [<%= dataGraph[0][1] %>, <%= dataGraph[1][1] %>, <%= dataGraph[2][1] %>, <%= dataGraph[3][1] %>, <%= dataGraph[4][1] %>, <%= dataGraph[5][1] %>, 
                    <%= dataGraph[6][1] %>, <%= dataGraph[7][1] %>, <%= dataGraph[8][1] %>, <%= dataGraph[9][1] %>, <%= dataGraph[10][1] %>, <%= dataGraph[11][1] %>, ]
        }]
    });
}
</script>
<script src="../js/highcharts.js"></script>
<script src="../js/modules/exporting.js"></script>
<jsp:include page="footer.jsp"/>
