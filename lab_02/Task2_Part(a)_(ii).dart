void main() {
  // Array of integers
  List<int> intArray = [0, 1, 2, 3, 4];

  // Set of strings
  Set<String> stringSet = {'apple', 'banana', 'cherry'};

  // Compare the length of the array and set
  if (intArray.length > stringSet.length) {
    // Appending zeros to the array to match the set count
    int elementsToRemove = intArray.length - stringSet.length;
    intArray.removeRange(intArray.length - elementsToRemove, intArray.length);
  }

  // Printing the modified array
  print("Modified Array: $intArray");
}