///     EXTERN KEY WORD:-

class packet;
  int addr;
  extern virtual function display();
    endclass
  function packet::display();
    $display("i am rajesh");
  endfunction
 
 module sv;
    packet p;
    initial
      begin
        p=new();
        p.display();
        p.addr=90;
        $display("addr=%0d",p.addr);
      end
endmodule
