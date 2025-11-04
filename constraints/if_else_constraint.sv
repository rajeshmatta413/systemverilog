///   IF ELSE CONSTRAINT:-
///    Constraints use if-else to conditionally apply constraints
///    Different constraints apply based on conditions

class packet;                               // class: define a class for randomization
                                            // packet: class name
  rand int a[];                            // rand: keyword makes variable randomizable
                                            // int a[]: dynamic array of integers
                                            // []: empty brackets indicate dynamic array
                                            // a: array name
  constraint c2{a.size()==10;}            // constraint: define a constraint block
                                            // c2: constraint name
                                            // a.size()==10: condition (array size must be 10)
                                            // size(): built-in method returns array size
                                            // Ensures array has exactly 10 elements
  constraint c1{foreach(a[i])             // constraint: define another constraint block
                                            // c1: constraint name
                                            // foreach(a[i]): iterate through all array elements
                                            // i: index variable (automatically iterates 0 to size-1)
                if(i%2==0)                  // if: conditional statement
                                            // i%2==0: condition (index is even)
                                            // %: modulo operator (remainder after division)
                                            // i%2==0 means i is divisible by 2 (even index)
                  a[i]==0;                  // a[i]==0: constraint for even indices
                                            // Elements at even indices must be 0
                                            // a[0], a[2], a[4], a[6], a[8] must be 0
                else                        // else: alternative condition
                     a[i]==1;}              // a[i]==1: constraint for odd indices
                                            // Elements at odd indices must be 1
                                            // a[1], a[3], a[5], a[7], a[9] must be 1
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
                                            // Applies all constraints (c1 and c2)
                                            // Generates: a[] with 10 elements, even indices=0, odd indices=1
          $display("a=%0p",p.a);          // $display: print randomized array
                                            // %0p: format specifier for unpacked array
                                            // p.a: access randomized array through handle p
                                            // Should print: {0,1,0,1,0,1,0,1,0,1}
        end                                 // End keyword: closes loop body
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration


 