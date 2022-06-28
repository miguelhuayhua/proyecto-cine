package com.miguel.filmproject.utils;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class ConnectMongo {

    private MongoClient mongoClient;

    public MongoDatabase getDb() {
        ConnectionString connectionString = new ConnectionString("mongodb+srv://guess:guess@main-cluster.n39wglo.mongodb.net/?retryWrites=true&w=majority");
        MongoClientSettings setting = MongoClientSettings.builder().applyConnectionString(connectionString).build();
        mongoClient = MongoClients.create(setting);
        MongoDatabase database = mongoClient.getDatabase("movie-project");
        return database;
    }

    public void CloseMongoConnection() {
        this.mongoClient.close();
    }

    public MongoClient getClient() {
        return this.mongoClient;
    }
}
