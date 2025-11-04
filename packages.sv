///    PACKAGES:-

package pkg;
class packet;
  int addr;
  int data;
  function display();
    $display("i am rajesh");
    endfunction
  
    task run();
      $display("i am runing");
    endtask
endclass
endpackage

    
import pkg::*;
    module sv;
      packet p;
      initial
        begin
          p=new();
          p.addr=90;
          p.data=30;
          p.display();
          p.run();
          $display("addr=%0d,data=%0d",p.addr,p.data);
        end
    endmodule
    
