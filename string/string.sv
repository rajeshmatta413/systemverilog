///    STRING: -

module sv;
  string s1="RAJesh";
  initial
    begin
      $display("s1=%0s",s1);
      $display("s1=%0s",s1.len());
      $display("s1=%0s",s1.toupper());
      $display("s1=%0s",s1.tolower());
      s1.putc(2,"p");
      $display("s1=%0s",s1);
      $display("s1=%0s",s1.getc(3));
      
    end
endmodule
