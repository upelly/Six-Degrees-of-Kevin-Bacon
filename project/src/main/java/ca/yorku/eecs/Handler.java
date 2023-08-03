package ca.yorku.eecs;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;

public class Handler implements HttpHandler{

    private Neo4jMovies nm = new Neo4jMovies();

    @Override
    public void handle(HttpExchange request) throws IOException {

        try {
            URI uri = request.getRequestURI();
            String path = uri.getPath();
            if (path.contains("addActor")) {
                nm.addActor(request);
                System.out.println("We have added the actor");
            }
            else if (path.contains("addMovie")) {
                nm.addMovie(request);
                System.out.println("We have added the movie");
            }
            else if (path.contains("addRelationship")) {
                nm.addRelationship(request);
                System.out.println("We have added the relationship");
            }
            else if (path.contains("getActor")) {
                nm.getActor(request);
                System.out.println("We got the actor");
            }
            else if (path.contains("getMovie")) {
                nm.getMovie(request);
                System.out.println("We got the movie");
            }
            else if (path.contains("hasRelationship")) {
                nm.hasRelationship(request);
                System.out.println("We have checked the relationship");
            }
            else if (path.contains("computeBaconNumber")) {
                nm.computeBaconNumber(request);
                System.out.println("We have found the Bacon number");
            }
            else if (path.contains("computeBaconPath")) {
                nm.computeBaconPath(request);
                System.out.println("We have found the Bacon path");
            }
            else
                sendString(request, "Unimplemented method\n", 501);
        } catch (Exception e) {
            e.printStackTrace();
            sendString(request, "Server error\n", 500);
        }

    }

    private void sendString(HttpExchange request, String data, int restCode)
            throws IOException {
        request.sendResponseHeaders(restCode, data.length());
        OutputStream os = request.getResponseBody();
        os.write(data.getBytes());
        os.close();
    }
}

