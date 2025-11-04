///     $CAST:-
///    $cast safely converts between related types (parent to child)
///    Returns 1 on success, 0 on failure

class parent;                               // class: define a parent class (base class)
                                            // parent: class name
  int addr;                                 // Declare integer member variable 'addr' (address)
                                            // int: 32-bit signed integer type
  int data;                                 // Declare integer member variable 'data' (data)
                                            // int: 32-bit signed integer type
  virtual function display();              // virtual function: can be overridden in child classes
                                            // virtual: keyword enables runtime polymorphism
                                            // function: method that returns a value
                                            // display(): function name
    $display("i am parent");               // $display: print string to console
                                            // Outputs: "i am parent"
  endfunction                               // End of function definition
  task run();                               // task: define a method that can have delays
                                            // run(): task name
    $display("i am running");              // $display: print string to console
                                            // Outputs: "i am running"
  endtask                                   // End of task definition
endclass                                    // End of parent class definition

class child extends parent;                // class: define a child class (derived class)
                                            // child: class name
                                            // extends parent: inheritance keyword and parent class name
  function display();                       // function: override parent's display() function
                                            // display(): same name as parent's function
                                            // Overrides parent's display() when called polymorphically
    $display("i am child");                // $display: print string to console
                                            // Outputs: "i am child"
  endfunction                               // End of function definition
endclass                                    // End of child class definition


module sv;                                  // Declare a module named 'sv'
  parent p;                                // Declare a handle 'p' of type 'parent' (object reference)
                                            // parent: class type
                                            // p: handle name
  child c;                                  // Declare a handle 'c' of type 'child' (object reference)
                                            // child: class type
                                            // c: handle name
  child c1;                                 // Declare another handle 'c1' of type 'child'
                                            // child: class type
                                            // c1: handle name
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      p=new();                              // new(): create a new parent object
                                            // Allocates memory and creates instance of class 'parent'
                                            // Assigns object reference to handle 'p'
      c=new();                              // new(): create a new child object
                                            // Allocates memory and creates instance of class 'child'
                                            // Assigns object reference to handle 'c'
      c1=new();                             // new(): create another new child object
                                            // Allocates memory and creates instance of class 'child'
                                            // Assigns object reference to handle 'c1'
      p=c;                                  // Assignment: assign child object to parent handle
                                            // p=c: parent handle points to child object
                                            // This enables polymorphism (parent handle, child object)
      p.addr=90;                            // Access addr member through parent handle
                                            // p.addr: accesses member variable
                                            // Assigns value 90 to addr member
      p.data=30;                            // Access data member through parent handle
                                            // p.data: accesses member variable
                                            // Assigns value 30 to data member
      $cast(c1,p);                          // $cast: system function for safe type conversion
                                            // $cast(c1,p): attempts to cast p (parent handle) to c1 (child handle)
                                            // p currently points to child object, so cast succeeds
                                            // c1 now points to the same child object that p points to
                                            // Returns 1 on success, 0 on failure
      c1.display();                         // Call display() using child handle c1
                                            // c1.display(): calls child's display() function
                                            // Outputs: "i am child"
      p.display();                          // Call display() using parent handle pointing to child object
                                            // p.display(): polymorphic call
                                            // Since p points to child object and display() is virtual
                                            // Executes child's display() function (not parent's)
                                            // Outputs: "i am child"
      p.run();                              // Call run() using parent handle pointing to child object
                                            // p.run(): accesses parent's run() method
                                            // Since run() is not virtual, uses parent's version
                                            // Outputs: "i am running"
      $display("addr=%0d,data=%0d",p.addr,p.data); // Print addr and data values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.addr: access addr member through parent handle
                                            // p.data: access data member through parent handle
                                            // Outputs: "addr=90,data=30"
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
