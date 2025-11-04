///    PROGRAM BLOCK:-
///    Program blocks are used to separate testbench code from design code
///    They provide a clear separation and ensure proper simulation semantics

program rajesh;                              // Declare a program block named 'rajesh'
  int a;                                     // Declare an integer variable 'a' (32-bit signed integer)
  int b;                                     // Declare an integer variable 'b' (32-bit signed integer)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      a=90;                                 // Assignment: assign value 90 to variable 'a'
      b=30;                                 // Assignment: assign value 30 to variable 'b'
      #2 $display($time,"a=%0d,b=%0d",a,b); // #2: wait for 2 time units
                                            // $display: display function (prints to console)
                                            // $time: system task that returns current simulation time
                                            // %0d: format specifier for decimal number (0 removes leading zeros)
                                            // Print: time, a, and b values
    end                                     // End keyword: closes the sequential block
endprogram                                  // End of program block declaration
