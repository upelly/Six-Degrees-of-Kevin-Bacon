package ca.yorku.eecs;

import java.util.*;

public class Graph<T> {

    private Map<T, Set<T>> graph;
    private Map<T, Boolean> visited;

    public Graph(){
        this.graph = new HashMap<>();
        this.visited = new HashMap<>();
    }

    public void addVertex(T vertex) {
        this.graph.put(vertex, (Set<T>) new HashSet<T>());
        this.visited.put(vertex, false);
    }

    public List<T> getAdjacent(T vertex) {
        return new ArrayList<>(graph.get(vertex));
    }

    public void addEdge(T fromVertex, T toVertex) {
        this.graph.get(fromVertex).add(toVertex);
        this.graph.get(toVertex).add(fromVertex);
    }

    public void setVisited(T vertex) {
        this.visited.replace(vertex, true);
    }

    public List<T> getVisited() {
        List<T> list = new ArrayList<T>();
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

    public List<T> findShortestPath(T start, T end){
        Queue<T> Q = new LinkedList<T>();
        this.reset();
        this.setVisited(start);
        Q.add(start);
        TreeNode<T> root = new TreeNode<T>(start);
        TreeNode<T> currentNode = root;
        while(Q.size()>0){
            T v = Q.remove();
            if(v.equals(end)){
                //return v - need to return the whole list
            }
            else{
                List<T> adjacent = this.getAdjacent(v);
                for(int i=0; i< adjacent.size(); i++){
                    if(!this.getVisited().contains(adjacent.get(i))){
                        setVisited(adjacent.get(i));
                        Q.add(adjacent.get(i));
                    }
                }
            }
        }
        return null;
    }
}
