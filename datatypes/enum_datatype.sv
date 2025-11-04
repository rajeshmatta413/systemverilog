///    ENUM DATATYPE:-
///    Enumerated types define a set of named constants
///    Each name has an associated integer value (starts at 0)

module sv;                                  // Declare a module named 'sv'
  enum {red,black,yellow,brown}clr;        // enum: define an enumerated type
                                            // {red,black,yellow,brown}: list of enumeration names
                                            // red=0, black=1, yellow=2, brown=3 (automatic assignment)
                                            // clr: variable name of enum type
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      clr=clr.first();                      // first(): method returns first enumeration value
                                            // clr.first(): returns red (first enum value)
                                            // clr: assigned to first enum value (red)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // %0s: format specifier for string (prints enum name)
                                            // %0d: format specifier for decimal (prints enum value)
                                            // Outputs: "clr=red,clr=0"
      clr=clr.next();                       // next(): method returns next enumeration value
                                            // clr.next(): returns next enum value after current
                                            // If clr=red, next() returns black
                                            // clr: assigned to next enum value (black)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // Outputs: "clr=black,clr=1"
      clr=clr.prev();                       // prev(): method returns previous enumeration value
                                            // clr.prev(): returns previous enum value before current
                                            // If clr=black, prev() returns red
                                            // clr: assigned to previous enum value (red)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // Outputs: "clr=red,clr=0"
      clr=clr.last();                       // last(): method returns last enumeration value
                                            // clr.last(): returns brown (last enum value)
                                            // clr: assigned to last enum value (brown)
      $display("clr=%0s,clr=%0d",clr,clr); // $display: print enum value as string and integer
                                            // Outputs: "clr=brown,clr=3"
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
