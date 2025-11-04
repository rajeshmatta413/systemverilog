///      ACTUAL OR VIRTUAL CLASS:-

virtual class parent;
  int addr;
  function display();
    $display("i am rajesh");
  endfunction
  task run();
    $display("i an running");
  endtask
endclass

class child extends parent;
endclass

module sv;
  parent p;
  child c;
  initial
    begin
      c=new();
      p=c;
      c.addr=90;
      c.display();
      $display("addr=%0d", c.addr);
    end
endmodule
