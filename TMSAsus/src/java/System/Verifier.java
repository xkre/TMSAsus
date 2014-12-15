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
import javax.servlet.http.Cookie;


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
        
        if (request.getSession() == null)
            return false;
        if (userBean == null)
            return false;
        else
            return true; 
    }
    
    public static void checkPrivelage(HttpServletRequest request, HttpServletResponse response, String ... privelage){
        User userBean = (User)request.getSession().getAttribute("user");
        
        for (int i=0; i < privelage.length ; i++)
        if (userBean.getPrivelage().equals(privelage[i])){
            return;
        }
        
        try{
            if (userBean.getPrivelage().equals("admin"))
                response.sendRedirect("../Admin/MainPage.jsp");
            else if (userBean.getPrivelage().equals("staff"))
                response.sendRedirect("../User/MainPage.jsp");
            else
                response.sendRedirect("../User/MainPage.jsp");
        }
        catch(Exception e){
            System.err.println("Error: "+e);
        }
    }
}
