/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package System;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbConnection.*;
import beans.User;
import java.sql.*;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Akram
 */
public class loginVerify extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DBConnect db = new DBConnect();
        db.loadConnection();

        try (PrintWriter out = response.getWriter()) {

            String user = null;
            String pwd = null;
            String privelage = null;

            boolean loginSuccess = false;
            HttpSession session = request.getSession(true);
            if (request.getHeader("referer") == null) {
                session.invalidate();
                response.sendRedirect("./login.jsp?error=1");
            } else if (request.getHeader("referer").contains("login.jsp")) {
                user = request.getParameter("username");
                pwd = request.getParameter("password");
                String query = "SELECT * FROM logininfo WHERE username='"+user+"' AND password='"+pwd+"'";
                //out.println(query);
                ResultSet result = db.doQuery(query);
                if (!result.next()) {
                    loginSuccess = false;
                    response.sendRedirect("./login.jsp?error=2");
                } else {
                    loginSuccess = true;
                    privelage = result.getString("privelage");
                    setSession(result.getString("staffID"), privelage,request);
                    //INSERT user info into session
                }
            }
            if (loginSuccess) {
//                out.println("somewhere2");
                if (privelage.equals("staff")) {
                    response.sendRedirect("./User/MainPage.jsp?success=1");//mainPage
                } else if (privelage.equals("admin")) {
                    response.sendRedirect("./Admin/MainPage.jsp?success=1");//mainPage
                } else {
                    response.sendRedirect("./User/MainPage.jsp?success=1");//mainPage
                }
            }
        } catch (SQLException sqle) {
            System.err.println("Error connecting: " + sqle);
        }
        finally{
            db.closeConnection();
        }
    }
    
    private void setSession(String staffID, String privelage, HttpServletRequest request){
        HttpSession session = request.getSession(true);
        
        User userBean = new User();
        userBean.setStaffID(Integer.parseInt(staffID));
        userBean.setPrivelage(privelage);
        
        session.setAttribute("user", userBean);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
