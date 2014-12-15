<%@page import="javax.mail.Session"%>
<%@ include file="../User/UserMainPage.jsp" %>

<%
    String justLoggedin = null;
    
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    
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
 %>
 
                        <li>
                            <a href="ViewStatus.jsp"><i class="glyphicon glyphicon-hand-right"></i>  View Status</a>
                        </li>
                        <li>
                            <a href="ApplyCourse.jsp"><i class="glyphicon glyphicon-pencil"></i> Apply Course</a>
                        </li>
                        <li>
                            <a href="ViewHistory.jsp"><i class="glyphicon glyphicon-cloud"></i> View History</a>
                        </li>
                        <% if(Verifier.getPrivelage(request).equals("head of dept.")){ %>
                        <li>
                            <a href="KJ_VerifyApplication.jsp"><i class="glyphicon glyphicon-leaf"></i> Verify Application</a>
                        </li><% } %>
                        <li>
                            <a href="editProfile.jsp"><i class="glyphicon glyphicon-leaf"></i> Change Password</a>
                        </li>
                        
                        <li>
                            <a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Log Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
<%
        String query = "SELECT name FROM staffinfo Where staffID="+staffID;
        PreparedStatement statement = con.prepareStatement(query);

        ResultSet result;

        result = db.doQuery(statement);
        if(result!=null) result.next();
        String pagingName;
        
        if(Verifier.getPrivelage(request).equals("staff"))
            pagingName="";
        
        else if(Verifier.getPrivelage(request).equals("admin"))
            pagingName="ADMINISTRATION";
        
        else 
            pagingName="HEAD OF DEPT.";
%>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header" align="center"><%=pagingName%> HOME PAGE</h1>
                        <div class="panel-body">
                            <h2 align="center">WELCOME! <br/> <%= result.getString("name") %></h2><br/>
                            <p align="center">Last Login: <%= lastLogin %> </p>
                            <p align="center"><img src="../image/mainImage.jpg" width="80%" height="80%"></p>
                        </div>
			<% db.closeConnection();    %>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
    $('#form').validator()
</script>      


</body>
</html>
