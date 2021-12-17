/**
*Description: This program modified methods insert, LazyDeletion, findMin, findMax,contains,toString,height,size in BinarySearchTree 
*Class: Fall - CS3345-003
*Project3: BinarySearchTree
*Date: 10/09/2018
*@student  Yuan Zhuang
*@version 0.0.1
*/ 

public class LazyBinarySearchTree {

   private static final int MIN_KEY = 1;  //The valid set of keys is all integers in the range [1,99]
   private static final int MAX_KEY = 99;
   
   private class TreeNode {    // Inner Binary Tree class
       private int key;
       private TreeNode leftChild;
       private TreeNode rightChild;
       private boolean deleted;
       private int height;
       
       public TreeNode(int key) {  // Constructor
           this.key = key;
           this.leftChild = null;
           this.rightChild = null;
           this.deleted = false;
           this.height = 1;  // initial state
       }

       /**
        * key setter 
        * @param key
        */
       @SuppressWarnings("unused")
   	   public void setKey(int key) {
              this.key = key;
          }
       
       /**
        * Left child node setter
        * @param leftChild
        */
        public void setLeftChild(TreeNode leftChild) {
            this.leftChild = leftChild;
        }

        /**
        * Right child node setter
        * @param rightChild
        */
        public void setRightChild(TreeNode rightChild) {
            this.rightChild = rightChild;
        }

        /**
        * Whether the node is deleted or not setter
        * @param deleted
        */
        public void setDeleted(boolean deleted) {
            this.deleted = deleted;
        }

        /**
        * Node height setter
        * @param height
        */
        public void setHeight(int height) {
            this.height = height;
        }   
       
       /**
       * key getter
       * Returns the key
       */
       public int getKey() {
           return key;
       }

       /**
       * Left Child node getter
       */
       public TreeNode getLeftChild() {
           return leftChild;
       }

       /**
       * Right Child node getter
       */
       public TreeNode getRightChild() {
           return rightChild;
       }

       /**
        * Tree height getter
        */
        public int getHeight() {
            return height;
        }
        
       /**
       * Whether the node is deleted
       */
       public boolean isDeleted() {
           return deleted;
       }
       
       @Override
       public String toString() {
           return String.valueOf(this.key);  // value of method return the string representation of the passed argument
       }
   }

   // Define the instance  of the private tree node
   private TreeNode root;

   /**
   * Tree will be set initially to null
   */
   public LazyBinarySearchTree() {
       this.root = null;
   }

   /**
   * BinarySearchTree Insert method
   * @param currentNode  -- current position
   * @param key -- element insert to the node
   */
   private boolean insert(TreeNode currentNode, int key) {
       boolean logicalInsert = false;  // insert flag

       if (key < currentNode.getKey()) {  // if element is less than node.element
           if (currentNode.getLeftChild() != null)  // the tree left child is not empty
               logicalInsert = insert(currentNode.getLeftChild(), key);  // then insert the element to the left node
           else {
               currentNode.setLeftChild(new TreeNode(key)); // if the tree left child is empty, then create a new node store element value
               logicalInsert = true;  // insert successfully
           }

       } else if (key > currentNode.getKey()) {  // if element is greater than node.element
           if (currentNode.getRightChild() != null) // same process, but this time store the value at right node
               logicalInsert = insert(currentNode.getRightChild(), key);
           else {
               currentNode.setRightChild(new TreeNode(key));
               logicalInsert = true;
           }
       } else { // if the new element is not a duplicate of a non-deleted
    	       // element, but is a duplicate of a deleted element, then insert should ¡°undelete¡± the
    	      //deleted element in-place rather than physically inserting a new copy of the element.
    	   
           if (currentNode.isDeleted()) { 
               currentNode.setDeleted(false);  
               logicalInsert = true;
           } else
               logicalInsert = false;
       }

       // Update height
       currentNode.setHeight(1 + Math.max(height(currentNode.getLeftChild()), height(currentNode.getRightChild())));
       return logicalInsert;
   }

   /**
   * Inserts a node in the tree
   *
   * @param key
   *            - key to be added to the tree
   */
   public boolean insert(int key) throws IllegalArgumentException {
       // Check if key is within range
       if ((key < MIN_KEY) || (key > MAX_KEY))
           throw new IllegalArgumentException("Error in insert: IllegalArgumentException raised");

       if (this.root == null) {
           // If there are no nodes in the tree
           this.root = new TreeNode(key);

           return true;
       } else {
           // If there are nodes in the tree
           return insert(this.root, key);
       }
   }

   /**
   * Deletes a key from the tree
   *
   * @param currentNode
   *            - the current node in tree traversal
   * @param key
   *            - key to be searched
   */
   private boolean delete(TreeNode currentNode, int key) {
       boolean deleted = true;

       if (key < currentNode.getKey()) {
           if (currentNode.getLeftChild() != null)
               deleted = delete(currentNode.getLeftChild(), key);
           else
               deleted = false;

       } else if (key > currentNode.getKey()) {
           if (currentNode.getRightChild() != null)
               deleted = delete(currentNode.getRightChild(), key);
           else
               deleted = false;

       } else { // Key found
           // Check whether the node is deleted
           if (currentNode.isDeleted())
               deleted = false;
           else {
               // Set currentNode as deleted
               currentNode.setDeleted(true);
               deleted = true;
           }
       }

       return deleted;
   }

