/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.miguel.filmproject.dao;

import com.miguel.filmproject.model.User;
import com.miguel.filmproject.utils.ConnectMongo;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.bson.BsonNull;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author miguel
 */
public class userdaoimplement implements userdao {

    @Override
    public User existLogUser(String name, String password) {
        String encode = "";
        User user = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(password.getBytes());
            byte[] encbytes = md5.digest();
            encode = new BigInteger(1, encbytes).toString(16);
        } catch (Exception e) {
            encode = "";
        }
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        Document result = users.aggregate(Arrays.asList(new Document("$match",
                new Document("name", name)
                        .append("password", encode)))).first();

        if (result == null) {
            client.CloseMongoConnection();

            return user;
        } else {
            user = new User();
            user.setEmail(result.getString("email"));
            user.setId(result.getObjectId("_id").toString());
            user.setName(result.getString("name"));
            user.setFirstname(result.getString("firstname"));
            user.setLastname(result.getString("lastname"));
            user.setCi(result.getInteger("ci"));
            try {
                user.setAdmin(result.getBoolean("admin"));
            } catch (Exception e) {
                user.setAdmin(false);
            }
            client.CloseMongoConnection();
            return user;
        }
    }

    @Override
    public void createUser(String firstname, String lastname, String username, int ci, String email, String password) {

        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        Document user = new Document();
        user.append("name", username);
        user.append("lastname", lastname);
        user.append("firstname", firstname);
        user.append("ci", ci);
        user.append("email", email);
        String encode = "";
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(password.getBytes());
            byte[] encbytes = md5.digest();
            encode = new BigInteger(1, encbytes).toString(16);
        } catch (Exception e) {
            encode = "";
        }
        user.append("password", encode);
        users.insertOne(user);
        client.CloseMongoConnection();

    }

    @Override
    public User getUserById(String id) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        Document result = users.aggregate(Arrays.asList(new Document("$match",
                new Document("_id", new ObjectId(id))))).first();
        User user = new User();
        if (result != null) {
            user.setEmail(result.getString("email"));
            user.setId(result.getObjectId("_id").toString());
            user.setName(result.getString("name"));
            user.setFirstname(result.getString("firstname"));
            user.setLastname(result.getString("lastname"));
            user.setCi(result.getInteger("ci"));
            try {
                user.setAdmin(result.getBoolean("admin"));
            } catch (Exception e) {
                user.setAdmin(false);
            }
        } else {
            user = null;
        }

        client.CloseMongoConnection();

        return user;
    }

    @Override
    public List<User> getUsersBySkipAndLimit(String skip, String limit) {
        List<User> lista = new ArrayList<User>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        MongoCursor<Document> result = users.aggregate(Arrays.asList(new Document("$match",
                new Document("admin",
                        new BsonNull())),
                new Document("$sort",
                        new Document("_id", -1L)),
                new Document("$skip", Long.parseLong(skip) * 20L),
                new Document("$limit", Long.parseLong(limit)))).cursor();
        while (result.hasNext()) {
            User user = new User();
            Document data = result.next();
            user.setEmail(data.getString("email"));
            user.setId(data.getObjectId("_id").toString());
            user.setName(data.getString("name"));
            user.setFirstname(data.getString("firstname"));
            user.setLastname(data.getString("lastname"));
            user.setCi(data.getInteger("ci"));
            lista.add(user);
        }
        client.CloseMongoConnection();

        return lista;
    }

    @Override
    public int getUsersSize() {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        Document result = users.aggregate(Arrays.asList(new Document("$count", "usersSize"))).first();
        client.CloseMongoConnection();
        return result.getInteger("usersSize");
    }

    @Override
    public List<User> getUserByUsername(String username) {
        List<User> lista = new ArrayList<User>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        MongoCursor<Document> result = users.aggregate(Arrays.asList(new Document("$match",
                new Document("name",
                        new Document("$regex", username)
                                .append("$options", "ig"))),
                new Document("$sort",
                        new Document("_id", -1L)))).cursor();
        while (result.hasNext()) {
            User user = new User();
            Document data = result.next();
            user.setEmail(data.getString("email"));
            user.setId(data.getObjectId("_id").toString());
            user.setName(data.getString("name"));
            user.setFirstname(data.getString("firstname"));
            user.setLastname(data.getString("lastname"));
            user.setCi(data.getInteger("ci"));
            lista.add(user);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public List<User> getUserByCi(String ci) {
        List<User> lista = new ArrayList<User>();
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        MongoCursor<Document> result = users.aggregate(Arrays.asList(new Document("$addFields",
                new Document("ci_s",
                        new Document("$toString", "$ci"))),
                new Document("$match",
                        new Document("ci_s",
                                new Document("$regex", ci)
                                        .append("$options", "g"))),
                new Document("$sort",
                        new Document("ci_s", -1L)))).cursor();
        while (result.hasNext()) {
            User user = new User();
            Document data = result.next();
            user.setEmail(data.getString("email"));
            user.setId(data.getObjectId("_id").toString());
            user.setName(data.getString("name"));
            user.setFirstname(data.getString("firstname"));
            user.setLastname(data.getString("lastname"));
            user.setCi(data.getInteger("ci"));
            lista.add(user);
        }
        client.CloseMongoConnection();
        return lista;
    }

    @Override
    public void deleteUserById(String id) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        Document user = new Document();
        user.append("_id", new ObjectId(id));
        users.deleteOne(user);
        client.CloseMongoConnection();
    }

    @Override
    public void updateUser(User user) {
        ConnectMongo client = new ConnectMongo();
        MongoDatabase db = client.getDb();
        MongoCollection<Document> users = db.getCollection("users");
        Document filter = new Document();
        filter.append("_id", new ObjectId(user.getId()));
        Document toUpdate = new Document();
        Document values = new Document();
        values.append("firstname", user.getFirstname());
        values.append("lastname", user.getLastname());
        values.append("ci", user.getCi());
        values.append("email", user.getEmail());
        values.append("name", user.getName());
        toUpdate.append("$set", values);
        users.updateOne(filter, toUpdate);
        client.CloseMongoConnection();
    }

}
