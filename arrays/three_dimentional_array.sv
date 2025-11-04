///   THREE DIMENSIONAL ARRAY:-

module sv;
  int array_1[2][2][2];
  int array_2[6];
  initial
    begin
      array_1='{'{'{2,4},'{3,4}},'{'{9,8},'{7,8}}};
      $display("array_1=%0p",array_1);
      foreach(array_1[i,j,k])
      $display("array_1[%0d][%0d][%0d]=%0d",i,j,k,array_1[i][j][k]);
      array_2='{2,3,4,5,6,7};
      $display("array_2=%0p",array_2);
      foreach(array_2[i])
        $display("array_2[%0d]=%0d",i,array_2[i]);
    end
endmodule
