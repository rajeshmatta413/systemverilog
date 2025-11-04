///     INSIDE CONSTRAINT:-

class packet;
  rand bit [5:0]data;
  constraint c1{data inside {[10:20],[30:40]};}
endclass

module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(5)
        begin
          p.randomize();
       
          $display("data=%0d",p.data);
        end
    end
endmodule
