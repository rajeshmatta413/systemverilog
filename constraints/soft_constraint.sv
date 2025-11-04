   ///    SOFT CONSTRAINT:-
///    Soft constraints can be violated if hard constraints conflict
///    Hard constraints take precedence over soft constraints

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand bit [5:0]data;                       // rand: keyword makes variable randomizable
                                            // bit [5:0]: 6-bit unsigned type (range 0 to 63)
                                            // data: variable name
  constraint c1{ soft data inside{[1:10],[11:20]};} // constraint: define a soft constraint block
                                            // c1: constraint name
                                            // soft: keyword makes constraint soft (violatable)
                                            // data inside{[1:10],[11:20]}: inside constraint
                                            // {[1:10],[11:20]}: valid ranges 1-10 or 11-20
                                            // Soft constraint: can be violated if hard constraints conflict
  constraint c2{data inside{[21:30],[31:40]};} // constraint: define a hard constraint block
                                            // c2: constraint name
                                            // data inside{[21:30],[31:40]}: inside constraint
                                            // {[21:30],[31:40]}: valid ranges 21-30 or 31-40
                                            // Hard constraint: cannot be violated
                                            // Conflict: c1 wants 1-20, c2 wants 21-40
                                            // Solution: c2 takes precedence (hard wins), c1 is violated
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
       begin                                // Begin keyword: starts loop body
         p.randomize();                     // randomize(): method generates random values
                                            // p.randomize(): randomizes rand variables in object p
                                            // Applies constraints c1 (soft) and c2 (hard)
                                            // Hard constraint c2 takes precedence: data = 21-40
                                            // Soft constraint c1 is violated (data is not 1-20)
         $display("data=%0d",p.data);     // $display: print randomized data value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.data: access randomized data member through handle p
                                            // Should print values between 21-40 (hard constraint)
       end                                  // End keyword: closes loop body
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration   
