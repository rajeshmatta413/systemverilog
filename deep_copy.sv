///     DEEP COPY:-
///    Deep copy creates a completely independent copy of an object
///    Changes to the copy do not affect the original object

class packet;                               // Define a class named 'packet'
  int addr;                                 // Declare integer member variable 'addr' (address)
  int data;                                 // Declare integer member variable 'data' (data)
  function packet copy();                   // Define a function named 'copy' that returns a packet object
     copy=new();                            // new(): create a new packet object and assign to 'copy'
                                            // This creates a separate memory location for the copy
     copy.addr=90;                          // Set the copy's addr member to 90
     copy.data=30;                          // Set the copy's data member to 30
  endfunction                               // End of function definition (returns copy handle)
endclass                                    // End of class definition

module sv;                                  // Declare a module named 'sv'
  packet p1,p2;                             // Declare two packet handles: p1 and p2
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      p1=new();                             // new(): create a new packet object and assign to p1
      p2=p1.copy();                         // Call copy() function on p1
                                            // copy() creates a new independent object
                                            // p2 now points to a completely separate copy
      $display("addr=%0d,data=%0d",p2.addr,p2.data); // Print copy's addr and data values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p2.addr: access addr member of the copied object
                                            // p2.data: access data member of the copied object
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
