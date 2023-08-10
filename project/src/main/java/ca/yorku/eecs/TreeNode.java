package ca.yorku.eecs;

public class TreeNode<T>{
    private T data;
    private TreeNode<T> parent;

    public TreeNode(T data){
        this.data=data;
        this.parent=null;
    }

    public void setParent(TreeNode<T> parent){
        this.parent=parent;
    }

    public TreeNode<T> getParent(){
        return this.parent;
    }

    public T getData(){
        return data;
    }
}
