package ca.yorku.eecs;

import java.util.*;

public class TreeNodeGraph {
    private Map<TreeNode<String>, Set<TreeNode<String>>> graph;
    private Map<TreeNode<String>, Boolean> visited;

    public TreeNodeGraph(){
        this.graph = new HashMap<>();
        this.visited = new HashMap<>();
    }

    public void addVertex(TreeNode<String> vertex) {
        this.graph.put(vertex, new HashSet<>());
        this.visited.put(vertex, false);
    }

    public void addEdge(TreeNode<String> fromVertex, TreeNode<String> toVertex) {
        this.graph.get(fromVertex).add(toVertex);
        this.graph.get(toVertex).add(fromVertex);
    }

    public TreeNode<String> findNode(String value){
        for(TreeNode<String> item : graph.keySet()){
            if(item.getData().equals(value)){
                return item;
            }
        }
        return null;
    }
}
