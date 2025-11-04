///   UNPACKED ARRAY:-
///    Unpacked arrays store elements separately (not packed into bits)
///    More memory efficient for accessing individual elements
///    Syntax: type name[size] - standard array declaration

module sv;                                  // Declare a module named 'sv'
  int array_1[10];                          // Declare an unpacked array of 10 integers
                                            // int: 32-bit signed integer type
                                            // array_1: array name
                                            // [10]: array size (indices 0 to 9)
                                            // Unpacked: each element stored separately in memory
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      array_1='{1,2,3,4,5,6,7,8,9,0};      // Array literal assignment: '{values}'
                                            // '{1,2,3,4,5,6,7,8,9,0}: assigns values to array elements
                                            // array_1[0]=1, array_1[1]=2, ..., array_1[9]=0
      $display("array_1=%0p",array_1);    // $display: print array contents
                                            // %0p: format specifier for unpacked array (0 removes formatting)
                                            // Prints all array elements
      foreach(array_1[i])                  // foreach loop: iterates through all elements
                                            // i: index variable (automatically iterates 0 to size-1)
        $display("array_1[%0d]=%0d",i,array_1[i]); // Print each element
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // array_1[i]: access element at index i
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