   /**
   * Deletes a key from the tree
   */
   public boolean delete(int key) throws IllegalArgumentException {
       // Check if key is within range
       if ((key < MIN_KEY) || (key > MAX_KEY))
           throw new IllegalArgumentException("Error in insert: IllegalArgumentException raised");

       // Check if root ins not null
       if (this.root != null)
           return delete(this.root, key);
       else
           return false;
   }

   /**
   * Checks whether a key exists in the tree and is non-deleted
   *
   * @param currentNode
   *            - the current node in tree traversal
   * @param key
   *            - key to be searched
   */
   private boolean contains(TreeNode currentNode, int key) {
       boolean found = true;

       if (key < currentNode.getKey()) {
           if (currentNode.getLeftChild() != null)
               found = contains(currentNode.getLeftChild(), key);
           else {
               found = false;
           }

       } else if (key > currentNode.getKey()) {
           if (currentNode.getRightChild() != null)
               found = contains(currentNode.getRightChild(), key);
           else {
               currentNode.setRightChild(new TreeNode(key));
               found = false;
           }
       } else { // Key found
           // Check whether the node is deleted
           if (currentNode.isDeleted())
               found = false;
           else
               found = true;
       }

       return found;
   }

   /**
   * Checks whether a key exists in the tree and is non-deleted
   */
   public boolean contains(int key) throws IllegalArgumentException {
       // Check if key is within range
       if ((key < MIN_KEY) || (key > MAX_KEY))
           throw new IllegalArgumentException("Error in contains: IllegalArgumentException raised");

       // Check if root is not null
       if (this.root != null)
           return contains(this.root, key);
       else
           return false;
   }

   /**
   * Returns the height of the tree
   */
   public int height() {
       return this.root.getHeight();
   }

   /**
   * Finds the minimum non-deleted element
   *
   * @return - the minimum non-deleted element, -1 if none exists
   */
   private int findMin(TreeNode node, int min) {
       if (node.getLeftChild() != null) {
           // Check if node is not deleted
           if (!node.isDeleted() && !node.getLeftChild().isDeleted())
               min = Math.min(node.getLeftChild().getKey(), min);

           return findMin(node.getLeftChild(), min);
       } else
           return min;
   }

   /**
   * Finds the minimum non-deleted element
   *
   * @return - the minimum non-deleted element, -1 if none exists
   */
   public int findMin() {
       // Check if root is not null
       if (this.root != null) {
           // Set root key as min
           int min = this.root.getKey();

           // Check if left child exists
           if (this.root.getLeftChild() != null)
               return findMin(this.root.getLeftChild(), min);
           else
               return min;
       }

       return -1;
   }

   /**
   * Finds the maximum non-deleted element
   *
   * @return - the maximum non-deleted element, -1 if none exists
   */
   private int findMax(TreeNode node, int max) {
       if (node.getRightChild() != null) {
           // Check if node is not deleted
           if (!node.isDeleted() && !node.getRightChild().isDeleted())
               max = Math.max(node.getRightChild().getKey(), max);

           return findMax(node.getRightChild(), max);
       } else
           return max;
   }

   /**
   * Finds the maximum non-deleted element
   *
   * @return - the maximum non-deleted element, -1 if none exists
   */
   public int findMax() {
       // Check if root is not null
       if (this.root != null) {
           // Set root key as max
           int max = this.root.getKey();

           // Check if right child exists
           if (this.root.getRightChild() != null)
               return findMax(this.root.getRightChild(), max);
           else
               return max;
       }

       return -1;
   }

   /**
   * Returns the count of elements in the tree,including deleted elements
   */
   private int size(TreeNode node, int count) {
       // Check if node is not null
       if (node != null) {
           count += 1;

           // Traverse left
           count = size(node.getLeftChild(), count);

           // Traverse right
           count = size(node.getRightChild(), count);
       }
       return count;
   }

   /**
   * Returns the count of elements in the tree,including deleted elements
   */
   public int size() {
       // Check if root is not null
       if (this.root != null) {
           return size(this.root, 0);
       }
       return 0;
   }

   /**
   * Returns the preorder traversal of the tree
   *
   * @param node
   *            - node of this tree
   * @param sb
   *            - holds the string representation of node(s)
   */
   public StringBuffer preorder(TreeNode node, StringBuffer sb) {
       if (node != null) {
           // Append key at node
           // Check if node is deleted
           if (node.isDeleted())
               sb.append("*" + node.getKey() + " ");
           else
               sb.append(node.getKey() + " ");

           // Traverse left
           preorder(node.getLeftChild(), sb);

           // Traverse right
           preorder(node.getRightChild(), sb);
       }

       return sb;
   }

   /**
   * Performs the preorder traversal of the tree
   *
   * @return - Returns a string containing the preorder traversal
   */
   public String toString() {
       StringBuffer sb = new StringBuffer();
       sb = preorder(this.root, sb);
       return sb.toString();
   }


/**
 * Returns the height of the node in the tree.
 *
 * @param node
 *            - tree node
 * @return - height of the node
 */
 private int height(TreeNode node) {
     // Check if node is null
     if (node == null)
         return 0;
     else
         return node.getHeight();
 }
 }