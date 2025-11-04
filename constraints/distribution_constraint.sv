///      DISTRIBUTION CONSTRAINT:-
///    Distribution constraints assign probabilities to value ranges
///    Syntax: variable dist {range1 := weight1, range2 := weight2}

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand bit[5:0]data;                       // rand: keyword makes variable randomizable
                                            // bit[5:0]: 6-bit unsigned type (range 0 to 63)
                                            // data: variable name
  constraint c1{data dist{[2:10],[5:20]};} // constraint: define a constraint block
                                            // c1: constraint name
                                            // data dist{...}: distribution constraint
                                            // dist: keyword assigns probability weights to ranges
                                            // {[2:10],[5:20]}: ranges with equal weights (default)
                                            // [2:10]: range from 2 to 10 (inclusive)
                                            // [5:20]: range from 2 to 20 (inclusive)
                                            // Overlapping ranges: 5-10 appears in both
                                            // Values 2-20 have equal probability
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
      repeat(10)                            // repeat: loop construct that repeats specified number of times
                                            // repeat(10): execute loop body 10 times
        begin                               // Begin keyword: starts loop body
          p.randomize();                    // randomize(): method generates random values
                                            // p.randomize(): randomizes rand variables in object p
                                            // Applies constraint c1: data distributed between 2-20
          $display("data=%0d",p.data);     // $display: print randomized data value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.data: access randomized data member through handle p
                                            // Should print values between 2-20
        end                                 // End keyword: closes loop body
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
