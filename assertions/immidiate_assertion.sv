///  IMMIDIATE ASSERTION:-
///    Immediate assertions check conditions at the current simulation time
///    They execute immediately when encountered (not clocked)

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
      #5 a=1;b=0;                           // #5: wait for 5 more time units (total 10)
                                            // a=1: keep a at 1
                                            // b=0: assign value 0 to variable b
      
      
      c1:@(posedge clk) assert(a&&b)       // c1: assertion label (name for this assertion)
                                            // @(posedge clk): event control (wait for clock rising edge)
                                            // assert: immediate assertion keyword
                                            // (a&&b): condition to check (logical AND of a and b)
                                            // Evaluates immediately at clock rising edge
        begin                               // Begin keyword: starts pass block
        $display("pass1");                 // $display: print message if assertion passes
                                            // Executes when condition (a&&b) is true
        end                                 // End keyword: closes pass block
      else                                  // else: optional failure block
        begin                               // Begin keyword: starts fail block
          $display("fail1");               // $display: print message if assertion fails
                                            // Executes when condition (a&&b) is false
        end                                 // End keyword: closes fail block
   
  
      c2:@(posedge clk) assert(a||b)        // c2: assertion label
                                            // @(posedge clk): wait for clock rising edge
                                            // assert: immediate assertion keyword
                                            // (a||b): condition to check (logical OR of a and b)
        begin                               // Begin keyword: starts pass block
        $display("pass2");                 // $display: print message if assertion passes
                                            // Executes when condition (a||b) is true
        end                                 // End keyword: closes pass block
      else                                  // else: optional failure block
        begin                               // Begin keyword: starts fail block
          $display("fail2");               // $display: print message if assertion fails
                                            // Executes when condition (a||b) is false
        end                                 // End keyword: closes fail block

      
      c3:@(posedge clk) assert(a^b)        // c3: assertion label
                                            // @(posedge clk): wait for clock rising edge
                                            // assert: immediate assertion keyword
                                            // (a^b): condition to check (logical XOR of a and b)
                                            // XOR: true when a and b differ, false when same
        begin                               // Begin keyword: starts pass block
        $display("pass3");                 // $display: print message if assertion passes
                                            // Executes when condition (a^b) is true
        end                                 // End keyword: closes pass block
      else                                  // else: optional failure block
        begin                               // Begin keyword: starts fail block
          $display("fail3");               // $display: print message if assertion fails
                                            // Executes when condition (a^b) is false
        end                                 // End keyword: closes fail block
  
      #20 $finish;                          // #20: wait for 20 time units
                                            // $finish: system task that ends simulation
                                            // Terminates simulation after 20 time units
    end                                     // End keyword: closes the sequential block
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

  
