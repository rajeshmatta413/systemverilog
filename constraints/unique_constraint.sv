///     UNIQUE CONSTRAINT:-

class packet;
  rand bit [5:0] data;
  rand bit [5:0] array[];
  constraint c1{array.size()==10;}
  //constraint c2{unique {array};}
  constraint c3{unique{data};}
  //constraint c4{$onehot(data);}
endclass

module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(2)
        begin
          p.randomize();
          $display("array=%0p",p.array);
          $display("data=%0b",p.data);
          
        end
    end
endmodule


