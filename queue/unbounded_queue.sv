///    QUEUE: -
///   UN-BOUNDED QUEUE:-
///    Unbounded queues have no size limit
///    Syntax: type name[$] where $ indicates unbounded queue

module sv;                                  // Declare a module named 'sv'
  int queue_1[$];                           // Declare an unbounded queue of integers
                                            // int: 32-bit signed integer type (queue element type)
                                            // queue_1: queue name
                                            // [$]: empty brackets indicate unbounded queue (no size limit)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      $display("queue_1=%0d",queue_1.size()); // $display: print queue size
                                            // queue_1.size(): built-in method returns number of elements
                                            // Initially 0 (empty queue)
                                            // %0d: format specifier for decimal
      queue_1={1,2,3,4,5};                 // Concatenation assignment: {values}
                                            // {1,2,3,4,5}: assigns values to queue elements
                                            // queue_1 now contains: 1,2,3,4,5
      $display("queue_1=%0p",queue_1);    // $display: print entire queue
                                            // %0p: format specifier for queue/array
      foreach(queue_1[i])                  // foreach loop: iterates through all queue elements
                                            // i: index variable (automatically iterates 0 to size-1)
        $display("queue_1[%0d]=%0d",i,queue_1[i]); // Print each element
                                            // %0d: format specifier for decimal
                                            // queue_1[i]: access element at index i
      queue_1.push_front(2);                // push_front(): method inserts element at front
                                            // push_front(2): inserts value 2 at beginning
                                            // queue_1 now contains: 2,1,2,3,4,5
      foreach(queue_1[i])                  // foreach loop: iterates through all queue elements
        $display("queue_1[%0d]=%0d",i,queue_1[i]); // Print each element
      queue_1.push_back(9);                 // push_back(): method inserts element at back
                                            // push_back(9): inserts value 9 at end
                                            // queue_1 now contains: 2,1,2,3,4,5,9
      foreach(queue_1[i])                  // foreach loop: iterates through all queue elements
        $display("queue_1[%0d]=%0d",i,queue_1[i]); // Print each element
      queue_1.insert(2,7);                   // insert(): method inserts element at specified index
                                            // insert(2,7): inserts value 7 at index 2
                                            // queue_1 now contains: 2,1,7,2,3,4,5,9
      foreach(queue_1[i])                  // foreach loop: iterates through all queue elements
        $display("queue_1[%0d]=%0d",i,queue_1[i]); // Print each element
       queue_1.pop_front();                 // pop_front(): method removes and returns front element
                                            // Removes first element from queue
                                            // queue_1 now contains: 1,7,2,3,4,5,9
      foreach(queue_1[i])                  // foreach loop: iterates through all queue elements
        $display("queue_1[%0d]=%0d",i,queue_1[i]); // Print each element
      queue_1.pop_back();                   // pop_back(): method removes and returns back element
                                            // Removes last element from queue
                                            // queue_1 now contains: 1,7,2,3,4,5
      foreach(queue_1[i])                  // foreach loop: iterates through all queue elements
        $display("queue_1[%0d]=%0d",i,queue_1[i]); // Print each element
      queue_1.delete();                     // delete(): method removes all elements from queue
                                            // queue_1.size() becomes 0 after deletion
      $display("queue_1=%0p",queue_1);    // $display: print queue contents (should be empty)
                                            // %0p: format specifier for queue/array

    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
