/**
 * This program will convert max 32-bit binary number to decimal number.
 * CS4341-Assignment1
 * 1/31/2019
 * @author yxz15
 *
 */

import java.util.Scanner;

public class BinaryToDecimal {

	
	public static int DecimalConvert(String binary)
	{
		
		   String num = binary;
		   int len = num.length();
	       int decimal=0;
	      
	       
	       int base = 1; 

	       for (int i = len - 1; i >= 0; i--)  // catch the number from rightmost.
	        { 
	            if (num.charAt(i) == '1') 
	                decimal += base;
	            base = base * 2; 
	        } 
	      
	       return decimal;
		
	}
	

	
	
	public static void main(String[] args) {
		
		String binary;
		Scanner input = new Scanner(System.in);
		
		System.out.println("Please given a max 32 bit number");
		binary = input.nextLine();
		System.out.println("The decimal number after conversion is :"+DecimalConvert(binary));
		
		
		input.close();
		
	}

}



