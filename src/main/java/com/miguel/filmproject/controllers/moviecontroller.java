/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers;

import com.miguel.filmproject.dao.commentdaoimplement;
import com.miguel.filmproject.dao.moviedaoimplement;
import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.Comment;
import com.miguel.filmproject.model.User;
import com.miguel.filmproject.utils.ConnectMongo;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author miguel
 */
@WebServlet(name = "moviecontroller", urlPatterns = {"/movie"})
public class moviecontroller extends HttpServlet {

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

                    break;
                }
            }
        }
        request.setAttribute("user", user);
        String id = "";
        id = request.getParameter("id");
        request.setAttribute("movie", new moviedaoimplement().getMovieById(id));
        request.setAttribute("comments", new commentdaoimplement().getCommentsByMovieId(id));
        request.getRequestDispatcher("movie.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean logged = false;
        String userid = "";
        String text = request.getParameter("text");
        ;
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("_id")) {
                logged = true;
                userid = cookie.getValue();
                break;
            }
        }
        if (logged) {
            User user = new userdaoimplement().getUserById(userid);
            Comment comment = new Comment();
            comment.setMovie_id(request.getParameter("movieid"));
            comment.setText(text);
            comment.setEmail(user.getEmail());
            comment.setName(user.getName());
            comment.setId(user.getId());
            new commentdaoimplement().insertComment(comment);
            response.sendRedirect(request.getRequestURI() + "?id=" + request.getParameter("movieid"));
        } else {
            response.sendRedirect("/login");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
