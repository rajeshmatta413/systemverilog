///   TWO DIMENSIONAL ARRAY:-
///    Two-dimensional arrays store elements in rows and columns (matrix)
///    Syntax: type name[rows][columns]

module sv;                                  // Declare a module named 'sv'
  int array_1[2][2];                       // Declare a 2x2 two-dimensional array
                                            // int: 32-bit signed integer type
                                            // array_1: array name
                                            // [2][2]: 2 rows and 2 columns (indices 0-1 for each dimension)
  int array_2[4];                           // Declare a one-dimensional array of 4 integers
                                            // [4]: array size (indices 0 to 3)
  
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      array_1='{'{2,1},'{1,2}};            // Nested array literal assignment for 2D array
                                            // '{'{2,1},'{1,2}}: assigns values row by row
                                            // First row: array_1[0][0]=2, array_1[0][1]=1
                                            // Second row: array_1[1][0]=1, array_1[1][1]=2
      $display("array_1=%0p",array_1);    // $display: print entire 2D array
                                            // %0p: format specifier for unpacked array
      foreach(array_1[i,j])                // foreach loop: iterates through all elements of 2D array
                                            // i: row index variable
                                            // j: column index variable
                                            // Automatically iterates through all valid indices
        $display("array_1[%0d][%0d]=%0d",i,j,array_1[i][j]); // Print each element
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // array_1[i][j]: access element at row i, column j
      array_2='{2,3,4,5};                  // Array literal assignment for 1D array
                                            // '{2,3,4,5}: assigns values to array elements
      $display("array_2=%0p",array_2);    // $display: print entire 1D array
                                            // %0p: format specifier for unpacked array
      foreach(array_2[i])                  // foreach loop: iterates through all elements of 1D array
                                            // i: index variable (automatically iterates 0 to size-1)
        $display("array_2[%0d]=%0d",i,array_2[i]); // Print each element
                                            // %0d: format specifier for decimal
                                            // array_2[i]: access element at index i
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
