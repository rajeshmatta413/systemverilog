///  DATA TYPE CONVERSIONS: -

module sv;
  int x;
  real r;
  initial
    begin
      r=2.09;
      $display("r=%0f",r);
      x=int'(r);
      $display("x=%0d",x);
    end
endmodule


module sv;
  int x;
  real r;
  initial
    begin
      r=2.09;
      $display("r=%0f",r);
      x=bit'(r);
      $display("x=%0d",x);
    end
endmodule


module sv;
  int x;
  real r;
  initial
    begin
      r=2.09;
      $display("r=%0f",r);
      x=byte'(r);
      $display("x=%0d",x);
    end
endmodule
