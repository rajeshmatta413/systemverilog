///     JOIN NONE:-
///    join_none doesn't wait for threads, parent continues immediately
///    All threads execute concurrently in background

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
      join_none                             // join_none: don't wait, continue immediately
                                            // join_none: keyword ends fork-join block
                                            // Parent thread continues immediately (doesn't wait)
                                            // Both #10 and #20 threads continue executing in background
      begin                                 // Begin keyword: starts sequential block (after join_none)
        #30 $display($time,"im outside"); // #30: wait for 30 time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im outside": message string
                                            // Executes immediately after join_none (at time 0+30=30)
                                            // Note: This executes before #20 thread completes
      end                                   // End keyword: closes sequential block
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
