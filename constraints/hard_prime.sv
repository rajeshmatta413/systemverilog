class primeno;
  rand int n;
  constraint rand_c{n inside{[2:50]};}
endclass
module test;
  initial begin
      primeno p=new();
      int i;
      for(i=0;i<10;i++)
        begin
          if(p.randomize())
            $display("randomization values=%0d",p.n);
          else
            $display("randomization failed");
        end
    end
endmodule
