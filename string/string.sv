///    STRING: -
///    Strings in SystemVerilog are dynamic arrays of characters
///    They provide various built-in methods for manipulation

module sv;                                  // Declare a module named 'sv'
  string s1="RAJesh";                       // Declare and initialize a string variable
                                            // string: SystemVerilog string type (dynamic character array)
                                            // s1: string variable name
                                            // "RAJesh": string literal (initial value)
  initial                                   // Initial block: executes once at simulation start
    begin                                   // Begin keyword: starts a sequential block
      $display("s1=%0s",s1);               // $display: print string value
                                            // %0s: format specifier for string (0 removes formatting)
                                            // s1: prints "RAJesh"
      $display("s1=%0s",s1.len());         // $display: print string length
                                            // s1.len(): built-in method returns number of characters
                                            // %0s: format specifier (converts integer to string)
                                            // Prints: 6 (length of "RAJesh")
      $display("s1=%0s",s1.toupper());     // $display: print string in uppercase
                                            // s1.toupper(): built-in method converts to uppercase
                                            // Returns: "RAJESH" (all characters uppercase)
                                            // %0s: format specifier for string
      $display("s1=%0s",s1.tolower());     // $display: print string in lowercase
                                            // s1.tolower(): built-in method converts to lowercase
                                            // Returns: "rajesh" (all characters lowercase)
                                            // %0s: format specifier for string
      s1.putc(2,"p");                       // putc(): method replaces character at specified index
                                            // putc(2,"p"): replaces character at index 2 with 'p'
                                            // Index 2: third character (0-based indexing)
                                            // "RAJesh" becomes "RApesh" (J replaced with p)
                                            // Modifies s1 in place
      $display("s1=%0s",s1);               // $display: print modified string
                                            // %0s: format specifier for string
                                            // Should print: "RApesh"
      $display("s1=%0s",s1.getc(3));      // $display: print character at specified index
                                            // s1.getc(3): method returns character at index 3
                                            // Index 3: fourth character (0-based indexing)
                                            // Returns: 'e' from "RApesh"
                                            // %0s: format specifier (converts character to string)
      
    end                                     // End keyword: closes the sequential block
endmodule                                   // End of module declaration
