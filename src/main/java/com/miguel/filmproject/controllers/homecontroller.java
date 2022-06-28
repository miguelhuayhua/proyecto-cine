package com.miguel.filmproject.controllers;

import com.miguel.filmproject.dao.moviedaoimplement;
import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.miguel.filmproject.utils.ConnectMongo;

@WebServlet(name = "homecontroller", urlPatterns = {"/home"})
public class homecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = null;
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
        request.setAttribute("allmovies", new moviedaoimplement().getMovies("0"));
        request.setAttribute("action", new moviedaoimplement().getMoviesByAttributes("Action", "5", "1965", "0"));
        request.setAttribute("horror", new moviedaoimplement().getMoviesByAttributes("Horror", "5", "1965", "0"));
        request.setAttribute("history", new moviedaoimplement().getMoviesByAttributes("History", "5", "1965", "0"));
        request.setAttribute("comedy", new moviedaoimplement().getMoviesByAttributes("Comedy", "5", "1965", "0"));
        request.setAttribute("drama", new moviedaoimplement().getMoviesByAttributes("Drama", "5", "1965", "0"));
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
