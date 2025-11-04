///   TWO DIMENSIONAL ARRAY:-

module sv;
  int array_1[2][2];
  int array_2[4];
  
  initial
    begin
      array_1='{'{2,1},'{1,2}};
      $display("array_1=%0p",array_1);
      foreach(array_1[i,j])
        $display("array_1[%0d][%0d]=%0d",i,j,array_1[i][j]);
      array_2='{2,3,4,5};
      $display("array_2=%0p",array_2);
      foreach(array_2[i])
        $display("array_2[%0d]=%0d",i,array_2[i]);
      
    end
endmodule
