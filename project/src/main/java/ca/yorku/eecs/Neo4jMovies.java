package ca.yorku.eecs;

import static org.neo4j.driver.v1.Values.parameters;

import com.sun.net.httpserver.HttpExchange;
import org.neo4j.driver.v1.*;

import java.util.List;

public class Neo4jMovies {

    private Driver driver;
    private String uriDb;

    public Neo4jMovies() {
        uriDb = "bolt://localhost:7687"; // may need to change if you used a different port for your DBMS
        Config config = Config.builder().withoutEncryption().build();
        driver = GraphDatabase.driver(uriDb, AuthTokens.basic("neo4j","12345678"), config);
    }

    public void addActor(HttpExchange request) {
        //check if it already exists
        /*
        *
        * */

        //send error 400 status code if repeated


        //else, add the actor to db and send 200 status code
    }

    public void addMovie(HttpExchange request) {

    }

    public void addRelationship(HttpExchange request) {

    }

    public void getActor(HttpExchange request){

    }

    public void getMovie(HttpExchange request){

    }

    public void hasRelationship(HttpExchange request){

    }

    //We can compute the path in this helper and then use the list to determine
    //the bacon number as well
    public List<String> computeBaconHelper(HttpExchange request){
        return null;
    }

    public void computeBaconNumber(HttpExchange request){

    }

    public void computeBaconPath(HttpExchange request){

    }

    public void close() {
        driver.close();
    }
}

