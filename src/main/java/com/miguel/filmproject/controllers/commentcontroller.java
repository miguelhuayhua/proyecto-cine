/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers;

import com.miguel.filmproject.dao.commentdaoimplement;
import com.miguel.filmproject.dao.moviedaoimplement;
import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author miguel
 */
public class commentcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("_id")) {
                    User u = new userdaoimplement().getUserById(c.getValue());
                    if (u != null) {
                        String comment_id = request.getParameter("commentid");
                        String movie_id = request.getParameter("id");
                        new commentdaoimplement().deleteCommnet(comment_id, movie_id);
                        response.sendRedirect(request.getHeader("referer"));
                    } else {
                        response.sendRedirect("/");
                    }
                    break;
                }
            }
        }

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
