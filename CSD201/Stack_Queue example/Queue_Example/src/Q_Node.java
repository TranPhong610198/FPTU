
public class Q_Node {
    public Object info;
    public Q_Node  next;
    
    public Q_Node(Object x, Q_Node p)
      { info=x; next=p; }
    
    public Q_Node(Object x)
      { this(x,null); }
  };

