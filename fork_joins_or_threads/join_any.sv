///     JOIN ANY:-
///    join_any waits for any one thread in fork-join block to complete
///    Parent continues after first thread completes (doesn't wait for all)

module sv;                                  // Declare a module named 'sv'
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      fork                                  // fork: start parallel threads (concurrent execution)
                                            // fork: keyword begins a fork-join block
                                            // All statements inside execute concurrently
        begin                               // Begin keyword: starts first thread
          #10 $display($time,"im one");   // #10: wait for 10 time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im one": message string
                                            // Executes after 10 time units
        end                                 // End keyword: closes first thread
        begin                               // Begin keyword: starts second thread
          #20 $display($time,"im two");   // #20: wait for 20 time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im two": message string
                                            // Executes after 20 time units
        end                                 // End keyword: closes second thread
      join_any                              // join_any: wait for any one thread to complete
                                            // join_any: keyword ends fork-join block
                                            // Parent thread continues after first thread completes
                                            // Continues after #10 thread completes (at time 10)
                                            // #20 thread continues executing in background
      begin                                 // Begin keyword: starts sequential block (after join_any)
        #10 $display($time,"im outside"); // #10: wait for 10 more time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im outside": message string
                                            // Executes after join_any completes (at time 10+10=20)
      end                                   // End keyword: closes sequential block
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
