///   PRIORITY IF: -

module sv;
  int a;
  int b;
  int c;
  initial
    begin
      priority if(a>b)
        $display("false");
      else if(b>c)
        $display("false");
      else
        $display("all are false");
    end
endmodule
