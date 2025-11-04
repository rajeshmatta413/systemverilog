module sv;
  struct {
             bit a;
              byte b;
              int c;
                        }pkt;
  initial
    begin
      pkt='{1,2,20};
      $display("a=%0d,b=%0d,c=%0d",pkt.a,pkt.b,pkt.c);
    end
endmodule
