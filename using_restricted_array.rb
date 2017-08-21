require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.
# An unused space in the restricted array has the 'SPECIAL_VALUE'
SPECIAL_VALUE = 9999

## Calculates the length of the restricted integer array_size
# Time complexity = O(n) since all elements in the array will be visited once
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def length(array)
  i = 0
  while array[i] != nil
    i += 1
  end
  return i
end

# Prints each integer values in the array
# Time complexity = O(n) since all elements in the array will be visited once
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def print_array(array)
  i = 0
  while array[i] != nil
    print "#{array[i]} "
    i += 1
  end
  puts
end

# Reverses the values in the integer array
# Time complexity = O(n) since all elements in the array will be updated at most once
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def reverse(array, length) # Ruby
  return if length < 2 # if length is 0 or 1, nothing to reverse
  front_index = 0
  back_index = length-1
  while front_index < back_index
    # swap using temp variable
    temp = array[front_index]
    array[front_index] = array[back_index]
    array[back_index] = temp
    # increment front index, decrement back index
    front_index += 1
    back_index -= 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity = O(n) since all elements in the array will be visited once
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def search(array, length, value_to_find)
  length.times do |index|
    if array[index] == value_to_find
      return true
    end
  end

  return false # not found
end

# Implements selection sort
# Sorts the array in ascending order.
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end

# Restricted arrays cannot be resized. So, we follow a convention.
# Convention: change the value to be deleted with 'SPECIAL_VALUE'
# Deletes 'value_to_delete' if found in the array. To keep the array size
# constant, adds an element with 'SPECIAL_VALUE' in the end. Assumes the array
# to be sorted in ascending order.
# Time complexity = O(n) since all elements in the array will be visited.
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def delete(array, length, value_to_delete)
  length.times do |index|
    if (array[index] == value_to_delete) # value_to_delete found
      # defrag array
      while index+1 < length && array[index] != SPECIAL_VALUE
        array[index] = array[index+1]
        index += 1
      end
      array[index] = SPECIAL_VALUE
      # done defraging
      return
    end
  end
  # value_to_delete not found
end

# Restricted array cannot be resized. So, we workaround by having a convention
# Convention: replace all values with 'SPECIAL_VALUE'
# Empties the restricted array by making all values = SPECIAL_VALUE
# Time complexity = O(n) since all elements in the array will be updated once
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def empty(array, length)
  length.times do |index|
    array[index] = SPECIAL_VALUE
  end
end

# Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
# Assumes that the array is not sorted.
# Time complexity = O(n) since all elements in the array will be visited once.
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def find_largest(array, length)
  return -1 if length == 0 # special casing
  index = 0
  largest = array[index]
  while index+1 < length && array[index+1] != SPECIAL_VALUE
    index += 1
    if array[index] > largest
      largest = array[index]
    end
  end
  return largest
end

# Insert value to insert at the correct index into the array assuming the array
# is sorted in ascending manner.
# Restricted arrays cannot be resized. Insert only if there is space in the array.
# (Hint: if there are no elements with 'SPECIAL_VALUE', there is no room to insert)
# All subsequent elements will need to be moved forward by one index.
# Time complexity = O(n) since finding where to insert could take upto array length time
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def insert_ascending(array, length, value_to_insert)
  # we can't resize array. if there is no room to insert, return.
  return if array[length-1] != SPECIAL_VALUE

  insert_index_found = false
  length.times do |index|
    # find the index where value_to_insert should be inserted in ascening order
    if insert_index_found == false && array[index] > value_to_insert
      insert_index_found = true
      # found the index to insert at -> insert ascending
    end

    # once found, save value at index into temp, insert value_to_insert
    # update value_to_insert to be temp and continue down the array
    if insert_index_found == true
        # insert and move existing values one index forward for the rest of the array
        temp = array[index]
        array[index] = value_to_insert
        value_to_insert = temp
    end

    # if value_to_insert is SPECIAL_VALUE, we are done inserting
    if value_to_insert == SPECIAL_VALUE
      break
    end
  end
end

## --- END OF METHODS ---

# A restricted array could be constructed of a given size like so
size = 5
my_integer_array = RestrictedArray.new(size)
my_integer_array_length = length(my_integer_array)
puts "The length of my integer array is #{my_integer_array_length}, which should be the same as #{size}."
puts "BUG!" if my_integer_array_length != size
puts

# A restricted array could be constructed of a random size (1 to 20) like so
another_array = RestrictedArray.new()
another_array_length = length(another_array)
puts "The length of my random length, integer array is #{another_array_length}."
puts

# print the current array
print "Printing values in the array: "
print_array(another_array)
# reverse the values in the current array
reverse(another_array, another_array_length)
# prints the reversed array
print "Reversed array: "
print_array(another_array)
puts

# search for value_to_find in the array
value_to_find = 120
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
end
puts

# search for value_to_find in the array - find the last value
value_to_find = another_array[another_array_length-1]
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
  puts "BUG! #{value_to_find} should be at index #{another_array_length-1}"
end
puts

# print the largest value in the array
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# delete the first entry with the value_to_delete
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
puts

# delete the first entry with the value_to_delete
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
puts

# print the largest value in the array
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts

# empty array
empty(another_array, another_array_length)
print "Emptied array looks like: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts
