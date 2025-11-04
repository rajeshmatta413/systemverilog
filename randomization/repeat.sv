///     REPEAT:-
class packet;
  rand bit[4:0]a;
endclass
module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(12)
      begin
        p.randomize();
        $display("a=%0d",p.a);
      end
    end
endmodule

