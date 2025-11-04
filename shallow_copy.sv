///   SHALLOW COPY:-
///    Shallow copy creates a new object but copies the handle value
///    Both handles point to the same object (not independent copies)

class packet;                               // Define a class named 'packet'
  int addr;                                 // Declare integer member variable 'addr' (address)
  int data;                                 // Declare integer member variable 'data' (data)
  function display();                       // Define a function named 'display'
    $display("i am rajesh");                // $display: print string to console
  endfunction                               // End of function definition
endclass                                   // End of class definition
module sv;                                  // Declare a module named 'sv'
  packet p1,p2;                             // Declare two packet handles: p1 and p2
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      p1=new();                             // new(): create a new packet object and assign to p1
      p2=new p1;                            // Shallow copy: create new object using p1 as template
                                            // 'new p1' copies the handle value, not the object itself
                                            // Both p1 and p2 now point to the same object
      p2.addr=90;                           // Access addr member through p2 and assign value 90
                                            // This modifies the shared object (affects p1 too)
      p2.data=30;                           // Access data member through p2 and assign value 30
                                            // This modifies the shared object (affects p1 too)
      p2.display();                         // Call display() function using handle p2
      $display("addr=%0d,data=%0d",p2.addr,p2.data); // Print addr and data values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p2.addr: access addr member through handle p2
                                            // p2.data: access data member through handle p2
    end                                     // End keyword: closes the sequential block
endmodule                                  // End of module declaration
