/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.miguel.filmproject.dao;

import com.miguel.filmproject.model.Movie;
import com.miguel.filmproject.utils.ConnectMongo;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import org.bson.Document;
import org.bson.types.ObjectId;

public class moviedaoimplement implements moviedao {

    @Override
    public List<Movie> getMovies(String skip) {
        List<Movie> lista = new ArrayList<Movie>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        MongoCursor<Document> result = movies.aggregate(Arrays.asList(new Document("$sort",
                new Document("lastupdated", -1L)),
                new Document("$skip", Long.parseLong(skip) * 20L),
                new Document("$limit", 10L))).cursor();
        while (result.hasNext()) {
            Movie movie = new Movie();
            Document data = result.next();
            movie.setPoster(data.getString("poster"));
            movie.setTitle(data.getString("title"));
            movie.setPlot(data.getString("plot"));
            movie.setGenres(data.getList("genres", String.class));
            movie.setComments(data.getInteger("num_mflix_comments"));
            movie.setImdb(data.get("imdb", Document.class));
            movie.setRuntime(data.getInteger("runtime"));
            movie.setId(data.getObjectId("_id").toString());
            movie.setYear(data.getInteger("year"));

            lista.add(movie);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public List<Movie> getMoviesByAttributes(String genre, String rating, String year, String skip) {
        List<Movie> lista = new ArrayList<Movie>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        MongoCursor<Document> result = movies.aggregate(Arrays.asList(new Document("$match",
                new Document("genres",
                        new Document("$in", Arrays.asList(genre)))
                        .append("imdb.rating",
                                new Document("$gte", Double.parseDouble(rating)))
                        .append("year",
                                new Document("$gte", Long.parseLong(year)))),
                new Document("$sort",
                        new Document("imdb.rating", -1L).append("year", 1L)),
                new Document("$skip", Long.parseLong(skip) * 20L),
                new Document("$limit", 20L))).cursor();

        while (result.hasNext()) {
            Movie movie = new Movie();
            Document data = result.next();
            movie.setPoster(data.getString("poster"));
            movie.setTitle(data.getString("title"));
            movie.setPlot(data.getString("plot"));
            movie.setGenres(data.getList("genres", String.class));
            movie.setComments(data.getInteger("num_mflix_comments"));
            movie.setImdb(data.get("imdb", Document.class));
            movie.setRuntime(data.getInteger("runtime"));
            movie.setId(data.getObjectId("_id").toString());
            movie.setYear(data.getInteger("year"));
            lista.add(movie);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public List<Movie> getMoviesByTitle(String title) {
        List<Movie> lista = new ArrayList<Movie>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        MongoCursor<Document> result = movies.aggregate(Arrays.asList(new Document("$match",
                new Document("title",
                        new Document("$regex", title)
                                .append("$options", "ia"))),
                new Document("$sort",
                        new Document("year", -1L)),
                new Document("$limit", 20L))).cursor();

        while (result.hasNext()) {
            Movie movie = new Movie();
            Document data = result.next();
            movie.setPoster(data.getString("poster"));
            movie.setTitle(data.getString("title"));
            movie.setPlot(data.getString("plot"));
            movie.setGenres(data.getList("genres", String.class));
            movie.setComments(data.getInteger("num_mflix_comments"));
            movie.setImdb(data.get("imdb", Document.class));
            movie.setRuntime(data.getInteger("runtime"));
            movie.setId(data.getObjectId("_id").toString());
            movie.setYear(data.getInteger("year"));
            lista.add(movie);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public Movie getMovieById(String _id) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        Document result = movies.aggregate(Arrays.asList(new Document("$match",
                new Document("_id", new ObjectId(_id))))).first();
        Movie movie = new Movie();
        movie.setPoster(result.getString("poster"));
        movie.setTitle(result.getString("title"));
        movie.setPlot(result.getString("plot"));
        movie.setFullplot(result.getString("fullplot"));
        movie.setGenres(result.getList("genres", String.class));
        movie.setComments(result.getInteger("num_mflix_comments"));
        movie.setImdb(result.get("imdb", Document.class));
        movie.setRuntime(result.getInteger("runtime"));
        movie.setId(result.getObjectId("_id").toString());
        movie.setDirectors(result.getList("directors", String.class));
        movie.setWriters(result.getList("writers", String.class));
        movie.setCast(result.getList("cast", String.class));
        movie.setLanguages(result.getList("languages", String.class));
        movie.setAwards(result.get("awards", Document.class));
        movie.setRated(result.getString("rated"));
        movie.setYear(result.getInteger("year"));
        client.CloseMongoConnection();
        return movie;
    }

    @Override
    public int getMovieSize() {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        Document result = movies.aggregate(Arrays.asList(new Document("$count", "movieSize"))).first();
        client.CloseMongoConnection();
        return result.getInteger("movieSize");
    }

    @Override
    public List<Movie> getMoviesBySkipAndLimit(String skip, String limit) {
        List<Movie> lista = new ArrayList<Movie>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        MongoCursor<Document> result = movies.aggregate(Arrays.asList(
                new Document("$sort",
                        new Document("lastupdated", -1L)),
                new Document("$skip", Long.parseLong(skip) * 20L),
                new Document("$limit", Long.parseLong(limit)))).cursor();

        while (result.hasNext()) {
            Movie movie = new Movie();
            Document data = result.next();
            movie.setPoster(data.getString("poster"));
            movie.setTitle(data.getString("title"));
            movie.setPlot(data.getString("plot"));
            movie.setGenres(data.getList("genres", String.class));
            movie.setComments(data.getInteger("num_mflix_comments"));
            movie.setImdb(data.get("imdb", Document.class));
            movie.setRuntime(data.getInteger("runtime"));
            movie.setId(data.getObjectId("_id").toString());
            movie.setLastupdated(data.getString("lastupdated"));
            movie.setYear(data.getInteger("year"));
            lista.add(movie);
        }
        client.CloseMongoConnection();

        return lista;
    }

    @Override
    public void updateMovie(Movie movie) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        Document filter = new Document();
        filter.append("_id", new ObjectId(movie.getId()));
        Document toUpdate = new Document();
        Document values = new Document();
        values.append("title", movie.getTitle());
        values.append("fullplot", movie.getFullplot());
        values.append("plot", movie.getPlot());
        values.append("poster", movie.getPoster());
        values.append("genres", movie.getGenres());
        values.append("imdb.rating", movie.getImdb().getDouble("rating"));
        values.append("year", movie.getYear());
        values.append("runtime", movie.getRuntime());
        values.append("writers", movie.getWriters());
        values.append("directors", movie.getDirectors());
        values.append("cast", movie.getCast());
        values.append("languages", movie.getLanguages());
        values.append("awards", movie.getAwards());
        values.append("rated", movie.getRated());
        toUpdate.append("$set", values);
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss.SSS");
        values.append("lastupdated", format.format(new Date()) + "000000");
        movies.updateOne(filter, toUpdate);
        client.CloseMongoConnection();
    }

    @Override
    public void addMovie(Movie movie) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        Document values = new Document();
        values.append("title", movie.getTitle());
        values.append("fullplot", movie.getFullplot());
        values.append("plot", movie.getPlot());
        values.append("poster", movie.getPoster());
        values.append("genres", movie.getGenres());
        values.append("imdb", new Document("rating", movie.getImdb().getDouble("rating")));
        values.append("year", movie.getYear());
        values.append("writers", movie.getWriters());
        values.append("directors", movie.getDirectors());
        values.append("cast", movie.getCast());
        values.append("runtime", movie.getRuntime());
        values.append("num_mflix_comments", 0);
        values.append("awards", movie.getAwards());
        values.append("languages", movie.getLanguages());
        values.append("rated", movie.getRated());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss.SSS");
        values.append("lastupdated", format.format(new Date()) + "000000");
        movies.insertOne(values);
        client.CloseMongoConnection();
    }

    @Override
    public void deleteMovieById(String id) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        Document filter = new Document();
        filter.append("_id", new ObjectId(id));
        movies.deleteOne(filter);
        client.CloseMongoConnection();
    }

    @Override
    public void releaseMovieById(String id) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> movies = db.getCollection("movies");
        Document filter = new Document();
        filter.append("_id", new ObjectId(id));
        Document toUpdate = new Document();
        Document values = new Document();
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss.SSS");
        values.append("lastupdated", format.format(new Date()) + "000000");
        toUpdate.append("$set", values);
        movies.updateOne(filter, toUpdate);
        client.CloseMongoConnection();
    }
}
