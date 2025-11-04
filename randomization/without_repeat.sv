///      WITHOUT REPEAT:-
class packet;
  randc bit[4:0]a;
endclass

module sv;
  packet p=new();
  initial
    begin
      repeat(10)
      begin
        p.randomize();
        $display("a=%0d",p.a);
      end
    end
endmodule
