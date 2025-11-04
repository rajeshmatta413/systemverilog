///   UNIQUE IF: -

module sv;
  int a;
  int b;
  int c;
  initial
    begin
      a=2;
      b=7;
      c=0;
      unique if(a>b)
        $display("a is greater than b");
      else if(b>c)
        $display("b is greater than c");
      else
        $display("c is greater than a");
    end
endmodule
