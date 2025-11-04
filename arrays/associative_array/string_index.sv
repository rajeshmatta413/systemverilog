///   STRING INDEX:-

module sv;
  int array_1[*];
  int index;
  initial
    begin
      $display("array_1=%0d",array_1.num());
      array_1["a"]=1;
      array_1["b"]=2;
      array_1["c"]=3;
      array_1["d"]=4;
      array_1["e"]=5;
      array_1["f"]=6;
      $display("array_1=%0d",array_1.num());
      foreach(array_1[i])
        $display("array_1[%0d]=%0d",i,array_1[i]);
      array_1.first(index);
      $display("array_1[index]=%0s",index,array_1[index]);
      array_1.next(index);
      $display("array_1[index]=%0s",index,array_1[index]);
      array_1.last(index);
      $display("array_1[index]=%0s",index,array_1[index]);
      array_1.prev(index);
      $display("array_1[index]=%0s",index,array_1[index]);
      array_1.delete();
      $display("array_1=%0d",array_1.num());
 
      
    end
endmodule

