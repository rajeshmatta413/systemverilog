///    PROGRAM BLOCK:-

program rajesh;
  int a;
  int b;
  initial
    begin
      a=90;
      b=30;
      #2 $display($time,"a=%0d,b=%0d",a,b);
    end
endprogram
