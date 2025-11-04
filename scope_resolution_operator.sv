///     SCOPE RESOLUTION OPERATOR:-
///    The '::' operator is used to access static members and methods
///    Static members belong to the class itself, not to instances

class packet;                               // Define a class named 'packet'
  static int addr;                          // static: class variable shared by all instances
                                            // int addr: integer variable (32-bit signed)
                                            // Only one copy exists regardless of number of objects
  static int data;                          // static: class variable shared by all instances
                                            // int data: integer variable (32-bit signed)
  static function display();                // static: function belongs to class, not instances
                                            // Can be called without creating an object
                                            // function: returns a value
    $display("i am rajesh");                // $display: print string to console
  endfunction                               // End of function definition
  static task run();                        // static: task belongs to class, not instances
                                            // Can be called without creating an object
                                            // task: can contain time delays
    $display("i am runing");                // $display: print string to console
  endtask                                   // End of task definition
endclass                                    // End of class definition


module sv;                                  // Declare a module named 'sv'
  packet p;                                 // Declare a handle 'p' of type 'packet' (object reference)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      packet::addr=90;                      // packet:: scope resolution operator '::'
                                            // Accesses static member 'addr' directly through class name
                                            // No object instance needed
                                            // Assign value 90 to static addr
      
packet::data=30;                            // packet:: scope resolution operator '::'
                                            // Accesses static member 'data' directly through class name
                                            // Assign value 30 to static data
      packet::display();                    // packet:: scope resolution operator '::'
                                            // Calls static function 'display' directly through class name
                                            // No object instance needed
      packet::run();                        // packet:: scope resolution operator '::'
                                            // Calls static task 'run' directly through class name
                                            // No object instance needed
      $display("addr=%0d,data=%0d",p.addr,p.data); // Print static addr and data values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.addr: access static addr through handle (also works)
                                            // p.data: access static data through handle (also works)
                                            // Note: Can access static members through instance handle too
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration

  
