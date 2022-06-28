package com.miguel.filmproject.dao;

import com.miguel.filmproject.model.Comment;
import com.miguel.filmproject.utils.ConnectMongo;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.bson.Document;
import org.bson.types.ObjectId;

public class commentdaoimplement implements commentdao {

    @Override
    public List<Comment> getCommentsByMovieId(String id) {
        List<Comment> lista = new ArrayList<Comment>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> comments = db.getCollection("comments");
        MongoCursor<Document> result = comments.aggregate(Arrays.asList(new Document("$match",
                new Document("movie_id",
                        new ObjectId(id))),
                new Document("$sort",
                        new Document("date", -1L)))).cursor();

        while (result.hasNext()) {
            Comment comment = new Comment();
            Document data = result.next();
            comment.setId(data.getObjectId("_id").toString());
            comment.setDate(data.getDate("date"));
            comment.setMovie_id(data.getObjectId("movie_id").toString());
            comment.setName(data.getString("name"));
            comment.setText(data.getString("text"));
            lista.add(comment);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public void insertComment(Comment comment) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> comments = db.getCollection("comments");
        MongoCollection<Document> movies = db.getCollection("movies");
        Document c = new Document();
        c.append("name", comment.getName());
        c.append("email", comment.getEmail());
        c.append("movie_id", new ObjectId(comment.getMovie_id()));
        c.append("text", comment.getText());
        c.append("date", LocalDateTime.now());
        c.append("user_id", comment.getId());
        Document toUpdate = new Document("$inc", new Document("num_mflix_comments", 1));
        movies.updateOne(new Document("_id", new ObjectId(comment.getMovie_id())), toUpdate);
        comments.insertOne(c);
        client.CloseMongoConnection();
    }

    @Override
    public List<Comment> getCommentsByUserId(String id) {
        List<Comment> lista = new ArrayList<Comment>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> comments = db.getCollection("comments");
        MongoCursor<Document> result = comments.aggregate(Arrays.asList(new Document("$match",
                new Document("user_id", id)),
                new Document("$sort",
                        new Document("_id", -1L)),
                new Document("$lookup",
                        new Document("from", "movies")
                                .append("localField", "movie_id")
                                .append("foreignField", "_id")
                                .append("as", "movie")),
                new Document("$addFields",
                        new Document("movieTitle",
                                new Document("$arrayElemAt", Arrays.asList("$movie", 0L)))))).cursor();
        while (result.hasNext()) {
            Comment comment = new Comment();
            Document data = result.next();
            comment.setId(data.getObjectId("_id").toString());
            comment.setDate(data.getDate("date"));
            comment.setName(data.getString("name"));
            comment.setText(data.getString("text"));
            comment.setEmail(data.getString("email"));
            comment.setMovie_id(data.getObjectId("movie_id").toString());
            comment.setMovieTitle(data.get("movieTitle", Document.class).getString("title"));
            lista.add(comment);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public int getCommentSize() {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> comments = db.getCollection("comments");
        Document commentSize = comments.aggregate(Arrays.asList(new Document("$count", "commentSize"))).first();
        client.CloseMongoConnection();

        return commentSize.getInteger("commentSize");
    }

    public List<Comment> getTenTodayComments() {
        List<Comment> lista = new ArrayList<Comment>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> comments = db.getCollection("comments");
        MongoCursor<Document> result = comments.aggregate(Arrays.asList(new Document("$addFields",
                new Document("newDate",
                        new Document("$dateToParts",
                                new Document("date", "$date")))),
                new Document("$match",
                        new Document("newDate.year", LocalDateTime.now().getYear())
                                .append("newDate.day", LocalDateTime.now().getDayOfMonth())),
                new Document("$limit", 10L))
        ).cursor();
        while (result.hasNext()) {
            Comment comment = new Comment();
            Document data = result.next();
            comment.setId(data.getObjectId("_id").toString());
            comment.setDate(data.getDate("date"));
            comment.setMovie_id(data.getObjectId("movie_id").toString());
            comment.setName(data.getString("name"));
            comment.setText(data.getString("text"));
            comment.setEmail(data.getString("email"));
            lista.add(comment);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public void deleteCommnet(String id, String movieId) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> comments = db.getCollection("comments");
        MongoCollection<Document> movies = db.getCollection("movies");
        Document filter = new Document("_id", new ObjectId(id));
        comments.deleteOne(filter);
        Document toUpdate = new Document("$inc", new Document("num_mflix_comments", -1));
        movies.updateOne(new Document("_id", new ObjectId(movieId)), toUpdate);
        client.CloseMongoConnection();
    }
}
