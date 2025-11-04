///     SCOPE RESOLUTION OPERATOR:-

class packet;
  static int addr;
  static int data;
  static function display();
    $display("i am rajesh");
  endfunction
  static task run();
    $display("i am runing");
  endtask
endclass


module sv;
  packet p;
  initial
    begin
      packet::addr=90;
      
packet::data=30;
      packet::display();
      packet::run();
      $display("addr=%0d,data=%0d",p.addr,p.data);
    end
endmodule

  
