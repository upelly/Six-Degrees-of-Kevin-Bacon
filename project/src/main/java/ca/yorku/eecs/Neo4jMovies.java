package ca.yorku.eecs;

import static org.neo4j.driver.v1.Values.parameters;

import com.sun.net.httpserver.HttpExchange;
import org.neo4j.driver.v1.*;

public class Neo4jMovies {

    private Driver driver;
    private String uriDb;

    public Neo4jMovies() {
        uriDb = "bolt://localhost:7687"; // may need to change if you used a different port for your DBMS
        Config config = Config.builder().withoutEncryption().build();
        driver = GraphDatabase.driver(uriDb, AuthTokens.basic("Neo4jMovies","12345678"), config);
    }

    public void addActor(HttpExchange request) {

    }

    public void addMovie(HttpExchange request) {

    }

    public void addRelationship(HttpExchange request) {

    }

    public void getActor(HttpExchange request){

    }

    public void close() {
        driver.close();
    }
}

