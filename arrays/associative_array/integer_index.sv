///   INTEGER INDEX:-
///    Associative arrays use integer keys (sparse arrays)
///    Only occupied indices consume memory
///    Syntax: type name[*] where * indicates any integer index

module sv;                                  // Declare a module named 'sv'
  int array_1[*];                           // Declare an associative array with integer index
                                            // int: 32-bit signed integer type (value type)
                                            // array_1: array name
                                            // [*]: asterisk indicates integer index type (any integer key)
  int index;                                // Declare integer variable to store index during iteration
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      $display("array_1=%0d",array_1.num()); // $display: print number of elements
                                            // array_1.num(): built-in method returns number of entries
                                            // Initially 0 (associative array starts empty)
                                            // %0d: format specifier for decimal
      array_1[1]=1;                         // Assign value 1 to index 1
                                            // array_1[1]: uses integer 1 as key
      array_1[2]=2;                         // Assign value 2 to index 2
                                            // array_1[2]: uses integer 2 as key
      array_1[4]=3;                         // Assign value 3 to index 4
                                            // array_1[4]: uses integer 4 as key (sparse - index 3 skipped)
      array_1[5]=4;                         // Assign value 4 to index 5
      array_1[7]=5;                         // Assign value 5 to index 7
                                            // array_1[7]: uses integer 7 as key (sparse - index 6 skipped)
      array_1[9]=6;                         // Assign value 6 to index 9
                                            // array_1[9]: uses integer 9 as key (sparse - index 8 skipped)
      $display("array_1=%0d",array_1.num()); // $display: print number of elements (should be 6)
                                            // array_1.num(): returns 6 after assignments
      foreach(array_1[i])                  // foreach loop: iterates through all occupied indices
                                            // i: index variable (automatically iterates through all keys)
                                            // Only iterates through indices that have been assigned
        $display("array_1[%0d]=%0d",i,array_1[i]); // Print each element
                                            // %0d: format specifier for decimal
                                            // i: current index (key)
                                            // array_1[i]: access value at index i
      array_1.first(index);                 // first(): method returns first (smallest) index
                                            // index: output parameter receives the first index value
                                            // Returns true if array not empty, false if empty
      $display("array_1[index]=%0d",index,array_1[index]); // Print first element
                                            // %0d: format specifier for decimal
                                            // index: contains first index (should be 1)
                                            // array_1[index]: access value at first index
      array_1.next(index);                  // next(): method returns next index after current
                                            // index: input/output parameter (current index becomes next index)
                                            // Returns true if next index exists, false if at end
      $display("array_1[index]=%0d",index,array_1[index]); // Print next element
                                            // index: contains next index (should be 2)
                                            // array_1[index]: access value at next index
      array_1.last(index);                  // last(): method returns last (largest) index
                                            // index: output parameter receives the last index value
                                            // Returns true if array not empty, false if empty
      $display("array_1[index]=%0d",index,array_1[index]); // Print last element
                                            // index: contains last index (should be 9)
                                            // array_1[index]: access value at last index
      array_1.prev(index);                  // prev(): method returns previous index before current
                                            // index: input/output parameter (current index becomes previous index)
                                            // Returns true if previous index exists, false if at beginning
      $display("array_1[index]=%0d",index,array_1[index]); // Print previous element
                                            // index: contains previous index (should be 7)
                                            // array_1[index]: access value at previous index
      array_1.delete();                     // delete(): removes all elements from associative array
                                            // array_1.num() becomes 0 after deletion
      $display("array_1=%0d",array_1.num()); // $display: print number of elements after deletion (should be 0)
                                            // array_1.num(): returns 0 after deletion
 
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration

 