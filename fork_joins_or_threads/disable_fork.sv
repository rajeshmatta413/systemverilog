///    DISABLE FORK:-
///    disable_fork terminates all child threads spawned by fork-join
///    Kills all active threads created in current fork-join block

module sv;                                  // Declare a module named 'sv'
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      fork                                  // fork: start parallel threads (concurrent execution)
                                            // fork: keyword begins a fork-join block
                                            // All statements inside execute concurrently
        begin                               // Begin keyword: starts first thread
          #10 $display($time,"im in1");   // #10: wait for 10 time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im in1": message string
                                            // Executes after 10 time units
        end                                 // End keyword: closes first thread
        begin                               // Begin keyword: starts second thread
          #20 $display($time,"im in2");   // #20: wait for 20 time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im in2": message string
                                            // Executes after 20 time units
        end                                 // End keyword: closes second thread
      join                                  // join: wait for all threads in fork-join block to complete
                                            // join: keyword ends fork-join block
                                            // Parent thread waits here until both threads finish
                                            // Continues only after both #10 and #20 threads complete
      disable fork;                         // disable fork: terminate all child threads
                                            // disable fork: system task kills all spawned threads
                                            // Terminates all threads created by fork-join block
                                            // Note: Threads already completed won't be affected
                                            // Note: This occurs after join, so threads already finished
        #10 $display($time,"im out1");    // #10: wait for 10 more time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im out1": message string
                                            // Executes after disable fork (at time 20+10=30)
        $finish;                            // $finish: system task that ends simulation
                                            // Terminates simulation immediately
                                            // Note: Code after $finish won't execute
        #20 $display($time,"im out2");    // #20: wait for 20 time units
                                            // $display: print message with time
                                            // Note: This code won't execute due to $finish above
        
        end                                 // End keyword: closes the sequential block
        endmodule                           // End of module declaration
