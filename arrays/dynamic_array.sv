///   DYNAMIC ARRAY:-
///    Dynamic arrays have size that can change during simulation
///    Syntax: type name[] - size is allocated at runtime using new[]

module sv;                                  // Declare a module named 'sv'
  int array_1[];                            // Declare a dynamic array (size not specified)
                                            // int: 32-bit signed integer type
                                            // array_1: array name
                                            // []: empty brackets indicate dynamic array (size unknown)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      $display("array_1=%0d",array_1.size()); // $display: print array size
                                            // array_1.size(): built-in method returns current size
                                            // Initially 0 (uninitialized dynamic array has size 0)
                                            // %0d: format specifier for decimal
      
      array_1= new[6];                      // new[6]: allocate memory for 6 elements
                                            // new[size]: constructor allocates specified size
                                            // array_1 now has size 6 (indices 0 to 5)
      $display("array_1=%0d",array_1.size()); // $display: print new array size (should be 6)
                                            // array_1.size(): returns 6 after allocation
      
      array_1='{1,2,3,4,5,6};              // Array literal assignment: assign values to all elements
                                            // '{1,2,3,4,5,6}: assigns values to array elements
                                            // array_1[0]=1, array_1[1]=2, ..., array_1[5]=6
      foreach(array_1[i])                  // foreach loop: iterates through all elements
                                            // i: index variable (automatically iterates 0 to size-1)
        $display("array_1[%0d]=%0d",i,array_1[i]); // Print each element
                                            // %0d: format specifier for decimal
                                            // array_1[i]: access element at index i
      array_1=new[20];                      // new[20]: reallocate memory for 20 elements
                                            // Previous data is lost, new size is 20
                                            // array_1 now has size 20 (indices 0 to 19)
      $display("array_1=%0d",array_1.size()); // $display: print new array size (should be 20)
                                            // array_1.size(): returns 20 after reallocation
      array_1.delete();                     // delete(): deallocates memory and makes array empty
                                            // array_1.size() becomes 0 after deletion
      $display("array_1=%0d",array_1.size()); // $display: print array size after deletion (should be 0)
                                            // array_1.size(): returns 0 after deletion
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
