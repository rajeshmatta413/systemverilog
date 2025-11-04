///   UNIQUE IF: -
///    unique if ensures exactly one branch executes
///    Simulation error if multiple conditions are true simultaneously

module sv;                                  // Declare a module named 'sv'
  int a;                                    // Declare integer variable 'a' (32-bit signed integer)
  int b;                                    // Declare integer variable 'b' (32-bit signed integer)
  int c;                                    // Declare integer variable 'c' (32-bit signed integer)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      a=2;                                  // Assignment: assign value 2 to variable a
      b=7;                                  // Assignment: assign value 7 to variable b
      c=0;                                  // Assignment: assign value 0 to variable c
      unique if(a>b)                        // unique if: ensures exactly one branch executes
                                            // unique: keyword enforces that exactly one condition is true
                                            // if(a>b): condition checks if a is greater than b
                                            // a=2, b=7: condition is false (2>7 is false)
                                            // If false, continues to else if
        $display("a is greater than b");   // $display: print message if condition is true
                                            // Outputs: "a is greater than b"
                                            // Note: Won't execute because a=2 is not greater than b=7
      else if(b>c)                          // else if: alternative condition
                                            // else if(b>c): checks if b is greater than c
                                            // Only evaluated if previous condition (a>b) is false
                                            // b=7, c=0: condition is true (7>0 is true)
        $display("b is greater than c");   // $display: print message if condition is true
                                            // Outputs: "b is greater than c"
                                            // This branch executes (b=7 > c=0)
      else                                  // else: default branch (executes if all conditions false)
                                            // Only executes if both (a>b) and (b>c) are false
        $display("c is greater than a");   // $display: print message
                                            // Outputs: "c is greater than a"
                                            // Note: Won't execute because b>c is true
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
