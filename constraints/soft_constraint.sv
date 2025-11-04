   ///    SOFT CONSTRAINT:-

class packet;
  rand bit [5:0]data;
  constraint c1{ soft data inside{[1:10],[11:20]};}
  constraint c2{data inside{[21:30],[31:40]};}
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
