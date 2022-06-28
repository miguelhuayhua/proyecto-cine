package com.miguel.filmproject.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {

    private String _id, movie_id, name, email, text, movieTitle, user_id;
    private Date date;

    public Comment() {
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
    }

    public String getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(String movie_id) {
        this.movie_id = movie_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String toStringDate() {
        DateFormat dateFormat = new SimpleDateFormat("dd 'de' MMMM yyyy 'a las' hh:mm:ss");
        return dateFormat.format(date);
    }

}
