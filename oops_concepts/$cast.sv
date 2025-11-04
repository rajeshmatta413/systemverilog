///     $CAST:-

class parent;
  int addr;
  int data;
  virtual function display();
    $display("i am parent");
  endfunction
  task run();
    $display("i am running");
  endtask
endclass

class child extends parent;
  function display();
    $display("i am child");
  endfunction
endclass


module sv;
  parent p;
  child c;
  child c1;
  initial
    begin
      p=new();
      c=new();
      c1=new();
      p=c;
      p.addr=90;
      p.data=30;
      $cast(c1,p);
      c1.display();
      p.display();
      p.run();
      $display("addr=%0d,data=%0d",p.addr,p.data);
    end
endmodule
