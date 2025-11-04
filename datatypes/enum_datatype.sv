module sv;
  enum {red,black,yellow,brown}clr;
  initial
    begin
      clr=clr.first();
      $display("clr=%0s,clr=%0d",clr,clr);
      clr=clr.next();
      $display("clr=%0s,clr=%0d",clr,clr);
      clr=clr.prev();
      $display("clr=%0s,clr=%0d",clr,clr);
      clr=clr.last();
      $display("clr=%0s,clr=%0d",clr,clr);
    end
endmodule
