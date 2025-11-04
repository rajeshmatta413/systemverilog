///     INSIDE CONSTRAINT:-
///    inside constraint restricts values to specified ranges or sets
///    Syntax: variable inside {range1, range2, ...}

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand bit [5:0]data;                       // rand: keyword makes variable randomizable
                                            // bit [5:0]: 6-bit unsigned type (range 0 to 63)
                                            // data: variable name
  constraint c1{data inside {[10:20],[30:40]};} // constraint: define a constraint block
                                            // c1: constraint name
                                            // data inside {[10:20],[30:40]}: inside constraint
                                            // inside: keyword restricts values to specified ranges
                                            // {[10:20],[30:40]}: set of valid ranges
                                            // [10:20]: range from 10 to 20 (inclusive)
                                            // [30:40]: range from 30 to 40 (inclusive)
                                            // data can only be between 10-20 or 30-40
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
      repeat(5)                             // repeat: loop construct that repeats specified number of times
                                            // repeat(5): execute loop body 5 times
        begin                               // Begin keyword: starts loop body
          p.randomize();                    // randomize(): method generates random values
                                            // p.randomize(): randomizes rand variables in object p
                                            // Applies constraint c1: data must be 10-20 or 30-40
       
          $display("data=%0d",p.data);     // $display: print randomized data value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.data: access randomized data member through handle p
                                            // Should print values between 10-20 or 30-40
        end                                 // End keyword: closes loop body
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
