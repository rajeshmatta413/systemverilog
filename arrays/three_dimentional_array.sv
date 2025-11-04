///   THREE DIMENSIONAL ARRAY:-
///    Three-dimensional arrays store elements in depth, rows, and columns (cube)
///    Syntax: type name[depth][rows][columns]

module sv;                                  // Declare a module named 'sv'
  int array_1[2][2][2];                    // Declare a 2x2x2 three-dimensional array
                                            // int: 32-bit signed integer type
                                            // array_1: array name
                                            // [2][2][2]: 2 depths, 2 rows, 2 columns (indices 0-1 for each)
  int array_2[6];                           // Declare a one-dimensional array of 6 integers
                                            // [6]: array size (indices 0 to 5)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      array_1='{'{'{2,4},'{3,4}},'{'{9,8},'{7,8}}}; // Nested array literal for 3D array
                                            // Triple nested braces: depth, row, column
                                            // First depth: array_1[0][0][0]=2, array_1[0][0][1]=4, etc.
                                            // Second depth: array_1[1][0][0]=9, array_1[1][0][1]=8, etc.
      $display("array_1=%0p",array_1);    // $display: print entire 3D array
                                            // %0p: format specifier for unpacked array
      foreach(array_1[i,j,k])              // foreach loop: iterates through all elements of 3D array
                                            // i: depth index variable
                                            // j: row index variable
                                            // k: column index variable
                                            // Automatically iterates through all valid indices
      $display("array_1[%0d][%0d][%0d]=%0d",i,j,k,array_1[i][j][k]); // Print each element
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // array_1[i][j][k]: access element at depth i, row j, column k
      array_2='{2,3,4,5,6,7};              // Array literal assignment for 1D array
                                            // '{2,3,4,5,6,7}: assigns values to array elements
      $display("array_2=%0p",array_2);    // $display: print entire 1D array
                                            // %0p: format specifier for unpacked array
      foreach(array_2[i])                  // foreach loop: iterates through all elements of 1D array
                                            // i: index variable (automatically iterates 0 to size-1)
        $display("array_2[%0d]=%0d",i,array_2[i]); // Print each element
                                            // %0d: format specifier for decimal
                                            // array_2[i]: access element at index i
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
