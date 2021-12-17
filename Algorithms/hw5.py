import random
import time


def main():
    array = []
    # Create list of 1000 element array.
    size = 1000
    for j in range(size):
        array.append(random.randint(0, 999))  # generate n random numbers and assign into array
    switch = int(input('Enter 1 if you want ascending order array, 2 for descending order array, and 3 for random order array'))


    if switch == 1:
        array.sort()  # Sort array in ascending order

    elif switch == 2:
        array.sort(reverse=True)  # Sort array in descending order

    elif switch == 3:
        print('The original array is random array')

    else:
        print('Invalid Number')

    print('The array created is', *array)

    # Counting sort
    start_time = time.time()   # Measure the time for quick sort in different size
    CountingSort(array)                   # Counting sort algorithm
    end_time = time.time()
    total_time = end_time - start_time
    print('Total execution time for Counting sort is :', format(total_time, '.10f'))

    # Radix sort
    start_time = time.time()  # Measure the time for quick sort in different size
    RadixSort(array)  # Counting sort algorithm
    end_time = time.time()
    total_time = end_time - start_time
    print('Total execution time for Radix sort is :', format(total_time, '.10f'))

    # Buket sort
    start_time = time.time()  # Measure the time for quick sort in different size
    BucketSort(array)  # Counting sort algorithm
    end_time = time.time()
    total_time = end_time - start_time
    print('Total execution time for Bucket sort is :', format(total_time, '.10f'))

def CountingSort(arr):

    n = len(arr)
    C = [None] * n  # New an array called C with None stored in each array index.
    for i in range(n):
        count1 = 0  # Set two indexes to count
        count2 = 0
        for j in range(n):
            if arr[j] < arr[i]:  # Count how many array elements are smaller than arr[i]
                count1 += 1
            elif arr[j] == arr[i]:  # Count how many array elements are equal to arr[i]
                count2 += 1
        for k in range(count1, count1 + count2):
            C[k] = arr[i]
    print('The sorted array after counting sort is', *C)

def RadixSort(arr):

    init = 0  # Start sorting from least significant digit.
    digit = 1  # the minimum number starts from 1 for least significant digit.

    maxValue = max(arr)
    while maxValue > 10 ** digit:  # Find how many digits the max value in the array has.
        digit += 1
    while init < digit:
        bucket = {}  # create bucket
        for x in range(10):
            bucket.setdefault(x, [])  # empty each bucket, and start sorting again.
        for x in arr:
            index = int((x / (10 ** init)) % 10)  # get radix for each elements
            bucket[index].append(x)  # Put number radix to each bucket radix index
        j = 0
        for k in range(10):
            if len(bucket[k]) != 0:  # Get elements from the bucket
                for y in bucket[k]:
                    arr[j] = y
                    j += 1
        init += 1
    print('The sorted array after counting sort is', *arr)

def BucketSort(arr):

    C = []  # Array C store sorted array
    maxValue = max(arr)  # Choose the maximum number in the array
    bucket = [0] * (maxValue + 1)  # New an bucket array which all the elements are 0.

    for i in arr:   # Fill the bucket with element in array
        bucket[i] += 1

    for j in range(len(bucket)):   # Take out element from bucket
        if bucket[j] != 0:
            for y in range(bucket[j]):
                C.append(j)

    print('The sorted array after counting sort is', *C)

main()


#########################################################################################

# With 1000 elements from [0,999], which already sorted in ascending order
# The running time for counting sort is 0.2253966331
#                         radix sort is 0.0059852600
#                        bucket sort is 0.0059840679
#

# With 1000 elements from [0,999], which already sorted in descending order
# The running time for counting sort is 0.2393739223
#                         radix sort is 0.0059850216
#                        bucket sort is 0.0090165138


# With 1000 elements from [0,999], which is randomly ordered
# The running time for counting sort is 0.2583067417
#                         radix sort is 0.0099735260
#                        bucket sort is 0.0045399666

# From the running time we got, it's easy to find that counting sort always takes longer time than Radix and Bucket sort.
# Radix sort shows nearly equal time with ascending and descending ordered array, but doubled when array is randomly ordered
# Bucket sort doing good with ascending and randomly ordered array, but with descending array it takes nearly double time.

##############################################################################################