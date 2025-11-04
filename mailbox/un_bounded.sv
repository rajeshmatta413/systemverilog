///      MAIL BOX (UN_BOUNDED):-

class packet;
  int a;
endclass
module sv;
  packet p=new();
  mailbox mbx=new();
  initial
    begin
      p.a=10;
      mbx.put(p.a);
      $display("i am putting 1 key");
    end
  initial
    begin
      mbx.get(p.a);
      $display("i am getting 9 keys");
    end
endmodule


