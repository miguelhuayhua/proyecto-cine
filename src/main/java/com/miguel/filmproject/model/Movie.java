package com.miguel.filmproject.model;

import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

public class Movie {

    private String _id, plot, rated, title, poster, lastupdated, fullplot;
    private List<String> cast, genres, directors, writers, languages;
    private Document imdb, awards;
    private int year, comments, runtime;

    public Movie() {
        this._id = "";
        this.plot = "";
        this.rated = "";
        this.title = "";
        this.poster = "";
        this.lastupdated = "";
        this.fullplot = "";
        this.cast = new ArrayList<String>();
        this.genres = new ArrayList<String>();
        this.directors = new ArrayList<String>();
        this.writers = new ArrayList<String>();
        this.languages = new ArrayList<String>();;
        this.imdb = new Document();
        this.awards = new Document();
        this.runtime = 0;
        this.imdb.append("rating", 5D);
        this.awards.append("wins", 0);
        this.awards.append("nominations", 0);
        this.awards.append("text", "");

    }

    public String getId() {
        return _id;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public Document getImdb() {
        return imdb;
    }

    public String getFullplot() {
        return fullplot;
    }

    public void setFullplot(String fullplot) {
        this.fullplot = fullplot;
    }

    public void setImdb(Document imdb) {
        this.imdb = imdb;
    }

    public void setId(String _id) {
        this._id = _id;
    }

    public double getRating() {
        return this.imdb.getDouble("rating");
    }

    public String getPlot() {
        return plot;
    }

    public void setPlot(String plot) {
        this.plot = plot;
    }

    public String getRated() {
        return rated;
    }

    public void setRated(String rated) {
        this.rated = rated;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Document getAwards() {
        return awards;
    }

    public void setAwards(Document awards) {
        this.awards = awards;
    }

    public List<String> getLanguages() {
        return languages;
    }

    public void setLanguages(List<String> languages) {
        this.languages = languages;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getLastupdated() {
        return lastupdated;
    }

    public void setLastupdated(String lastupdated) {
        this.lastupdated = lastupdated;
    }

    public List<String> getCast() {
        return cast;
    }

    public void setCast(List<String> cast) {
        this.cast = cast;
    }

    public List<String> getGenres() {
        return genres;
    }

    public void setGenres(List<String> genres) {
        this.genres = genres;
    }

    public List<String> getDirectors() {
        return directors;
    }

    public void setDirectors(List<String> directors) {
        this.directors = directors;
    }

    public List<String> getWriters() {
        return writers;
    }

    public void setWriters(List<String> writers) {
        this.writers = writers;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getComments() {
        return comments;
    }

    public void setComments(int comments) {
        this.comments = comments;
    }

}
