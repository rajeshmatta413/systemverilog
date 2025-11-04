///     THIS KEYWORD:-
///    this keyword refers to the current object instance
///    Used to distinguish between member variables and function parameters with same names

class rajesh;                               // class: define a class named 'rajesh'
                                            // rajesh: class name
  int a;                                    // Declare integer member variable 'a'
                                            // int: 32-bit signed integer type
                                            // a: member variable name
  int b;                                    // Declare integer member variable 'b'
                                            // int: 32-bit signed integer type
                                            // b: member variable name
  function display(int a,b);                // function: define a method that takes parameters
                                            // display(): function name
                                            // int a,b: function parameters (same names as member variables)
                                            // Parameter 'a' shadows member variable 'a'
                                            // Parameter 'b' shadows member variable 'b'
    this.a=a;                               // this: keyword refers to current object instance
                                            // this.a: accesses member variable 'a' (not parameter)
                                            // =a: assigns parameter 'a' to member variable 'a'
                                            // Resolves name conflict between parameter and member
    this.b=b;                               // this: keyword refers to current object instance
                                            // this.b: accesses member variable 'b' (not parameter)
                                            // =b: assigns parameter 'b' to member variable 'b'
                                            // Resolves name conflict between parameter and member
  endfunction                               // End of function definition
endclass                                    // End of class definition

module sv;                                  // Declare a module named 'sv'
  rajesh r;                                 // Declare a handle 'r' of type 'rajesh' (object reference)
                                            // rajesh: class type
                                            // r: handle name
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      r=new();                              // new(): class constructor creates a new object
                                            // Allocates memory and creates instance of class 'rajesh'
                                            // Assigns object reference to handle 'r'
      r.display(1,2);                       // Call display() function with arguments
                                            // r.display(1,2): calls display() method
                                            // Passes 1 as parameter 'a', 2 as parameter 'b'
                                            // Member variables r.a and r.b are set to 1 and 2
      $display("a=%0d,b=%0d",r.a,r.b);   // Print member variable values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // r.a: access member variable 'a' through handle r
                                            // r.b: access member variable 'b' through handle r
                                            // Outputs: "a=1,b=2"
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
