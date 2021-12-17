import random
import time


def main():
    array = []
    # Create list of random numbers without repetition, This also use as array with random order
    size = int(input('Please enter array size n'))
    for j in range(size):
        array.append(random.randint(0, 11000))  # generate n random numbers and assign into array
    print('The array created is', *array)

    start_time = time.time()   # Measure the time for quick sort in different size
    quicksort(array,0,len(array)-1)
    end_time = time.time()
    total_time = end_time - start_time
    print('Total execution time for insertion sort is :', format(total_time, '.10f'))

    print('The array after RandomQuickSort is', *array)


def quicksort(arr, p, r):
    if (p < r):

        pivot = randpartition(arr, p, r) # General random pivot inside index

        quicksort(arr, p, pivot- 1) # Recursive call
        quicksort(arr, pivot + 1, r)

def randpartition(arr, p, r):

    randpivot = random.randrange(p, r)

    arr[p], arr[randpivot] = arr[randpivot], arr[p]  # Swap first element in the array with pivot value
    return partition(arr, p, r)


def partition(arr, p, r):
    pivot = p
    i = p + 1  # partition starts from i
    for j in range(p + 1, r + 1):

        if arr[j] <= arr[pivot]:
            arr[i], arr[j] = arr[j], arr[i]  # Shift element to left side of partition if it is <= pivot value.
            i = i + 1
    arr[pivot], arr[i - 1] = arr[i - 1], arr[pivot]
    pivot = i - 1
    return (pivot)

main()
