///   DYNAMIC ARRAY:-

module sv;
  int array_1[];
  initial
    begin
      $display("array_1=%0d",array_1.size());
      
      array_1= new[6];
      $display("array_1=%0d",array_1.size());
      
      array_1='{1,2,3,4,5,6};
      foreach(array_1[i])
        $display("array_1[%0d]=%0d",i,array_1[i]); 
      array_1=new[20];
      $display("array_1=%0d",array_1.size()); 
      array_1.delete(); $display("array_1=%0d",array_1.size());
    end
endmodule
