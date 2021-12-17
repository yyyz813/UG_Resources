/**
 *  Name: Yuan Zhuang
 *  Class: CS3345
 *  Section: 003
 *  Semester: Fall 2018
 *  Project Number: 1
 *  Description:  This program using Sieve of Erotosthenes algorithm to calculate all prime number less than equal to a given integer n
 *  
 */

package Project1;
import java.util.Scanner;  // for keyboard scanner
public class SieveOfErotosthenes {	     
      boolean[] sof(int max)        
   {
	      // create a boolean array called blocks to initialize all the array elements to true
		  boolean[] blocks = new boolean[max + 1]; 
		  for (int i = 2; i < blocks.length; i++) // not using 1, since 1 is not prime
		  {
		      blocks[i] = true;
		  }	
		  
		// find prime under between 2 to n
		  int prime = 2;  
		  while (prime <= max)   
		  {
			  
		   crossOut(blocks, prime);	   // function prototype to cross off the 2i,3i,4i (actually i^2+i, i^2+2i ... and so on)
		   prime = nextPrime(blocks, prime);  // function prototype to find the next prime
		   
		   if (prime >= blocks.length)  
		    {
			break;   //  algorithm terminates if prime is >= n, can not be bigger than that
			}
		   }
      return blocks;  // return boolean array
    }
 
	   private void crossOut(boolean[] flags, int prime) 
   {
		   for (int i = prime * prime; i < flags.length; i = i + prime) 
		 {
		   flags[i] = false;    // set boolean value to false, to cross out the number
		 }
  }
 
	   private int nextPrime(boolean[] flags, int prime) 
   {
		    int next = prime + 1;   // search for the next integer 
		    while (next < flags.length && flags[next] == false) 
		    {
			  next++;  // if the number is already cross out, then we do not use it as the next prime
		    }
		    return next;  // return the next prime
   }
	
public static void main(String[] args)

{
	// validating and store value of n from user's input
	int n;
	Scanner input = new Scanner(System.in);
	do{
	     System.out.println("Enter a positive number you want to calculate");
	     while (!input.hasNextInt())
	     {
	    	 System.out.println("Invalid, Please input an integer");
	    	 input.next();
	     }
	     n = input.nextInt();
	} while (n<=0);
		
	// create new object a that can process function sof using number n	
	SieveOfErotosthenes a = new SieveOfErotosthenes();
	boolean[] array = a.sof(n);
	input.close();  // keyboard closed
	
	// printing out the prime number of n	
	System.out.println("The prime number for "+n+" are");
	for (int i=0; i<=n; i++)
	{
		if (array[i] == true)  // if the number is not cross out
		{
		System.out.println(i);
		}
	}
}
}


