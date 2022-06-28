package com.miguel.filmproject.dao;

import com.miguel.filmproject.model.Movie;
import java.util.List;

public interface moviedao {

    public List<Movie> getMovies(String skip);

    public List<Movie> getMoviesByAttributes(String genre, String year, String rating, String skip);

    public List<Movie> getMoviesByTitle(String title);

    public Movie getMovieById(String _id);

    public int getMovieSize();

    public List<Movie> getMoviesBySkipAndLimit(String skip, String limit);

    public void updateMovie(Movie movie);

    public void addMovie(Movie movie);

    public void deleteMovieById(String id);

    public void releaseMovieById(String id);

}
