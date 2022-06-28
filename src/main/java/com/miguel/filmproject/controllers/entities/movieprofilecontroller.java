/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miguel.filmproject.controllers.entities;

import com.miguel.filmproject.dao.commentdaoimplement;
import com.miguel.filmproject.dao.moviedaoimplement;
import com.miguel.filmproject.dao.userdaoimplement;
import com.miguel.filmproject.model.Movie;
import com.miguel.filmproject.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;

/**
 *
 * @author miguel
 */
public class movieprofilecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            request.setAttribute("movie", new Movie());
        } else {
            Movie movie = new moviedaoimplement().getMovieById(id);
            if (movie == null) {
                request.setAttribute("movie", new Movie());

            } else {
                request.setAttribute("movie", movie);
            }
        }
        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("_id")) {
                    User u = new userdaoimplement().getUserById(c.getValue());
                    if (u.isAdmin()) {
                        request.setAttribute("admin", u);
                        request.getRequestDispatcher("movieprofile.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String method = request.getParameter("method");
        if (method.equals("delete")) {
            try {
                Movie movie = new moviedaoimplement().getMovieById(id);
                new moviedaoimplement().deleteMovieById(id);
                response.sendRedirect("movie");
            } catch (Exception e) {
                response.sendRedirect("/");
            }
        } else if (method.equals("release")) {
            try {
                Movie movie = new moviedaoimplement().getMovieById(id);
                new moviedaoimplement().releaseMovieById(id);
                response.sendRedirect("movieprofile?id=" + movie.getId());
            } catch (Exception e) {
                System.out.println(e);
                response.sendRedirect("/");
            }

        } else if (method.equals("add")) {
            String title = request.getParameter("title");
            String fullplot = request.getParameter("fullplot");
            String plot = request.getParameter("plot");
            String poster = request.getParameter("poster");
            int runtime = Integer.parseInt(request.getParameter("runtime"));
            double rating = Double.parseDouble(request.getParameter("rating"));
            int year = Integer.parseInt(request.getParameter("year"));
            List<String> directors = new ArrayList<String>();
            List<String> cast = new ArrayList<String>();
            List<String> genres = new ArrayList<String>();
            List<String> writers = new ArrayList<String>();

            for (String director : Arrays.asList(request.getParameter("directors").split(","))) {
                if (!director.equals(" ")) {
                    directors.add(director.trim());
                }
            }

            for (String actor : Arrays.asList(request.getParameter("cast").split(","))) {
                if (!actor.equals(" ")) {
                    cast.add(actor.trim());
                }
            }

            for (String writer : Arrays.asList(request.getParameter("writers").split(","))) {
                if (!writer.equals(" ")) {
                    writers.add(writer.trim());
                }
            }
            for (String genre : Arrays.asList(request.getParameter("genres").split(","))) {
                if (!genre.equals(" ")) {
                    genres.add(genre.trim());
                }
            }

            try {
                Movie movie = new moviedaoimplement().getMovieById(id);
                Movie toUpdate = new Movie();
                toUpdate.setCast(cast);
                toUpdate.setDirectors(directors);
                toUpdate.setFullplot(fullplot);
                toUpdate.setPlot(plot);
                toUpdate.setGenres(genres);
                toUpdate.setYear(year);
                toUpdate.setImdb(new Document("rating", rating));
                toUpdate.setId(id);
                toUpdate.setPoster(poster);
                toUpdate.setTitle(title);
                toUpdate.setRuntime(runtime);
                toUpdate.setWriters(writers);
                new moviedaoimplement().updateMovie(toUpdate);
                response.sendRedirect("movieprofile?id=" + movie.getId());
            } catch (Exception e) {
                Movie toAdd = new Movie();
                toAdd.setCast(cast);
                toAdd.setDirectors(directors);
                toAdd.setFullplot(fullplot);
                toAdd.setWriters(writers);
                toAdd.setPlot(plot);
                toAdd.setGenres(genres);
                toAdd.setYear(year);
                toAdd.setImdb(new Document("rating", rating));
                toAdd.setPoster(poster);
                toAdd.setTitle(title);
                toAdd.setRuntime(runtime);
                new moviedaoimplement().addMovie(toAdd);
                response.sendRedirect("movie");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
