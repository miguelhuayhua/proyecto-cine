/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers;

import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.utils.ConnectMongo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author miguel
 */
public class usercontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        int ci = Integer.parseInt(request.getParameter("ci"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        new userdaoimplement().createUser(firstname, lastname, username, ci, email, password);
        response.sendRedirect("/");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
