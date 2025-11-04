///     EXTERN KEY WORD:-
///    The 'extern' keyword allows function/task definition outside the class body
///    Useful for keeping class declarations clean and separating implementation

class packet;                               // Define a class named 'packet'
  int addr;                                 // Declare integer member variable 'addr' (address)
  extern virtual function display();        // extern: declare function that will be defined outside class
                                            // virtual: allows function to be overridden in derived classes
                                            // function: indicates this is a function (returns value)
    endclass                                // End of class definition
  function packet::display();               // packet::display(): scope resolution operator '::'
                                            // Defines display() function outside class body
                                            // 'packet::' specifies which class this function belongs to
    $display("i am rajesh");                // $display: print string to console
  endfunction                               // End of function definition
 
 module sv;                                 // Declare a module named 'sv'
    packet p;                               // Declare a handle 'p' of type 'packet' (object reference)
    initial                                 // Initial block: executes once at simulation start
      begin                                 // Begin keyword: starts a sequential block
        p=new();                            // new(): class constructor, creates a new packet object
                                            // Assigns the object reference to handle 'p'
        p.display();                        // Call the display() function using object handle 'p'
        p.addr=90;                          // Access member variable 'addr' and assign value 90
        $display("addr=%0d",p.addr);        // Print addr value
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // p.addr: access addr member through handle p
      end                                   // End keyword: closes the sequential block
endmodule                                   // End of module declaration
