/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers;

import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class userdashcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String skip = request.getParameter("skip") == null ? "0" : request.getParameter("skip");
        String ci = request.getParameter("ci");
        String username = request.getParameter("username");

        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("_id")) {
                    User u = new userdaoimplement().getUserById(c.getValue());
                    if (u.isAdmin()) {
                        if (ci != null) {
                            request.setAttribute("users", new userdaoimplement().getUserByCi(ci));
                            request.setAttribute("show_num", "0");

                        } else if (username != null) {
                            request.setAttribute("users", new userdaoimplement().getUserByUsername(username));
                            request.setAttribute("show_num", "0");

                        } else {
                            request.setAttribute("users", new userdaoimplement().getUsersBySkipAndLimit(skip, "10"));
                            request.setAttribute("show_num", "1");
                        }
                        request.setAttribute("usersSize", new userdaoimplement().getUsersSize());
                        request.setAttribute("admin", u);
                        request.setAttribute("skip", skip);
                        request.getRequestDispatcher("userdash.jsp").forward(request, response);
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
