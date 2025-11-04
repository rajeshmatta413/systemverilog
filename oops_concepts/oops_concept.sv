///    OOPS CONCEPTS:-

class rajesh;
  int addr;
  int data;
  function display();
    $display("i am rajesh");
  endfunction
  task run();
    $display("i am running");
  endtask
endclass

  module sv;
    rajesh r;
    initial
    begin
      r=new();
      r.addr=90;
      r.data=30;
      r.display();
      r.run();
      $display("addr=%0d,data=%0d",r.addr,r.data);
    end
  endmodule
