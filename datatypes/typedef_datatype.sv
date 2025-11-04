module sv;
  typedef enum{red,blue,black,pink}colour;
  initial
    begin
      colour clr;
      clr=clr.last();
      $display("clr=%0s,clr=%0d",clr,clr);
      clr=clr.prev();
      $display("clr=%0s,clr=%0d",clr,clr);
      clr=clr.first();
      $display("clr=%0s,clr=%0d",clr,clr);
      clr=clr.next();
      $display("clr=%0s,clr=%0d",clr,clr);
      
    end
endmodule
