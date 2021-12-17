/**
*Description: This program modified methods insert,contains,and toString in Red Black Tree
*Class: Fall - CS3345-003
*Project3: Red Black Tree
*Date: 10/22/2018
*@student  Yuan Zhuang
*@version 0.0.1
*/ 

import java.util.StringJoiner;  // to implement Node#toString() method
public class RedBlackTree<E extends Comparable<E>>  
{
   // Static inner class Red Black Tree Node 
   public static class Node<E extends Comparable<E>>
   {
       E element;      
       Node<E> leftChild;
       Node<E> rightChild;
       Node<E> parent;
       boolean color;
      
       public Node(E element, boolean color)
       {
           this.element = element;
           this.color = color;
       }

       public Node(E element)
       {
           this(element, RED);
       }
      
       public String toString()
       {
           if(color == RED)
               return "*" + this.element;  // asterisk character to indicate color is red
           else
               return "" + this.element;  // single space between two adjacent elements
       }
   } 
  
   // Create instance of the node and its colors
   private static boolean RED = false;
   private static boolean BLACK = true;
   private Node<E> root;
  
   // Constructor, set tree  root to null initially
   public RedBlackTree()
   {
       root = null;
   }
  
   /**
    * RedBlackTree Insert node method
    * @param element:E
    */
   
    // insert method implementation
   public boolean insert(E element)
   {
       if(element == null)
       {
           throw new NullPointerException("The given element is null, insert another value");
       }
      
       if(root == null)  // tree root always black
       {
           root = new Node<E>(element, BLACK);
           return true;
       }

       Node<E> newNode = new Node<E>(element);  // instance of new tree, initial as parent and current node
       Node<E> currentParent = root;
       Node<E> current = root;
       
       while(current != null)
       {
           currentParent = current;  // assign current node to parent node
          
           if(element.compareTo(current.element) < 0)  // binary tree algorithm, left always smaller, and right always bigger
           {
               current = current.leftChild;
           }
           else if(element.compareTo(current.element) > 0)
           {
               current = current.rightChild;
           }
           else
           {
               return false; // if element == current.element, then is duplicate and do nothing
           }
       }
      
       newNode.parent = currentParent;   // parent node instance
       
       if(element.compareTo(currentParent.element) < 0) // if insert element < parent's element
       {
           currentParent.leftChild = newNode;   // assign the node as the parents' left child
       }
       else  
       {
           currentParent.rightChild = newNode;  // if insert element > parent's element then assign to its parent's right child
       }

       Balance(newNode);  // balance and re-coloring the tree using balance method helper and 
       return true;
      
   } 

   /**
    * RedBlackTree contains method
    * @param object: Comparable<E>
    */
   
   public boolean contains(Comparable<E> object)  // always do object.compareTo and never do element.compareTo
   {
       if(object == null)
           return false;
       else
           return contains(root, object);   // contain method helper
   } 
 
   
   public String toString()
   {
     
       return toString(root);  // toString helper
   } 

   /**
    * RedBlackTree insertion method Balance helper
    * @param currentRoot: Node<E>
    */
   
   private void Balance(Node<E> currentRoot)
   {
       if(currentRoot.parent == null || currentRoot.parent.color == BLACK)  // not need balance
       {
           return;
       }
       
       Node<E> uncle = getUncle(currentRoot);  // instances Balance method getNeighbor helper 
      
       if(uncle != null && uncle.color == RED) // if uncle is red, change color of parent and uncle to black, color of grand parent is red
       {
    	   currentRoot.parent.color = BLACK;
    	   currentRoot.parent.parent.color = RED;
    	   uncle.color = BLACK;
           Balance(currentRoot.parent.parent); // repeat step
       }
       
       /*
        * left-left case : Right rotate, and swap colors of grand parent and parent
        * left-right case: Left rotate, and then apply same method of left left case
        * right-right case: Left rotate, and swap colors of grand parent and parent
        * right-left case: Right rotate, and then apply same method of right-right case
        */
       
       else if(currentRoot.parent == currentRoot.parent.parent.leftChild) // if is left-left case
       {
           if(currentRoot.parent.rightChild == currentRoot) // if is left-right case
           {
               leftRotation(currentRoot);  // then first left rotate the tree, and do the same method as left-left case
           }
          
           currentRoot.parent.color = BLACK;  // swap colors
           currentRoot.parent.parent.color = RED;
         
           rightRotation(currentRoot.parent); // right rotate
       }
       else  // else right-right case
       {
           if(currentRoot.parent.leftChild == currentRoot) // if is right-left case
           {
         
               rightRotation(currentRoot);// then right rotate first
           }
          
           currentRoot.parent.color = BLACK;  // swap color
           currentRoot.parent.parent.color = RED;
   
           leftRotation(currentRoot.parent);  // then left rotate
       }

       root.color = BLACK;
   }

