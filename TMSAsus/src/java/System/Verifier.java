/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package System;

import beans.User;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Verifier {
    
    public static String getPrivelage(HttpServletRequest request)
    {
        User userBean = (User)request.getSession().getAttribute("user");
        String privelage = userBean.getPrivelage();
        
        return privelage;
    
    }
    public static int getStaffID(HttpServletRequest request)
    {
        User userBean = (User)request.getSession().getAttribute("user");
        int staffID = userBean.getStaffID();
        
        return staffID;
    }
    
    public static boolean isLoggedIn(HttpServletRequest request){
        User userBean = (User)request.getSession().getAttribute("user");
        
        if (userBean != null)
            return true;
        else
            return false; 
    }
    
    public static void checkPrivelage(String privelage,HttpServletRequest request, HttpServletResponse response){
        User userBean = (User)request.getSession().getAttribute("user");
        
        if (userBean.getPrivelage().equals(privelage)){
            return;
        }
        try{
            if (userBean.getPrivelage().equals("admin"))
                response.sendRedirect("./Admin/manageCourse.jsp");
            else if (userBean.getPrivelage().equals("staff"))
                response.sendRedirect("./User/ViewStatus.jsp");
        }
        catch(Exception e){
            System.err.println("Error: "+e);
        }
    }
}
