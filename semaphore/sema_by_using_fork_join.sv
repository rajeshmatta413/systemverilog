///       BY USING FORK JOIN:-

module sv;
  semaphore sema;
  initial
    begin
      sema=new(4);
      fork
        ojas();
        gambheera();
      join
    end
  
      task ojas();
        sema.put(1);
        #2 $display($time,"i am the real gangster");
        #2 sema.get(1);
        $display($time,"i am Gambheera the real one");
      endtask
      task gambheera();
        sema.put(1);
        #2 $display($time,"i am the Ojas sun");
        #2 sema.get(1);
        $display($time,"i am the Gambheera brother");
      endtask
endmodule