   /**
    * RedBlackTree getNeighbor helper
    * @param currentRoot: Node<E>
    */
   
   private Node<E> getUncle(Node<E> currentRoot)
   {
       if(currentRoot.parent == null || currentRoot.parent.parent == null)  // doesn't have uncle
       {
           return null;
       }
      
       Node<E> currParent = currentRoot.parent;
       Node<E> grandParent = currParent.parent;

       if(currParent == grandParent.leftChild)  // if grand parent's left child is parent , then return grand parent's right child, which is uncle
       {
           return grandParent.rightChild;  
       }
       else
       {
           return grandParent.leftChild;
       }
   } 
   
   /**
    * RedBlackTree rightRotation helper
    * @param currentRoot: Node<E>
    */
   
   private void rightRotation(Node<E> currentRoot)  // rotation method same as AVL tree balance method
   {
       Node<E> current = currentRoot;
       Node<E> currentParent = current.parent;
       Node<E> grandParent = currentParent.parent;      
       Node<E> currentRight = current.rightChild;
      
       current.parent = grandParent;
       if(grandParent != null)
       {
           if(currentParent.parent.leftChild == currentParent)
               grandParent.leftChild = current;
           else
               grandParent.rightChild = current;
       }
       else
       {
           this.root = current;
       }

       current.rightChild = currentParent;
       currentParent.parent = current;
       currentParent.leftChild = currentRight;
      
       if(currentRight != null)
       {
           currentRight.parent = currentParent;
       }
   } 
  
   /**
    * RedBlackTree leftRotation helper
    * @param currentRoot: Node<E>
    */
   
   private void leftRotation(Node<E> currentRoot)   // rotation method same as AVL tree balance method
   {
       Node<E> current = currentRoot;
       Node<E> currentParent = currentRoot.parent;
       Node<E> grandParent = currentParent.parent;      
       Node<E> currentLeft = current.leftChild;
      
       current.parent = grandParent;
       if(grandParent != null)
       {
           if(currentParent.parent.leftChild == currentParent)
           {
               grandParent.leftChild = current;
           }
           else
           {
               grandParent.rightChild = current;
           }
       }
       else
       {
           this.root = current;
       }

       current.leftChild = currentParent;
       currentParent.parent = current;

       currentParent.rightChild = currentLeft;
       if(currentLeft != null)
       {
           currentLeft.parent = currentParent;
       }
   } 
  
   /**
    * RedBlackTree contains helper
    * @param currentRoot: Node<E>
    * @param object : Comparable<E>
    */
   
   private boolean contains(Node<E> currentRoot, Comparable<E> object)
   {
       if(currentRoot == null)
       {
           return false;
       }
       else if(object.compareTo(currentRoot.element) == 0) // if there is element equal, then the node contains the element
       {
           return true;
       }
       else if(object.compareTo(currentRoot.element) < 0)  // traverse to left if smaller, to right if bigger
       {
           return contains(currentRoot.leftChild, object);
       }
       else
       {
           return contains(currentRoot.rightChild, object);
       }
   } 
  
   /**
    * RedBlackTree toString helper
    * @param currentRoot: Node<E>
    */
   
   private String toString(Node<E> currentRoot)
   {
       if(currentRoot == null)
           return "";
      
       StringJoiner sj = new StringJoiner("\t");  // instances StringJoiner, joint the output with a space
              
       // toString traverse from tree's left,root,right  
       if(currentRoot.leftChild != null)
           sj.add(toString(currentRoot.leftChild));
      
       sj.add(currentRoot.toString());
      
       if(currentRoot.rightChild != null)
           sj.add(toString(currentRoot.rightChild));      
      
       return sj.toString();              
   } 
} 
