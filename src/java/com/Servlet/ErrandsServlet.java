/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.google.gson.Gson;
import goferengine.Managers.ErrandManager;
import goferengine.Managers.UserManager;
import goferengine.Managers.UtilityManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class ErrandsServlet extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, UnsupportedEncodingException, InterruptedException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            String caseType = request.getParameter("type").trim();
            String json = "";
            switch (caseType) {
                case "PostErrand": {
                    String [] data = request.getParameterValues("data[]");
                    int Poster = Integer.parseInt(data[0].trim());
                    String Category = data[1].trim();
                    String Pickup = data[2].trim();
                    String Delivery = data[3].trim();
                    String Description = data[4].trim();
                    String price = data[5].trim();
                    String D_Date = data[6].trim();
                    String D_Time = data[7].trim();
                    String insure = data[8].trim();
                    String Status = "pending";
                    String result ="";
                    
                    Date Deadline_Date = UtilityManager.getSqlDateFromString(D_Date);
                    String Amount = UtilityManager.PunctuatePrice(price);
                    String Insurance = UtilityManager.PunctuatePrice(insure);
                    if (ErrandManager.checkUserInputs(Poster, Category, Pickup, Delivery, Description, Amount, Deadline_Date)) {
                        if (!ErrandManager.checkForExistingErrand(Poster, Category, Pickup, Description, Amount, Deadline_Date)) {
                            result = ErrandManager.CreateErrand(Poster, Category, Pickup, Delivery, Description, Amount, Deadline_Date, D_Time, Insurance, Status);
                            if (result.equalsIgnoreCase("failed")) {
                                result = "Something went wrong, Please try again";
                            } else {
                                result = "success";
                            }
                        } else {
                            result = "Errand from the same User exist on the System";
                        }
                    } else {
                        result = "Invalid Inputs";
                    }
//                    String json1 = new Gson().toJson(result);
                    String json1 = new Gson().toJson(result);
                    json = "[" + json1 + "]";
                    break;
                }

            }
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            throws ServletException, IOException, UnsupportedEncodingException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
