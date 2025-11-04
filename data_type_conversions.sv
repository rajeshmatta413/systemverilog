///  DATA TYPE CONVERSIONS: -
///    Type casting converts values from one data type to another
///    Syntax: type'(expression) where type is the target type

module sv;                                  // Declare a module named 'sv'
  int x;                                    // Declare integer variable 'x' (32-bit signed integer)
  real r;                                   // Declare real variable 'r' (64-bit floating point)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      r=2.09;                               // Assignment: assign floating point value 2.09 to r
      $display("r=%0f",r);                 // $display: print real value
                                            // %0f: format specifier for floating point (0 removes trailing zeros)
      x=int'(r);                            // Type casting: int'(r) converts real to integer
                                            // int': target type (32-bit signed integer)
                                            // (r): expression to convert
                                            // Truncates decimal part: 2.09 becomes 2
      $display("x=%0d",x);                 // $display: print converted integer value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration


module sv;                                  // Declare another module named 'sv' (separate example)
  int x;                                    // Declare integer variable 'x' (32-bit signed integer)
  real r;                                   // Declare real variable 'r' (64-bit floating point)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      r=2.09;                               // Assignment: assign floating point value 2.09 to r
      $display("r=%0f",r);                 // $display: print real value
                                            // %0f: format specifier for floating point (0 removes trailing zeros)
      x=bit'(r);                            // Type casting: bit'(r) converts real to single bit
                                            // bit': target type (1-bit unsigned, values 0 or 1)
                                            // (r): expression to convert
                                            // Non-zero becomes 1, zero becomes 0: 2.09 becomes 1
      $display("x=%0d",x);                 // $display: print converted bit value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration


module sv;                                  // Declare another module named 'sv' (separate example)
  int x;                                    // Declare integer variable 'x' (32-bit signed integer)
  real r;                                   // Declare real variable 'r' (64-bit floating point)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      r=2.09;                               // Assignment: assign floating point value 2.09 to r
      $display("r=%0f",r);                 // $display: print real value
                                            // %0f: format specifier for floating point (0 removes trailing zeros)
      x=byte'(r);                           // Type casting: byte'(r) converts real to byte
                                            // byte': target type (8-bit signed integer, range -128 to 127)
                                            // (r): expression to convert
                                            // Truncates decimal part: 2.09 becomes 2
      $display("x=%0d",x);                 // $display: print converted byte value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
