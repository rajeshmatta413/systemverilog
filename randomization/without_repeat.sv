///      WITHOUT REPEAT:-
///    randc generates random values cyclically (no repeats until all values seen)
///    Ensures all values in range are generated before repeating

class packet;                               // class: define a class for randomization
                                            // packet: class name
  randc bit[4:0]a;                         // randc: keyword makes variable randomizable (cyclic)
                                            // bit[4:0]: 5-bit unsigned type (range 0 to 31)
                                            // a: variable name
                                            // randc: generates all values (0-31) before repeating
                                            // Cyclic: ensures each value appears once before any repeats
endclass                                    // End of class definition

module sv;                                  // Declare a module named 'sv'
  packet p=new();                           // Declare handle 'p' and create packet object in one line
                                            // packet: class type
                                            // p: handle name
                                            // new(): constructor creates a new packet object
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      repeat(10)                             // repeat: loop construct that repeats specified number of times
                                            // repeat(10): execute loop body 10 times
      begin                                 // Begin keyword: starts loop body
        p.randomize();                      // randomize(): method generates random values
                                            // p.randomize(): randomizes randc variables in object p
                                            // Generates value for 'a' each iteration
                                            // randc: generates unique values (0-31) before repeating
                                            // First 10 calls will produce 10 different values
        $display("a=%0d",p.a);            // $display: print randomized value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.a: access randomized 'a' member through handle p
                                            // Prints unique random values (0-31) each iteration
                                            // No repeats until all 32 values have been generated
      end                                   // End keyword: closes loop body
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
