///   INLINE CONSTRAINT:-
///    Inline constraints are specified directly in randomize() call
///    They override or supplement class constraints temporarily

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand bit[5:0]data;                       // rand: keyword makes variable randomizable
                                            // bit[5:0]: 6-bit unsigned type (range 0 to 63)
                                            // data: variable name
  constraint c1{data>8;}                   // constraint: define a constraint block
                                            // c1: constraint name
                                            // data>8: condition (data must be greater than 8)
                                            // Restricts data to values 9-63
endclass                                   // End of class definition
module sv;                                 // Declare a module named 'sv'
  packet p;                                // Declare a handle 'p' of type 'packet' (object reference)
                                            // packet: class type
                                            // p: handle name
  initial                                  // Initial block: executes once at simulation start
    begin                                  // Begin keyword: starts a sequential block
      p=new();                             // new(): create a new packet object
                                            // Allocates memory and creates instance of class 'packet'
                                            // Assigns object reference to handle 'p'
      repeat(8)                            // repeat: loop construct that repeats specified number of times
                                            // repeat(8): execute loop body 8 times
        begin                              // Begin keyword: starts loop body
          p.randomize();                   // randomize(): method generates random values
                                            // p.randomize(): randomizes rand variables in object p
                                            // Applies constraint c1: data must be greater than 8
                                            // Note: No inline constraint shown in this example
          $display("data=%0d",p.data);     // $display: print randomized data value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.data: access randomized data member through handle p
                                            // Should print values greater than 8 (9-63)
        end                                // End keyword: closes loop body
    end                                    // End keyword: closes the sequential block
endmodule                                  // End of module declaration
