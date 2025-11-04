///   PRIORITY IF: -
///    priority if ensures at least one branch executes
///    Simulation error if all conditions are false and no else exists

module sv;                                  // Declare a module named 'sv'
  int a;                                    // Declare integer variable 'a' (32-bit signed integer)
  int b;                                    // Declare integer variable 'b' (32-bit signed integer)
  int c;                                    // Declare integer variable 'c' (32-bit signed integer)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      priority if(a>b)                      // priority if: ensures at least one branch executes
                                            // priority: keyword enforces that one condition must be true
                                            // if(a>b): condition checks if a is greater than b
                                            // If false, continues to else if
        $display("false");                 // $display: print message if condition is true
                                            // Outputs: "false"
                                            // Note: Message says "false" but executes when condition is true
      else if(b>c)                          // else if: alternative condition
                                            // else if(b>c): checks if b is greater than c
                                            // Only evaluated if previous condition (a>b) is false
                                            // If false, continues to else
        $display("false");                 // $display: print message if condition is true
                                            // Outputs: "false"
      else                                  // else: default branch (executes if all conditions false)
                                            // Guaranteed to execute if priority if is used
        $display("all are false");         // $display: print message
                                            // Outputs: "all are false"
                                            // Executes when both (a>b) and (b>c) are false
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
