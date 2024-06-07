class Node
  { public Object info;
    public Node  next;
    public Node(Object x, Node p)
      { info=x; next=p; }
    
    public Node(Object x)
      { this(x,null); }
  };

