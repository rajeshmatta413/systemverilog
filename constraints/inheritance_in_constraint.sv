   ///  INHERITANCE IN CONSTRAINT:-

class packet;
  rand bit [5:0]data;
  constraint c1{data>8;}
endclass

class child extends packet;
  constraint c1{data>10;}
endclass


module sv;
  packet p;
  child c;
  initial
    begin
      p=new();
      c=new();
      repeat(5)
        begin
          p.randomize();
          c.randomize();
          $display("data=%0d",c.data);
        end
    end
endmodule   
        


