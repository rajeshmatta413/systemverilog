class factorial;
  rand int n;
  constraint raj{soft n==5;}
endclass

module test;
  int fact=1;
  int i;
  factorial f=new();
  initial
    begin
      if(f.randomize())
        $display("factorial number=%0d",f.n);
      for(i=1;i<=f.n;i++)
        fact=fact*i;
      $display("factorial fo %0d=%0d",f.n,fact);
      fact=1;
      if(f.randomize()with {n==8;})
        $display("overridden value=%0d",f.n);
      for(i=1;i<=f.n;i++)
        fact=fact*i;
      $display("overridden of %0d=%0d",f.n,fact);
   
    end
endmodule
