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
}
