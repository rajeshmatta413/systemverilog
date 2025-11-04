///   INLINE CONSTRAINT:-
class packet;
  rand bit[5:0]data;
  constraint c1{data>8;}
endclass
module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(8)
        begin
          p.randomize();
          $display("data=%0d",p.data);
        end
    end
endmodule
