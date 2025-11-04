///   ARRAY REDUCTION METHODS: -
///    Reduction methods perform operations on all array elements
///    They return a single value representing the result of the operation

module sv;                                  // Declare a module named 'sv'
  int array_1[5];                           // Declare a fixed-size array of 5 integers
                                            // int: 32-bit signed integer type
                                            // [5]: array size (indices 0 to 4)
  int p;                                    // Declare integer variable to store reduction results
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      $display("array_1=%0p",array_1);    // $display: print array contents (before assignment)
                                            // %0p: format specifier for unpacked array
      array_1={1,2,3,4,5};                  // Concatenation assignment: {values}
                                            // {1,2,3,4,5}: assigns values to array elements
                                            // array_1[0]=1, array_1[1]=2, ..., array_1[4]=5
      $display("array_1=%0p",array_1);    // $display: print array contents (after assignment)

      p=array_1.sum();                      // sum(): reduction method calculates sum of all elements
                                            // Returns: 1+2+3+4+5 = 15
                                            // Assigns result to variable p
      $display("p=%0d",p);                // $display: print sum result
                                            // %0d: format specifier for decimal (0 removes leading zeros)

      p=array_1.sum() with (item*2);       // sum() with clause: applies transformation before summing
                                            // with (item*2): multiplies each element by 2 before summing
                                            // Returns: (1*2)+(2*2)+(3*2)+(4*2)+(5*2) = 2+4+6+8+10 = 30
                                            // item: keyword representing current array element
      $display("p=%0d",p);                // $display: print transformed sum result

      p=array_1.product();                  // product(): reduction method calculates product of all elements
                                            // Returns: 1*2*3*4*5 = 120
                                            // Multiplies all elements together
      $display("p=%0d",p);                // $display: print product result
            p=array_1.or();                 // or(): reduction method performs bitwise OR on all elements
                                            // Returns: 1|2|3|4|5 = bitwise OR of all elements
                                            // Performs bitwise OR operation across all array elements
      $display("p=%0d",p);                // $display: print bitwise OR result

      p=array_1.xor();                      // xor(): reduction method performs bitwise XOR on all elements
                                            // Returns: 1^2^3^4^5 = bitwise XOR of all elements
                                            // Performs bitwise XOR operation across all array elements
      $display("p=%0d",p);                // $display: print bitwise XOR result

      p=array_1.and();                      // and(): reduction method performs bitwise AND on all elements
                                            // Returns: 1&2&3&4&5 = bitwise AND of all elements
                                            // Performs bitwise AND operation across all array elements
      $display("p=%0d",p);                // $display: print bitwise AND result
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration

 