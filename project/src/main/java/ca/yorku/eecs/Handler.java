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
            }
            else if (path.contains("addMovie")) {
                nm.addMovie(request);
            }
            else if (path.contains("addRelationship")) {
                nm.addRelationship(request);
            }
            else if (path.contains("getOscarActor")) {
                nm.getOscarActor(request);
            }
            else if (path.contains("getActor")) {
                nm.getActor(request);
            }
            else if (path.contains("getMovie")) {
                nm.getMovie(request);
            }
            else if (path.contains("hasRelationship")) {
                nm.hasRelationship(request);
            }
            else if (path.contains("computeBaconNumber")) {
                nm.computeBaconNumber(request);
            }
            else if (path.contains("computeBaconPath")) {
                nm.computeBaconPath(request);
            }
            else
                Utils.sendString(request, "Unimplemented method\n", 501);
        } catch (Exception e) {
            e.printStackTrace();
            Utils.sendString(request, "Server error\n", 500);
        }

    }
}


