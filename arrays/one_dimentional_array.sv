/// ONE DIMENSIONAL ARRAY:-
///    One-dimensional arrays store elements in a single row/column
///    Syntax: type name[size] where size is the number of elements

module sv;                                  // Declare a module named 'sv'
  int array_1[5];                           // Declare a fixed-size array of 5 integers
                                            // int: 32-bit signed integer type
                                            // array_1: array name
                                            // [5]: array size (indices 0 to 4)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      array_1='{2,28,9,37,3};               // Array literal assignment: '{values}'
                                            // '{2,28,9,37,3}: assigns values to array elements
                                            // array_1[0]=2, array_1[1]=28, array_1[2]=9, etc.
      $display("array_1=%0p",array_1);      // $display: print array contents
                                            // %0p: format specifier for unpacked array (0 removes formatting)
                                            // Prints all array elements
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
