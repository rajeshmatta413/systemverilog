///    OOPS CONCEPTS:-
///    Object-Oriented Programming concepts in SystemVerilog
///    Classes encapsulate data and methods together

class rajesh;                               // class: define a class (blueprint for objects)
                                            // rajesh: class name
  int addr;                                 // Declare integer member variable 'addr' (address)
                                            // int: 32-bit signed integer type
                                            // addr: member variable name
  int data;                                 // Declare integer member variable 'data' (data)
                                            // int: 32-bit signed integer type
                                            // data: member variable name
  function display();                       // function: define a method that returns a value
                                            // display(): function name
                                            // Functions execute immediately and return values
    $display("i am rajesh");               // $display: print string to console
                                            // Outputs: "i am rajesh"
  endfunction                               // End of function definition
  task run();                               // task: define a method that can have delays
                                            // run(): task name
                                            // Tasks can contain time delays (#) and blocking statements
    $display("i am running");              // $display: print string to console
                                            // Outputs: "i am running"
  endtask                                   // End of task definition
endclass                                    // End of class definition

  module sv;                                // Declare a module named 'sv'
    rajesh r;                               // Declare a handle 'r' of type 'rajesh' (object reference)
                                            // rajesh: class type
                                            // r: handle name (pointer/reference to object)
    initial                                 // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      r=new();                              // new(): class constructor creates a new object
                                            // Allocates memory and creates instance of class 'rajesh'
                                            // Assigns object reference to handle 'r'
      r.addr=90;                            // Access member variable 'addr' through handle 'r'
                                            // r.addr: dot notation to access class member
                                            // Assigns value 90 to addr member
      r.data=30;                            // Access member variable 'data' through handle 'r'
                                            // r.data: dot notation to access class member
                                            // Assigns value 30 to data member
      r.display();                          // Call the display() function using handle 'r'
                                            // r.display(): dot notation to call class method
                                            // Executes display() function defined in class
      r.run();                              // Call the run() task using handle 'r'
                                            // r.run(): dot notation to call class method
                                            // Executes run() task defined in class
      $display("addr=%0d,data=%0d",r.addr,r.data); // Print addr and data values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // r.addr: access addr member through handle r
                                            // r.data: access data member through handle r
                                            // Outputs: "addr=90,data=30"
    end                                     // End keyword: closes the sequential block
  endmodule                                 // End of module declaration
