// Program #1


function EvenOdd(num) {
// Weather the number is not an integer
if (isNaN(num)) {
return "Not a valid number";
}
// Even number
else if (num === 0) {
return "Even";
}
// Odd number
else if (num === 1) {
return "Odd";
}
//Recursive call the function EvenOdd
else {
return (EvenOdd(num - 2));
}
}


// Program #2

function MyMathFunction(a,b,operation) { 
if(operation == "Add") { 
return a + b; 
}
else if(operation == "Subtract"){ 
return a - b; 
}
else if(operation == "Multiply"){
return a * b; 
}
else if(operation == "Divide"){ 
if(b == 0){
return "Cannot Divide by 0!"; 
}
else {
return a/b; 
}
}
} 

// Won't pass the argument as string.
var Add="Add",Subtract = "Subtract",Multiply="Multiply",Divide= "Divide";


// Program #3


function SortMyArray(array)  // Function bubble sort.
{
if(array.length<1)
{
return("Cannot sort an Empty Array!");  // return if array is empty.
}
for(var i =0;i<array.length;i++)
{
for(var j= 0;j<(array.length-i-1);j++)
{
if(array[j]>array[j+1])
{
var temp = array[j];
array[j] = array[j+1];
array[j+1] = temp;
}
}
}
return array;
}


// Program #4


function myFib(n) {
// Check if the argument is not a number
if(isNaN(n)){
return "Not an integer value!";  // test console like console.log(myFib(“hello”));
}

if(n === parseInt(n,10)){ // Check if n is not an integer.
if (n <= 1){  // if fib is 0 or 1, return 3 as base case.
return 3;
}
// else then call the myFib recursively by math formular
else{
return myFib(n-1) + myFib(n-2);
}
}
else  
return "Not an integer value!";
}








