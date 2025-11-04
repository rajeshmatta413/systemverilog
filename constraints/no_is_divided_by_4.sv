///  NUMBER IS DIVIDED BY 4 CONSTRAINT:-

class packet;
  rand bit [5:0]data;
  constraint c1{data%4==0;}
endclass
module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(10);
      begin
        p.randomize();
        $display("data=%0d",p.data);
      end
    end
endmodule 
 //(or)
class packet;
  rand int a[];
  constraint c1{a.size()==10;}
  constraint c2{foreach (a[i])
    if(i%4==0)
      a[i]==0;
                else
                  a[i]==1;}
endclass
module sv;
  packet p;
  initial begin
      p=new();
      repeat(4); 
         begin
        p.randomize();
        $display("a=%0p",p.a);
      end
    end
endmodule
