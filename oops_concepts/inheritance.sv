///    INHERITANCE:-
///    Inheritance allows a child class to inherit members from parent class
///    Child class can access and use parent's methods and variables

class parent;                               // class: define a parent class (base class)
                                            // parent: class name
  int addr;                                 // Declare integer member variable 'addr' (address)
                                            // int: 32-bit signed integer type
  int data;                                 // Declare integer member variable 'data' (data)
                                            // int: 32-bit signed integer type
  function display();                       // function: define a method that returns a value
                                            // display(): function name
    $display("i am parent");               // $display: print string to console
                                            // Outputs: "i am parent"
    endfunction                             // End of function definition
  task run();                               // task: define a method that can have delays
                                            // run(): task name
    $display("i am running");              // $display: print string to console
                                            // Outputs: "i am running"
  endtask                                   // End of task definition
endclass                                    // End of parent class definition


class child extends parent;                // class: define a child class (derived class)
                                            // child: class name
                                            // extends parent: inheritance keyword and parent class name
                                            // child inherits all members (addr, data, display, run) from parent
endclass                                    // End of child class definition
                                            // child has no new members, only inherited ones

module sv;                                  // Declare a module named 'sv'
  parent p;                                // Declare a handle 'p' of type 'parent' (object reference)
                                            // parent: class type
                                            // p: handle name
  child c;                                  // Declare a handle 'c' of type 'child' (object reference)
                                            // child: class type
                                            // c: handle name
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      p=new();                              // new(): create a new parent object
                                            // Allocates memory and creates instance of class 'parent'
                                            // Assigns object reference to handle 'p'
      c=new();                              // new(): create a new child object
                                            // Allocates memory and creates instance of class 'child'
                                            // Assigns object reference to handle 'c'
      c.display();                          // Call display() function inherited from parent
                                            // c.display(): accesses inherited method from parent class
                                            // Executes parent's display() function
                                            // Outputs: "i am parent"
      c.run();                              // Call run() task inherited from parent
                                            // c.run(): accesses inherited method from parent class
                                            // Executes parent's run() task
                                            // Outputs: "i am running"
      c.addr=90;                            // Access addr member inherited from parent
                                            // c.addr: accesses inherited member variable from parent
                                            // Assigns value 90 to inherited addr member
      c.data=30;                            // Access data member inherited from parent
                                            // c.data: accesses inherited member variable from parent
                                            // Assigns value 30 to inherited data member
      $display("addr=%0d,data=%0d",c.addr,c.data); // Print inherited addr and data values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // c.addr: access inherited addr member through handle c
                                            // c.data: access inherited data member through handle c
                                            // Outputs: "addr=90,data=30"
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
