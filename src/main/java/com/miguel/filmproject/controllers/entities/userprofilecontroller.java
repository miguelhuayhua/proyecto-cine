/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers.entities;

import com.miguel.filmproject.dao.commentdaoimplement;
import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.Comment;
import com.miguel.filmproject.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author miguel
 */
public class userprofilecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Cookie[] cookies = request.getCookies();
        if (id == null) {
            request.setAttribute("user", null);
            request.setAttribute("usercomments", new ArrayList<Comment>());

        } else {
            if (request.getCookies() != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals("_id")) {
                        User u = new userdaoimplement().getUserById(c.getValue());
                        if (u.isAdmin()) {
                            User user = new userdaoimplement().getUserById(id);
                            request.setAttribute("admin", u);
                            request.setAttribute("user", user);
                            request.setAttribute("usercomments", new commentdaoimplement().getCommentsByUserId(user.getId()));
                            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
                        } else {
                            response.sendRedirect("/");
                        }
                        break;
                    }
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("userid");
        String method = request.getParameter("method");
        if (method.equals("delete")) {
            new userdaoimplement().deleteUserById(id);
            response.sendRedirect("user");
        } else if (method.equals("put")) {
            User user = new User();
            user.setName(request.getParameter("username"));
            user.setFirstname(request.getParameter("firstname"));
            user.setEmail(request.getParameter("email"));
            user.setLastname(request.getParameter("lastname"));
            user.setCi(Integer.parseInt(request.getParameter("ci")));
            user.setId(id);
            new userdaoimplement().updateUser(user);
            response.sendRedirect("userprofile?id=" + id);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
