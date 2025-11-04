///    FIBONACCI SERIES USING CONSTRAINT:-

class packet;
  rand int a[];
  constraint c1{a.size()==20;}
  constraint c2{foreach(a[i])
    if(i==0)
      a[i]==0;
                else if(i==1)
                  a[i]==1;
                else
                  a[i]==a[i-1]+a[i-2];}
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



