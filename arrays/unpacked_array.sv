///   UNPACKED ARRAY:-

module sv;
  int array_1[10];
  initial
    begin
      array_1='{1,2,3,4,5,6,7,8,9,0};
      $display("array_1=%0p",array_1);
      foreach(array_1[i])
        $display("array_1[%0d]=%0d",i,array_1[i]);
      
    end
endmodule
