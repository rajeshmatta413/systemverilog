///    TYPEDEF DATATYPE:-
///    typedef creates a type alias (user-defined type name)
///    Useful for creating reusable type definitions

module sv;                                  // Declare a module named 'sv'
  typedef enum{red,blue,black,pink}colour; // typedef: define a type alias
                                            // enum{red,blue,black,pink}: enumerated type definition
                                            // red=0, blue=1, black=2, pink=3 (automatic assignment)
                                            // colour: type name (alias for this enum type)
                                            // Can now use 'colour' as a type name
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      colour clr;                           // Declare variable 'clr' of type 'colour'
                                            // colour: user-defined type (enum)
                                            // clr: variable name
      clr=clr.last();                       // last(): method returns last enumeration value
                                            // clr.last(): returns pink (last enum value)
                                            // clr: assigned to last enum value (pink)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // %0s: format specifier for string (prints enum name)
                                            // %0d: format specifier for decimal (prints enum value)
                                            // Outputs: "clr=pink,clr=3"
      clr=clr.prev();                       // prev(): method returns previous enumeration value
                                            // clr.prev(): returns previous enum value before current
                                            // If clr=pink, prev() returns black
                                            // clr: assigned to previous enum value (black)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // Outputs: "clr=black,clr=2"
      clr=clr.first();                     // first(): method returns first enumeration value
                                            // clr.first(): returns red (first enum value)
                                            // clr: assigned to first enum value (red)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // Outputs: "clr=red,clr=0"
      clr=clr.next();                       // next(): method returns next enumeration value
                                            // clr.next(): returns next enum value after current
                                            // If clr=red, next() returns blue
                                            // clr: assigned to next enum value (blue)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // Outputs: "clr=blue,clr=1"
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
