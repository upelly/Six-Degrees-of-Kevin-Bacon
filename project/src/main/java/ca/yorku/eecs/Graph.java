package ca.yorku.eecs;

import java.util.*;

public class Graph {

    private Map<String, Set<String>> graph;
    private Map<String, Boolean> visited;
    private List<String> edgesA;
    private List<String> edgesB;

    public Graph(){
        this.graph = new HashMap<>();
        this.visited = new HashMap<>();
        edgesA = new ArrayList<>();
        edgesB = new ArrayList<>();
    }

    public void addVertex(String vertex) {
        this.graph.put(vertex, new HashSet<>());
        this.visited.put(vertex, false);
    }

    public List<String> getAdjacent(String vertex) {
        return new ArrayList<>(graph.get(vertex));
    }

    public void addEdge(String fromVertex, String toVertex) {
        this.graph.get(fromVertex).add(toVertex);
        this.graph.get(toVertex).add(fromVertex);
        edgesA.add(fromVertex);
        edgesB.add(toVertex);
    }

    public void setVisited(String vertex) {
        this.visited.replace(vertex, true);
    }

    public List<String> getVisited() {
        List<String> list = new ArrayList<String>();
        this.visited.forEach((k, v) -> {
            if(v) {
                list.add(k);
            }
        });
        return list;
    }

    public void reset() {
        this.visited.forEach((k, v) -> v=false);
    }

    private TreeNodeGraph nodeCopy(){
        TreeNodeGraph copy = new TreeNodeGraph();
        this.graph.forEach((k, v) -> copy.addVertex(new TreeNode<String>(k)));
        //copy edges over as well
        for(int i=0; i<edgesA.size(); i++){
            copy.addEdge(copy.findNode(edgesA.get(i)), copy.findNode(edgesB.get(i)));
        }
        return copy;
    }

    public List<String> findShortestPath(String start, String end){
        TreeNodeGraph copyGraph = nodeCopy();
        Queue<TreeNode<String>> Q = new LinkedList<>();
        this.setVisited(start);
        Q.add(copyGraph.findNode(start));
        List<String> returnlist = new ArrayList<>();

        while(!Q.isEmpty()){
            TreeNode<String> v = Q.remove();
            if(v.equals(copyGraph.findNode(end))){
                //return v - need to return the whole list leading to the shortest path
                returnlist.add(v.getData());
                while(v.getParent()!=null){
                    v=v.getParent();
                    returnlist.add(v.getData());
                }
                return returnlist;
            }
            else{
                List<String> adjacent = this.getAdjacent(v.getData());
                for(String t: adjacent){
                    if(!this.getVisited().contains(t)){
                        setVisited(t);
                        copyGraph.findNode(t).setParent(v);
                        Q.add(copyGraph.findNode(t));
                    }
                }
            }
        }

        return returnlist;
    }
}
