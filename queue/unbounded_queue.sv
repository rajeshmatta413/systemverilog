///    QUEUE: -
///   UN-BOUNDED QUEUE:-

module sv;
  int queue_1[$];
  initial
    begin
      $display("queue_1=%0d",queue_1.size());
      queue_1={1,2,3,4,5};
      $display("queue_1=%0p",queue_1);
      foreach(queue_1[i])
        $display("queue_1[%0d]=%0d",i,queue_1[i]);
      queue_1.push_front(2);
      foreach(queue_1[i])
        $display("queue_1[%0d]=%0d",i,queue_1[i]);
      queue_1.push_back(9);
      foreach(queue_1[i])
        $display("queue_1[%0d]=%0d",i,queue_1[i]);
      queue_1.insert(2,7);
      foreach(queue_1[i])
        $display("queue_1[%0d]=%0d",i,queue_1[i]);
       queue_1.pop_front();
      foreach(queue_1[i])
        $display("queue_1[%0d]=%0d",i,queue_1[i]);
      queue_1.pop_back();
      foreach(queue_1[i])
        $display("queue_1[%0d]=%0d",i,queue_1[i]);
      queue_1.delete();
      $display("queue_1=%0p",queue_1);

    end
endmodule
