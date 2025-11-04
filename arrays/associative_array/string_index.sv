///   STRING INDEX:-
///    Associative arrays use string keys (like hash tables or dictionaries)
///    Only occupied indices consume memory
///    Syntax: type name[string] where string indicates string index type

module sv;                                  // Declare a module named 'sv'
  int array_1[string];                      // Declare an associative array with string index
                                            // int: 32-bit signed integer type (value type)
                                            // array_1: array name
                                            // [string]: string indicates string index type (any string key)
  string index;                             // Declare string variable to store index during iteration
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      $display("array_1=%0d",array_1.num()); // $display: print number of elements
                                            // array_1.num(): built-in method returns number of entries
                                            // Initially 0 (associative array starts empty)
                                            // %0d: format specifier for decimal
      array_1["a"]=1;                       // Assign value 1 to index "a"
                                            // array_1["a"]: uses string "a" as key
      array_1["b"]=2;                       // Assign value 2 to index "b"
                                            // array_1["b"]: uses string "b" as key
      array_1["c"]=3;                       // Assign value 3 to index "c"
      array_1["d"]=4;                       // Assign value 4 to index "d"
      array_1["e"]=5;                       // Assign value 5 to index "e"
      array_1["f"]=6;                       // Assign value 6 to index "f"
                                            // array_1["f"]: uses string "f" as key
      $display("array_1=%0d",array_1.num()); // $display: print number of elements (should be 6)
                                            // array_1.num(): returns 6 after assignments
      foreach(array_1[i])                  // foreach loop: iterates through all occupied indices
                                            // i: index variable (automatically iterates through all string keys)
                                            // Only iterates through indices that have been assigned
        $display("array_1[%0s]=%0d",i,array_1[i]); // Print each element
                                            // %0s: format specifier for string (0 removes formatting)
                                            // %0d: format specifier for decimal
                                            // i: current index (string key)
                                            // array_1[i]: access value at index i
      array_1.first(index);                 // first(): method returns first (lexicographically smallest) index
                                            // index: output parameter receives the first index value (string)
                                            // Returns true if array not empty, false if empty
      $display("array_1[index]=%0s",index,array_1[index]); // Print first element
                                            // %0s: format specifier for string
                                            // index: contains first index (should be "a")
                                            // array_1[index]: access value at first index
      array_1.next(index);                  // next(): method returns next index after current
                                            // index: input/output parameter (current index becomes next index)
                                            // Returns true if next index exists, false if at end
      $display("array_1[index]=%0s",index,array_1[index]); // Print next element
                                            // index: contains next index (should be "b")
                                            // array_1[index]: access value at next index
      array_1.last(index);                  // last(): method returns last (lexicographically largest) index
                                            // index: output parameter receives the last index value (string)
                                            // Returns true if array not empty, false if empty
      $display("array_1[index]=%0s",index,array_1[index]); // Print last element
                                            // index: contains last index (should be "f")
                                            // array_1[index]: access value at last index
      array_1.prev(index);                  // prev(): method returns previous index before current
                                            // index: input/output parameter (current index becomes previous index)
                                            // Returns true if previous index exists, false if at beginning
      $display("array_1[index]=%0s",index,array_1[index]); // Print previous element
                                            // index: contains previous index (should be "e")
                                            // array_1[index]: access value at previous index
      array_1.delete();                     // delete(): removes all elements from associative array
                                            // array_1.num() becomes 0 after deletion
      $display("array_1=%0d",array_1.num()); // $display: print number of elements after deletion (should be 0)
                                            // array_1.num(): returns 0 after deletion
 
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration

 