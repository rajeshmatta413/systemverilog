///     SUPER KEYWORD:-

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
    super.display();
    endfunction
endclass

module sv;
  parent p;
  child c;
  initial
    begin
      p=new();
      c=new();
      p=c;
      c.addr=90;
      c.data=30;
      p.display();
      c.display();
      $display("addr=%0d,data=%0d",c.addr,c.data);
    end
endmodule
