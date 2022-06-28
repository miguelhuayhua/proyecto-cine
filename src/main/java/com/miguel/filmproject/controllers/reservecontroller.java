/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers;

import com.miguel.filmproject.dao.moviedaoimplement;
import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.User;
import com.miguel.filmproject.utils.ConnectMongo;
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
public class reservecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = null;
        String id = request.getParameter("id");
        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("_id")) {
                    User u = new userdaoimplement().getUserById(c.getValue());
                    user = u;
                    if (request.getParameter("out") != null) {
                        if (request.getParameter("out").equals("true")) {
                            c.setMaxAge(0);
                            response.addCookie(c);
                            user = null;
                        }
                    }
                    break;
                }
            }
        }
        request.setAttribute("user", user);
        request.setAttribute("movie", new moviedaoimplement().getMovieById(id));
        request.getRequestDispatcher("buymovie.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
