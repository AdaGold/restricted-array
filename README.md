# Restricted-Array
Assignment: Develop common methods on data structure using a restricted array.
restricted_array.rb provides the RestrictedArray class to be used.
RestrictedArray allows you to:
1. Create an integer array of default size (i.e. 20) or of the size provided in the parameter.
   All integer values are randomly initialized in the range of 1-221.
2. Get the value at a given index.
3. Update the value at a given index.
None of the other methods available in the Ruby Array class are available in the RestrictedArray class.

## Exercise
Implement the methods in using_restricted_array.rb. Methods to implement are:
- *length* - which calculates the length of the integer array and returns it. Assume that all values are integers and the value of element past the array length is `nil`
- *print_array* - which prints each integer value separated by space on the same line
- *reverse* - which reverses the values in the array in place
- *search* - which looks for a given integer value in the array. Returns true if found, false otherwise.
- *sort* - which sorts the values in the array
- *delete* - restricted arrays cannot be resized. So, we follow a convention. 
             Following the convention of changing the value to be deleted to be some special-value, implement the delete method.
- *empty* - restricted array cannot be resized. So, we follow a convention. Convention: replace all values with 'SPECIAL_VALUE'.
- *find_largest* - Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
- *insert_ascending* - Insert value to insert at the correct index into the array assuming the array is sorted in ascending manner.
                       Restricted arrays cannot be resized. Insert only if there is space in the array.
                       Hint: If there are elements with 'SPECIAL_VALUE', there is no room to insert. All subsequent elements will need to be moved forward by one index.
