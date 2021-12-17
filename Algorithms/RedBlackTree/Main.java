/**
*Description: This program to test the functions in the RBT
*Class: Fall - CS3345-003
*Project3: RedBlackTree
*Date: 10/23/2018
*@student  Yuan Zhuang
*@version 0.0.1
*/ 

// file reader. writer
import java.util.Scanner;   
import java.io.PrintWriter; 
import java.io.File;

// Exceptions
import java.io.FileNotFoundException;
import java.io.IOException;  // create new file


public class Main {

   private static final String INTEGER = "Integer";
   private static final String STRING = "String";
   private static final String INSERTION = "Insert:";
   private static final String PRINT_TREE = "PrintTree";
   private static final String CONTAINS = "Contains:";
   
  
    static String camelCase(boolean b) {  // Convert boolean value to camel case string method
        String value = String.valueOf(b);  // return the string representation of the boolean argument to assigned to value : String
        return Character.toUpperCase(value.charAt(0)) + value.substring(1); // Starting with the first, and from index 1 to the end all covert to upper-case
    }
    
   public static void main(String[] args) {
       if (args.length == 2) {  // check if argument is correct

    	   // read and write
           Scanner InputFile = null;
           PrintWriter writer= null;

           File OutFile = new File(args[1]);  // Create a output file
           try {

        	   InputFile = new Scanner(new File(args[0]));  // InputFile reading
               if (!OutFile.exists())   // if outFile is not exits then create a new one
                   OutFile.createNewFile();
               writer = new PrintWriter(OutFile); // open OutFile for writing
               
               RedBlackTree<Integer> treeI = new RedBlackTree<Integer>();  // instance of the red black tree that accept Integer element
               RedBlackTree<String> treeS = new RedBlackTree<String>();  // instance of the red black tree that accept String element
              
               
               while (InputFile.hasNextLine()) { // if file has next line, then
                   String line = InputFile.nextLine().trim(); // Read line with eliminated leading and trailing spaces
                   
                   //  determine the operations
                   
                   /*
                    *  have a problem with creating the generic type instance to implement the test driver
                    *  the case is only use when element is integer, but don't know how to do with String
                    */
                   
                   if (line.indexOf(INTEGER) == 0 || line.indexOf(STRING) != 0 )
                   {
                	   System.out.println("Only works on Object Intergers and Strings");
                   }
                   
                   if (line.indexOf(INSERTION) == 0){ // when is line first index[0] consist with INSERTION, then do insertion operation

                	   // substring method return the string which located after " insert :"
                       int key = Integer.parseInt(line.substring(line.indexOf(INSERTION) + INSERTION.length())); // get key value
                       try {
                    	   writer.println(camelCase(treeI.insert(key)));   // convert boolean value to camel-case string. and write to the file (0-False,1-True)
                       } catch (IllegalArgumentException i) {
                    	   writer.println(i.getMessage());    // write exception if there are illegal argument
                       }
                   } 
                             
                   else if (line.indexOf(CONTAINS) == 0) { // Get result if tree contains specific key
                       int key = Integer.parseInt(line.substring(line.indexOf(CONTAINS) + CONTAINS.length()));  //get key
                       try {
                    	   writer.println(camelCase(treeI.contains(key)));
                       } catch (IllegalArgumentException i) {
                    	   writer.println(i.getMessage());
                       }
                   } 
                   
                   else if (line.indexOf(PRINT_TREE) == 0) { // Print Tree operation
                	   writer.println(treeI);
                   } 
              
                   else
                	   writer.println("Error in Line: " + line); // all the other cases will return error massage
               }
              
               InputFile.close();  // file close
               writer.close();
               System.out.println("Red Black Tree Insertion operation is done, the output are written to file: " + args[1]);

           } catch (FileNotFoundException fnf) {
               System.out.println(fnf.getMessage());
           } 
           catch (IOException ioe) {
               System.out.println(ioe.getMessage());
           } 
       } 
   }
}