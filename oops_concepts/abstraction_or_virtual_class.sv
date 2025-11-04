///      ACTUAL OR VIRTUAL CLASS:-
///    Virtual classes (abstract classes) cannot be instantiated directly
///    They serve as base classes and must be extended by non-virtual classes

virtual class parent;                      // virtual class: define an abstract base class
                                            // virtual: keyword makes class abstract (cannot be instantiated)
                                            // class: keyword defines a class
                                            // parent: class name
  int addr;                                 // Declare integer member variable 'addr' (address)
                                            // int: 32-bit signed integer type
  function display();                       // function: define a method that returns a value
                                            // display(): function name
    $display("i am rajesh");               // $display: print string to console
                                            // Outputs: "i am rajesh"
  endfunction                               // End of function definition
  task run();                               // task: define a method that can have delays
                                            // run(): task name
    $display("i an running");              // $display: print string to console
                                            // Outputs: "i an running"
                                            // Note: Typo in message ("an" instead of "am")
  endtask                                   // End of task definition
endclass                                    // End of virtual class definition

class child extends parent;                // class: define a child class (derived class)
                                            // child: class name
                                            // extends parent: inheritance keyword and parent class name
                                            // child inherits all members from virtual parent class
                                            // child can be instantiated (not virtual)
endclass                                    // End of child class definition
                                            // child has no new members, only inherited ones

module sv;                                  // Declare a module named 'sv'
  parent p;                                // Declare a handle 'p' of type 'parent' (object reference)
                                            // parent: virtual class type
                                            // p: handle name
                                            // Note: Cannot create parent object directly (virtual class)
  child c;                                  // Declare a handle 'c' of type 'child' (object reference)
                                            // child: class type
                                            // c: handle name
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      c=new();                              // new(): create a new child object
                                            // Allocates memory and creates instance of class 'child'
                                            // Assigns object reference to handle 'c'
                                            // Note: parent cannot be instantiated (virtual class)
      p=c;                                  // Assignment: assign child object to parent handle
                                            // p=c: parent handle points to child object
                                            // This enables polymorphism (parent handle, child object)
      c.addr=90;                            // Access addr member inherited from parent
                                            // c.addr: accesses inherited member variable from parent
                                            // Assigns value 90 to inherited addr member
      c.display();                          // Call display() function inherited from parent
                                            // c.display(): accesses inherited method from parent class
                                            // Executes parent's display() function
                                            // Outputs: "i am rajesh"
      $display("addr=%0d", c.addr);        // Print addr value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // c.addr: access inherited addr member through handle c
                                            // Outputs: "addr=90"
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
