
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.Date"%>
<%@ include file="../Admin/AdminMainPage.jsp" %>
            <li><a href="manageCourse.jsp" class="list-group-item-info"><i class="glyphicon glyphicon-hand-right"></i> Manage Course</a></li>
            <li><a href="generateCertificate.jsp"><i class="glyphicon glyphicon-pencil"></i> Generate Certificate</a></li>
            <li><a href="generateReport.jsp"><i class="glyphicon glyphicon-cloud"></i> Generate Report</a></li>
            <li><a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Change Password</a></li>
            <li><a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a></li>
            </ul>
            </div>
        </div>
    </nav>

    <%
    String justLoggedin = null;
    
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    java.util.Date date = new java.util.Date();
    
    if(request.getParameter("success")!=null){
    justLoggedin =request.getParameter("success");
        if (justLoggedin.equals("1")){
            Cookie ck = new Cookie("lastLogin", dateFormat.format(date));
            ck.setMaxAge(60*60*24*30);
            response.addCookie(ck);  %>
            <script type="text/javascript">
                toastr.success("Login Succesful", "Success");
            </script>
            <%
        }
    }
    
    
    ResultSet result = myDBConnection.doQuery("Select name FROM staffinfo where staffID="+staffID);
    result.next();
    String pagingName;
    if(Verifier.getPrivelage(request).equals("staff"))
            pagingName="";
        
        else if(Verifier.getPrivelage(request).equals("admin"))
            pagingName="ADMINISTRATION";
        
        else 
            pagingName="HEAD OF DEPT.";
    %>
    
    <div id="page-wrapper">
        <!-- UPDATE COURSE -->    
        <div class="targetDiv" id="div2">
            <div class="container">
              <div class="row clearfix">
                  <div class="col-md-8 column">
                      <h1 class="page-header" align="center"><%=pagingName%> HOME PAGE</h1>
                      
            
             <div class="panel-body">
                            <h2 align="center">WELCOME! <br/> <%= result.getString("name") %></h2>
                            <p align="center">Last Login: <%= lastLogin %> </p>
                            <p align="center"><img src="../image/mainImage.jpg" width="100%" height="100%"></p>
                        </div>
                  </div>
              </div>
            </div>
        </div>
        </div>
          
<%
                myDBConnection.closeConnection();
            %>      

<jsp:include page="footer.jsp"/>