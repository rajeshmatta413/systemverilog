///    STRUCT DATATYPE:-
///    Structures group related variables together
///    Members are accessed using dot notation

module sv;                                  // Declare a module named 'sv'
  struct {                                  // struct: define a structure type
             bit a;                         // Declare structure member 'a' of type bit
                                            // bit: 1-bit unsigned type (values 0 or 1)
              byte b;                       // Declare structure member 'b' of type byte
                                            // byte: 8-bit signed integer type (range -128 to 127)
              int c;                        // Declare structure member 'c' of type int
                                            // int: 32-bit signed integer type
                        }pkt;               // pkt: variable name of struct type
                                            // pkt is a struct variable containing a, b, and c
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      pkt='{1,2,20};                        // Structure literal assignment: '{values}'
                                            // '{1,2,20}: assigns values to struct members in order
                                            // pkt.a=1 (first member gets 1)
                                            // pkt.b=2 (second member gets 2)
                                            // pkt.c=20 (third member gets 20)
      $display("a=%0d,b=%0d,c=%0d",pkt.a,pkt.b,pkt.c); // Print struct member values
                                            // %0d: format specifier for decimal (0 removes leading zeros)
                                            // pkt.a: access member 'a' using dot notation
                                            // pkt.b: access member 'b' using dot notation
                                            // pkt.c: access member 'c' using dot notation
                                            // Outputs: "a=1,b=2,c=20"
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
