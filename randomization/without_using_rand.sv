///       WITHOUT USING RAND KEY WORD:-

class packet;
  bit [4:0]a;
endclass
module sv;
  packet p=new();
  
  initial
    begin
      repeat(10)
        begin
      p.a=$random;
          $display("a=%0d",p.a);
    end
    end 
endmodule
