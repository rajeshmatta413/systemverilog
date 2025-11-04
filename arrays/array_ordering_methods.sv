///   ARRAY ORDERING METHODS:-

module sv;
  int array_1[5];
  initial
    begin
      array_1={1,3,5,4,2};
      $display("array_1=%0p",array_1);
      array_1.sort;
      $display("array_1=%0p",array_1);
      array_1.rsort;
      $display("array_1=%0p",array_1);
      array_1.shuffle;
      $display("array_1=%0p",array_1);
      array_1.reverse;
      $display("array_1=%0p",array_1);
      
    end
endmodule
