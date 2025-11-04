///   SEMAPHORE:-

module sv;
  semaphore sema;
  initial
    begin
      sema=new(4);
      sema.put(1);
      #2 $display($time,"i am putting 1 key");
      sema.get(1);
      #2 $display($time,"i am getting 1 key");
    end
endmodule
