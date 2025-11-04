///     THIS KEYWORD:-

class rajesh;
  int a;
  int b;
  function display(int a,b);
    this.a=a;
    this.b=b;
  endfunction
endclass

module sv;
  rajesh r;
  initial
    begin
      r=new();
      r.display(1,2);
      $display("a=%0d,b=%0d",r.a,r.b);
    end
endmodule
