class realno;
  rand int n;
  constraint rand_c{n dist {[1:5]:=1,[6:10]:=3};}
endclass
module test;
  initial
    begin
      realno r=new();
      repeat(5)
        begin
          if(r.randomize())
            $display("realnumbers=%0d",r.n);
          else
            $display("randomiztion failed");
        end
    end
endmodule
