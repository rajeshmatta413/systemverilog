///     UNIQUE CONSTRAINT:-
///    unique constraint ensures all values in a set are different
///    Syntax: unique {variable1, variable2, ...}

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand bit [5:0] data;                      // rand: keyword makes variable randomizable
                                            // bit [5:0]: 6-bit unsigned type (range 0 to 63)
                                            // data: variable name
  rand bit [5:0] array[];                  // rand: keyword makes variable randomizable
                                            // bit [5:0]: 6-bit unsigned type (queue element type)
                                            // array[]: dynamic array (size not specified)
  constraint c1{array.size()==10;}         // constraint: define a constraint block
                                            // c1: constraint name
                                            // array.size()==10: condition (array size must be 10)
                                            // size(): built-in method returns array size
                                            // Ensures array has exactly 10 elements
  //constraint c2{unique {array};}          // Commented out: would ensure all array elements are unique
                                            // unique {array}: constraint makes all array elements different
                                            // Each element would have a different value
  constraint c3{unique{data};}             // constraint: define another constraint block
                                            // c3: constraint name
                                            // unique{data}: ensures all bits in data are unique
                                            // Note: For single variable, unique doesn't apply meaningfully
                                            // May be intended for array elements
  //constraint c4{$onehot(data);}           // Commented out: would ensure exactly one bit is set
                                            // $onehot(data): system function checks one-hot encoding
endclass                                    // End of class definition

module sv;                                  // Declare a module named 'sv'
  packet p;                                 // Declare a handle 'p' of type 'packet' (object reference)
                                            // packet: class type
                                            // p: handle name
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      p=new();                              // new(): create a new packet object
                                            // Allocates memory and creates instance of class 'packet'
                                            // Assigns object reference to handle 'p'
      repeat(2)                             // repeat: loop construct that repeats specified number of times
                                            // repeat(2): execute loop body 2 times
        begin                               // Begin keyword: starts loop body
          p.randomize();                    // randomize(): method generates random values
                                            // p.randomize(): randomizes rand variables in object p
                                            // Applies constraints c1 and c3
          $display("array=%0p",p.array);   // $display: print randomized array
                                            // %0p: format specifier for unpacked array
                                            // p.array: access randomized array through handle p
                                            // Should print array with 10 elements
          $display("data=%0b",p.data);     // $display: print randomized data value in binary
                                            // %0b: format specifier for binary (0 removes leading zeros)
                                            // p.data: access randomized data member through handle p
                                            // Should print 6-bit binary value
          
        end                                 // End keyword: closes loop body
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration


 