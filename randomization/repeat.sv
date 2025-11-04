///     REPEAT:-
///    repeat generates random values multiple times
///    rand variables generate new random values each time

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand bit[4:0]a;                          // rand: keyword makes variable randomizable
                                            // bit[4:0]: 5-bit unsigned type (range 0 to 31)
                                            // a: variable name
                                            // rand: generates new random value each time randomize() is called
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
      repeat(12)                           // repeat: loop construct that repeats specified number of times
                                            // repeat(12): execute loop body 12 times
      begin                                // Begin keyword: starts loop body
        p.randomize();                     // randomize(): method generates random values
                                            // p.randomize(): randomizes rand variables in object p
                                            // Generates new random value for 'a' each iteration
                                            // rand: generates different values each time
        $display("a=%0d",p.a);            // $display: print randomized value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.a: access randomized 'a' member through handle p
                                            // Prints different random values (0-31) each iteration
      end                                  // End keyword: closes loop body
    end                                    // End keyword: closes the sequential block
endmodule                                  // End of module declaration

 