import random
import time
def main():
     array=[]
     # Create list of random numbers without repetition, This also use as array with random order
     size=int(input('Please enter array size n'))
     for j in range(size):
         array.append(random.randint(0,1000000)) # generate n random numbers and assign into array
     print('The array created is',*array)
     switch=int(input('Enter 1 if you want ascending order array, 2 for descending order array, and 3 for random order array'))

     if switch == 1:
         array.sort()  # Sort array in ascending order

     elif switch == 2:
         array.sort(reverse=True)  # Sort array in descending order

     elif switch == 3:
         print('The original array is random array')

     else:
         print('Invalid Number')
         # The original array is random array
         # Calculating execution time for Insertion Sort

     # Insertion Sort
     start_time = time.time()
     InsertionSort(array)
     end_time = time.time()
     total_time = end_time - start_time
     print('Total execution time for insertion sort is :', format(total_time, '.10f'))


     # Merge Sort
     start_time = time.time()
     MergeSort(array)
     end_time = time.time()
     total_time = end_time - start_time
     print('Total execution time for merge sort is :', format(total_time, '.10f'))


def InsertionSort(arr):

    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1  # let j be -1 index of i
        while j >= 0 and key < arr[j]:
            arr[j + 1] = arr[j]  #swith the position of arr[i],arr[j]
            j -= 1
        arr[j + 1] = key


def MergeSort(arr):

    if len(arr) > 1:
        mid = len(arr) // 2  #Divide array into two halves
        L = arr[:mid]
        R = arr[mid:]

        MergeSort(L)  # Recursive call
        MergeSort(R)

        i = j = k = 0
        while i < len(L) and j < len(R):  #Sort each of two halves
            if L[i] < R[j]:
                arr[k] = L[i]
                i += 1
            else:
                arr[k] = R[j]
                j += 1
            k += 1

        while i < len(L):     # Check the leftover
            arr[k] = L[i]
            i += 1
            k += 1

        while j < len(R):
            arr[k] = R[j]
            j += 1
            k += 1
main()


#######################################################################
# As the result shows, for case 1 -- Ascending order array
#                      Time(insertion sort)         (merge sort)
# when n=100               0.0000000000             0.0000000000
#      n=1000              0.0000000000             0.0049843788
#      n=10000             0.0040056705             0.0598380566
#      n=100000            0.0348467827             0.8992619514
#-----------------------------------------------------------------------
#######################################################################
# As the result shows, for case 1 -- Descending order array
#                      Time(insertion sort)         (merge sort)
# when n=100               0.0000000000             0.0000000000
#      n=1000              0.1107733250             0.0039522648
#      n=10000            12.1478347778             0.0728659630
#      n=100000        Take time to calculate      0.8277332783
#------------------------------------------------------------------------
# As the result shows, for case 1 -- Random order array
#                      Time(insertion sort)         (merge sort)
# when n=100               0.0000000000             0.0000000000
#      n=1000              0.0578470230             0.0049843788
#      n=10000             6.1165993214             0.0548593998
#      n=100000      Take time to calculate         0.9505400658
#
# Some run time is too large to calculate with my laptop, because it can
# be rising in exponential rate.
##########################################################################