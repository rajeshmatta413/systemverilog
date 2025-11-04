///     JOIN:-
///    join (or join_all) waits for all threads in fork-join block to complete
///    All threads execute concurrently, parent waits for all to finish

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
      join                                  // join: wait for all threads to complete
                                            // join: keyword ends fork-join block (same as join_all)
                                            // Parent thread waits here until both threads finish
                                            // Continues only after both #10 and #20 threads complete
      begin                                 // Begin keyword: starts sequential block (after join)
        #10 $display($time,"im outside"); // #10: wait for 10 more time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "im outside": message string
                                            // Executes after join completes (at time 20+10=30)
      end                                   // End keyword: closes sequential block
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
