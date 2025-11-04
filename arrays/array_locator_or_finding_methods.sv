///    ARRAY LOCATOR OR FINDING METHODS :-
///    Locator methods find elements matching criteria and return a queue
///    They don't modify the original array, they return results

module sv;                                  // Declare a module named 'sv'
  int array_1[5];                           // Declare a fixed-size array of 5 integers
                                            // int: 32-bit signed integer type
                                            // [5]: array size (indices 0 to 4)
  int q[$];                                 // Declare a queue to store found elements
                                            // int: 32-bit signed integer type (queue element type)
                                            // q: queue name
                                            // [$]: empty brackets indicate unbounded queue
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block

      array_1={1,2,2,5,5};                 // Concatenation assignment: {values}
                                            // {1,2,2,5,5}: assigns values to array elements
                                            // array_1[0]=1, array_1[1]=2, array_1[2]=2, etc.
      $display("array_1=%0p",array_1);    // $display: print array contents
                                            // %0p: format specifier for unpacked array

      q=array_1.min();                     // min(): locator method finds minimum element(s)
                                            // Returns queue containing minimum value(s)
                                            // Returns: {1} (minimum value is 1)
                                            // If multiple minimums exist, all are returned
      $display("q=%0p",q);                // $display: print queue contents
                                            // %0p: format specifier for queue/array

      q=array_1.max();                     // max(): locator method finds maximum element(s)
                                            // Returns queue containing maximum value(s)
                                            // Returns: {5,5} (maximum value is 5, appears twice)
                                            // If multiple maximums exist, all are returned
      $display("q=%0p",q);                // $display: print queue contents

      q=array_1.find with (item>0);       // find(): locator method finds all elements matching condition
                                            // with (item>0): condition to match (all elements greater than 0)
                                            // item: keyword representing current array element
                                            // Returns: {1,2,2,5,5} (all elements match condition)
      $display("q=%0p",q);                // $display: print queue contents

      q=array_1.find_first with (item>3);  // find_first(): locator method finds first element matching condition
                                            // with (item>3): condition to match (first element greater than 3)
                                            // Returns: {5} (first element > 3 is 5 at index 3)
                                            // Returns queue with single element (first match)
      $display("q=%0p",q);                // $display: print queue contents

      q=array_1.find_last with (item==5);  // find_last(): locator method finds last element matching condition
                                            // with (item==5): condition to match (last element equal to 5)
                                            // Returns: {5} (last element == 5 is at index 4)
                                            // Returns queue with single element (last match)
      $display("q=%0p",q);                // $display: print queue contents

      q=array_1.unique();                  // unique(): locator method finds unique elements
                                            // Returns queue containing each unique value once
                                            // Returns: {1,2,5} (removes duplicates)
                                            // Preserves order of first occurrence
      $display("q=%0p",q);                // $display: print queue contents
      
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration