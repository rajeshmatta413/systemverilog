class fibanocci;
  rand int n;
endclass

module test;
  fibanocci f=new();
  int a=0,b=1,c;
  initial
    begin
     if(f.randomize() with {n inside{[2:1580]};})
        $display("fibanocci=%0d",f.n);
      else
        $display("randomization failed");
      c=a+b;
      while(c<=f.n)
       begin
          if(c>=2)
            $display("%0d",c);
          a=b;
          b=c;
          c=a+b;
        end 
    end
endmodule


