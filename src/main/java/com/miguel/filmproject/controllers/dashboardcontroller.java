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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author miguel
 */
public class dashboardcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("_id")) {
                    User u = new userdaoimplement().getUserById(c.getValue());
                    if (u.isAdmin()) {
                        request.setAttribute("commentSize", new commentdaoimplement().getCommentSize());
                        request.setAttribute("movieSize", new moviedaoimplement().getMovieSize());
                        request.setAttribute("lastMovies", new moviedaoimplement().getMoviesBySkipAndLimit("0", "10"));
                        request.setAttribute("lastUsers", new userdaoimplement().getUsersBySkipAndLimit("0", "10"));
                        request.setAttribute("usersSize", new userdaoimplement().getUsersSize());
                        request.setAttribute("tenTodayComments", new commentdaoimplement().getTenTodayComments());
                        request.setAttribute("admin", u);
                        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
