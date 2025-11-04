///     CONSTRAINT OUT OF THE CLASS:-

class packet;
  rand bit[5:0]data;
  constraint c1;
endclass
constraint packet::c1{data%2==0;}

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
