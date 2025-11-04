///    FOR LOOP:-

module sv;
  int i;
  initial
    begin
      for(int i=0; i<10;i++)
        $display("i=%0d",i);
    end
endmodule

module sv;
  int i,j;
  initial
    begin
      for(i=0,j=10;i<10;i++,j--)
        $display("i=%0d,j=%0d",i,j);
    end
endmodule
