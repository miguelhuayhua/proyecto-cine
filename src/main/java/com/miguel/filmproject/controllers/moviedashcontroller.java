/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers;

import com.miguel.filmproject.dao.moviedaoimplement;
import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author miguel
 */
public class moviedashcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String genre = "", rating = "", year = "", title = "", skip = "0";
        genre = request.getParameter("genre");
        rating = request.getParameter("rating");
        year = request.getParameter("year");
        title = request.getParameter("title");
        skip = request.getParameter("skip") == null ? "0" : request.getParameter("skip");

        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("_id")) {
                    User u = new userdaoimplement().getUserById(c.getValue());
                    if (u.isAdmin()) {
                        if (year == null && title == null) {
                            request.setAttribute("genre", "Action");
                            request.setAttribute("year", "1965");
                            request.setAttribute("rating", "5");
                            request.setAttribute("show_num", "1");
                            request.setAttribute("allmovies", new moviedaoimplement().getMovies(skip));
                        } else if (title != null) {
                            request.setAttribute("genre", "Action");
                            request.setAttribute("year", "1965");
                            request.setAttribute("rating", "5");
                            request.setAttribute("show_num", "0");
                            request.setAttribute("allmovies", new moviedaoimplement().getMoviesByTitle(title));
                        } else {
                            request.setAttribute("genre", genre);
                            request.setAttribute("year", year);
                            request.setAttribute("rating", rating);
                            request.setAttribute("allmovies", new moviedaoimplement().getMoviesByAttributes(genre, rating, year, skip));
                            request.setAttribute("show_num", "2");
                        }
                        request.setAttribute("admin", u);
                        request.setAttribute("skip", skip);
                        request.getRequestDispatcher("moviedash.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("/");
                    }
                    break;
                }
            }
        } else {
            response.sendRedirect("/");

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
