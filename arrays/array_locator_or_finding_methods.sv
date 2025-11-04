///    ARRAY LOCATOR OR FINDING METHODS :-

module sv;
  int array_1[5];
  int q[$];
  initial
    begin

      array_1={1,2,2,5,5};
      $display("array_1=%0p",array_1);

      q=array_1.min();
      $display("q=%0p",q);

      q=array_1.max();
      $display("q=%0p",q);

      q=array_1.find with (item>0);
      $display("q=%0p",q);

      q=array_1.find_first with (item>3);
      $display("q=%0p",q);

      q=array_1.find_last with (item==5);
      $display("q=%0p",q);

      q=array_1.unique();
      $display("q=%0p",q);
      
      
    end
endmodule

