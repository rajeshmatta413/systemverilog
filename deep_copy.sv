///     DEEP COPY:-
class packet;
  int addr;
  int data;
  function packet copy();
     copy=new();
     copy.addr=90;
     copy.data=30;
  endfunction
endclass

module sv;
  packet p1,p2;
  initial
    begin
      p1=new();
      p2=p1.copy();
      $display("addr=%0d,data=%0d",p2.addr,p2.data);
    end
endmodule
