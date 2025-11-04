///     BY USING RANGE METHOD:-

class packet;
  bit [4:0]a;
endclass
module sv;
  packet p=new();
  
  initial
    begin
      repeat(20)
        begin
          p.a=$urandom_range(10,20);
          $display("a=%0d",p.a);
    end
    end
  
endmodule


