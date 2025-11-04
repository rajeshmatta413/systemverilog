///   SHALLOW COPY:-
class packet;
  int addr;
  int data;
  function display();
    $display("i am rajesh");
  endfunction
endclass
module sv;
  packet p1,p2;
  initial
    begin
      p1=new();
      p2=new p1;
      p2.addr=90;
      p2.data=30;
      p2.display();
      $display("addr=%0d,data=%0d",p2.addr,p2.data);
    end
endmodule
