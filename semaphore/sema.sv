///   SEMAPHORE:-
///    Semaphores provide mutual exclusion and resource counting
///    Used to control access to shared resources

module sv;                                  // Declare a module named 'sv'
  semaphore sema;                           // semaphore: declare a semaphore variable
                                            // sema: semaphore name
                                            // Semaphore: synchronization primitive for resource access
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      sema=new(4);                          // new(): constructor creates semaphore with initial keys
                                            // sema.new(4): creates semaphore with 4 available keys
                                            // Keys: tokens that control resource access
                                            // 4 keys: allows 4 concurrent accesses
      sema.put(1);                          // put(): method returns keys to semaphore
                                            // sema.put(1): returns 1 key to semaphore
                                            // Increases available keys by 1 (now 5 keys available)
                                            // put() is non-blocking: always succeeds
      #2 $display($time,"i am putting 1 key"); // #2: wait for 2 time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "i am putting 1 key": message string
      sema.get(1);                          // get(): method acquires keys from semaphore
                                            // sema.get(1): acquires 1 key from semaphore
                                            // Decreases available keys by 1 (now 4 keys available)
                                            // get() is blocking: waits if not enough keys available
                                            // If keys available, continues immediately
      #2 $display($time,"i am getting 1 key"); // #2: wait for 2 more time units
                                            // $display: print message with time
                                            // $time: system task returns current simulation time
                                            // "i am getting 1 key": message string
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
