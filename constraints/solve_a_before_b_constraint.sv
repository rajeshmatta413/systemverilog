///    SOLVE A BEFORE B CONSTRAINT:-

class packet;
  rand bit[5:0]data;
  rand bit[5:0]addr;
  constraint c1{(data==0)->(addr==1);}
endclass
module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(10)
        begin
          p.randomize();
          $display("data=%0d,addr=%0d",p.data,p.addr);
        end
    end
endmodule
