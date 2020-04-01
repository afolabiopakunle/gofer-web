/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class LinksServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                        HttpSession session = request.getSession(true);
            String temp = "" + session.getAttribute("Id");
            String location = request.getParameter("type");
            switch (location) {
                case "Home": {
                    if (temp.equals("null") || temp.equals("")) {
                    } else {
                    }
                    response.sendRedirect("index.jsp");
                    break;
                }
                case "Dashboard": {
                    response.sendRedirect("pages/dashboard.jsp");
                    break;
                }
                case "Errands": {
                    response.sendRedirect("pages/errands.jsp");
                    break;
                }
                case "Wallet": {
                    response.sendRedirect("pages/wallet.jsp");
                    break;
                }
                case "Veiw-Errand": {
                    response.sendRedirect("pages/view-errands.jsp");
                    break;
                }
                case "Fund": {
                    response.sendRedirect("pages/fund-wallet.jsp");
                    break;
                }
                case "Post-Errand": {
                    response.sendRedirect("pages/post-errand.jsp");
                    break;
                }
                case "Withdraw": {
                    response.sendRedirect("pages/withdraw.jsp");
                    break;
                }
                case "Profile": {
                    response.sendRedirect("pages/profile.jsp");
                    break;
                }
                case "Messages": {
                    response.sendRedirect("pages/messages.jsp");
                    break;
                }
                case "MyPostedErrand": {
                    response.sendRedirect("pages/my-posted-errand.jsp");
                    break;
                }
                case "Login": {
                    response.sendRedirect("pages/login.jsp");
                    break;
                }
                case "Logout": {
                    session.setAttribute("sess", "");
                    session.setAttribute("userName", "");
                    response.sendRedirect("index.jsp");
                    break;
                }
                default:
                    session.setAttribute("alertMessage", "Sign in to your Account");
                    response.sendRedirect("index.jsp");
                    break;
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
