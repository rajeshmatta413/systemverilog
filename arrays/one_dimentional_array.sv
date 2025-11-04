/// ONE DIMENSIONAL ARRAY:-

module sv;
  int array_1[5];
  initial
    begin
      array_1='{2,28,9,37,3};
      $display("array_1=%0p",array_1);
    end
endmodule
