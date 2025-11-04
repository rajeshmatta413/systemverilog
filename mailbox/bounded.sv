///  MAIL BOX (BOUNDED):-

module sv;
  int addr;
  mailbox mbx=new();
  initial
    begin
      addr=10;
      mbx.put(addr);
      $display("i am putting 1 key");
    end
  initial
    begin
      mbx.get(addr);
      $display("i am getting 9 keys");
    end
endmodule
