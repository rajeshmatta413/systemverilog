///   IF ELSE CONSTRAINT:-

class packet;
  rand int a[];
  constraint c2{a.size()==10;}
  constraint c1{foreach(a[i])
                if(i%2==0)
                  a[i]==0;
                else
                     a[i]==1;}
endclass
module sv;
  packet p;
  initial
    begin
      p=new();
      repeat(5)
        begin
          p.randomize();
          $display("a=%0p",p.a);
        end
    end
endmodule


