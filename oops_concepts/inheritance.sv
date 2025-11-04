///    INHERITANCE:-

class parent;
  int addr;
  int data;
  function display();
    $display("i am parent");
    endfunction
  task run();
    $display("i am running");
  endtask
endclass


class child extends parent;
endclass

module sv;
  parent p;
  child c;
  initial
    begin
      p=new();
      c=new();
      c.display();
      c.run();
      c.addr=90;
      c.data=30;
      $display("addr=%0d,data=%0d",c.addr,c.data);
    end
endmodule
