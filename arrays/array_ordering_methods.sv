///   ARRAY ORDERING METHODS:-
///    Ordering methods rearrange array elements in place
///    They modify the original array and don't return values

module sv;                                  // Declare a module named 'sv'
  int array_1[5];                           // Declare a fixed-size array of 5 integers
                                            // int: 32-bit signed integer type
                                            // [5]: array size (indices 0 to 4)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      array_1={1,3,5,4,2};                 // Concatenation assignment: {values}
                                            // {1,3,5,4,2}: assigns values to array elements
                                            // array_1[0]=1, array_1[1]=3, array_1[2]=5, etc.
      $display("array_1=%0p",array_1);    // $display: print array contents (original order)
                                            // %0p: format specifier for unpacked array
      array_1.sort;                         // sort: ordering method sorts array in ascending order
                                            // Modifies array_1 in place: {1,2,3,4,5}
                                            // Rearranges elements from smallest to largest
      $display("array_1=%0p",array_1);    // $display: print array contents (after sort)
                                            // Should show: {1,2,3,4,5}
      array_1.rsort;                        // rsort: ordering method sorts array in descending order
                                            // Modifies array_1 in place: {5,4,3,2,1}
                                            // Rearranges elements from largest to smallest
      $display("array_1=%0p",array_1);    // $display: print array contents (after rsort)
                                            // Should show: {5,4,3,2,1}
      array_1.shuffle;                      // shuffle: ordering method randomly shuffles array elements
                                            // Modifies array_1 in place with random order
                                            // Randomly rearranges elements (order unpredictable)
      $display("array_1=%0p",array_1);    // $display: print array contents (after shuffle)
                                            // Order will be random
      array_1.reverse;                       // reverse: ordering method reverses array element order
                                            // Modifies array_1 in place, reversing the sequence
                                            // First becomes last, last becomes first
      $display("array_1=%0p",array_1);    // $display: print array contents (after reverse)
                                            // Should show reversed order
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
