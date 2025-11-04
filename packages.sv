///    PACKAGES:-
///    Packages are used to group related declarations together
///    They provide a namespace and can be imported into other modules

package pkg;                                // Declare a package named 'pkg'
class packet;                               // Define a class named 'packet'
  int addr;                                 // Declare integer member variable 'addr' (address)
  int data;                                 // Declare integer member variable 'data' (data)
  function display();                       // Define a function named 'display'
    $display("i am rajesh");                // $display: print string to console
    endfunction                             // End of function definition
  
    task run();                             // Define a task named 'run' (tasks can have time delays)
      $display("i am runing");              // $display: print string to console
    endtask                                 // End of task definition
endclass                                    // End of class definition
endpackage                                  // End of package declaration

    
import pkg::*;                              // Import all items from package 'pkg' using wildcard '*'
                                            // This makes all classes, functions, etc. from pkg available
    module sv;                              // Declare a module named 'sv'
      packet p;                             // Declare a handle 'p' of type 'packet' (object reference)
      initial                               // Initial block: executes once at simulation start
        begin                               // Begin keyword: starts a sequential block
          p=new();                          // new(): class constructor, creates a new packet object
                                            // Assigns the object reference to handle 'p'
          p.addr=90;                        // Access member variable 'addr' and assign value 90
          p.data=30;                        // Access member variable 'data' and assign value 30
          p.display();                      // Call the display() function using object handle 'p'
          p.run();                          // Call the run() task using object handle 'p'
          $display("addr=%0d,data=%0d",p.addr,p.data); // Print addr and data values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.addr: access addr member through handle p
                                            // p.data: access data member through handle p
        end                                 // End keyword: closes the sequential block
    endmodule                               // End of module declaration
    
