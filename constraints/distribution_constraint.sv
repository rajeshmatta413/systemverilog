///      DISTRIBUTION CONSTRAINT:-

class packet;
  rand bit[5:0]data;
  constraint c1{data dist{[2:10],[5:20]};}
endclass

module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(10)
        begin
          p.randomize();
          $display("data=%0d",p.data);
        end
    end
endmodule
