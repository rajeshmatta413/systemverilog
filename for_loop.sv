///    FOR LOOP:-
///    For loops provide iterative execution with initialization, condition, and increment

module sv;                                  // Declare a module named 'sv'
  int i;                                    // Declare integer variable 'i' (32-bit signed integer)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      for(int i=0; i<10;i++)               // for loop: three-part control structure
                                            // int i=0: initialization (declare and initialize loop variable)
                                            // i<10: condition (continue while i is less than 10)
                                            // i++: increment (increment i by 1 after each iteration)
                                            // Loop executes 10 times (i = 0 to 9)
        $display("i=%0d",i);                // $display: print loop variable value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // Executes in each iteration
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration

module sv;                                  // Declare another module named 'sv' (separate example)
  int i,j;                                  // Declare two integer variables: i and j
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      for(i=0,j=10;i<10;i++,j--)           // for loop: multiple initializations and increments
                                            // i=0: initialize i to 0
                                            // j=10: initialize j to 10 (comma separates multiple statements)
                                            // i<10: condition (continue while i is less than 10)
                                            // i++: increment i by 1 after each iteration
                                            // j--: decrement j by 1 after each iteration
                                            // Loop executes 10 times (i = 0 to 9, j = 10 to 1)
        $display("i=%0d,j=%0d",i,j);       // $display: print both loop variables
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // Executes in each iteration
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
