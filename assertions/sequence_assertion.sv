///    SEQUENCE ASSERTION:-
///    Sequence assertions check temporal properties over multiple clock cycles
///    They use sequences and properties to verify design behavior

module sv;                                  // Declare a module named 'sv'
  bit clk;                                  // Declare a bit variable for clock signal
                                            // bit: 1-bit unsigned type (values 0 or 1)
  bit a,b;                                  // Declare two bit variables: a and b
                                            // bit: 1-bit unsigned type (values 0 or 1)
  always #2 clk=~clk;                       // always block: continuous process (runs forever)
                                            // #2: delay of 2 time units
                                            // clk=~clk: toggle clock (negation operator ~)
                                            // Creates clock with period of 4 time units (2 up, 2 down)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      #5 a=1;b=1;                           // #5: wait for 5 time units
                                            // a=1: assign value 1 to variable a
                                            // b=1: assign value 1 to variable b
      #5 a=0;b=1;                           // #5: wait for 5 more time units (total 10)
                                            // a=0: assign value 0 to variable a
                                            // b=1: keep b at 1
      
      #20 $finish;                          // #20: wait for 20 time units
                                            // $finish: system task that ends simulation
    end                                     // End keyword: closes the sequential block
  
  sequence seq1;                            // sequence: define a temporal sequence
                                            // seq1: sequence name
    @(posedge clk) (a && b);               // @(posedge clk): evaluate at clock rising edge
                                            // (a && b): condition (logical AND of a and b)
                                            // Sequence matches when condition is true at clock edge
  endsequence : seq1                        // End of sequence definition (seq1: label)

property prop_seq1;                         // property: define a property (can use sequences)
                                            // prop_seq1: property name
    seq1;                                   // seq1: reference the sequence defined above
                                            // Property checks if sequence seq1 matches
endproperty : prop_seq1                     // End of property definition (prop_seq1: label)

c1: assert property (prop_seq1);            // c1: assertion label
                                            // assert property: concurrent assertion (clocked)
                                            // (prop_seq1): property to check
                                            // Evaluates at every clock edge automatically
                                            // Reports pass/fail based on property evaluation
  
  
  sequence seq2;                            // sequence: define another temporal sequence
                                            // seq2: sequence name
    @(posedge clk) (a || b);               // @(posedge clk): evaluate at clock rising edge
                                            // (a || b): condition (logical OR of a and b)
                                            // Sequence matches when condition is true at clock edge
endsequence : seq2                          // End of sequence definition (seq2: label)

property prop_seq2;                         // property: define another property
                                            // prop_seq2: property name
    seq2;                                   // seq2: reference the sequence defined above
                                            // Property checks if sequence seq2 matches
endproperty : prop_seq2                     // End of property definition (prop_seq2: label)

c2: assert property (prop_seq2);            // c2: assertion label
                                            // assert property: concurrent assertion (clocked)
                                            // (prop_seq2): property to check
                                            // Evaluates at every clock edge automatically
  
  
  initial                                   // Another initial block: runs in parallel
    begin                                   // Begin keyword: starts a sequential block
      $dumpfile("dump.vcd");               // $dumpfile: system task specifies waveform file name
                                            // "dump.vcd": Value Change Dump file (VCD format)
                                            // Stores signal values for waveform viewer
      $dumpvars(1);                         // $dumpvars: system task enables signal dumping
                                            // (1): dump variables from current scope level
                                            // 1: dump only variables in current module (not submodules)
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration

 