///   ARRAY REDUCTION METHODS: -

module sv;
  int array_1[5];
  int p;
  initial
    begin
      $display("array_1=%0p",array_1);
      array_1={1,2,3,4,5};
      $display("array_1=%0p",array_1);

      p=array_1.sum();
      $display("p=%0d",p);

      p=array_1.sum() with (item*2);
      $display("p=%0d",p);

      p=array_1.product();
      $display("p=%0d",p);
            p=array_1.or();
      $display("p=%0d",p);

      p=array_1.xor();
      $display("p=%0d",p);

      p=array_1.and();
      $display("p=%0d",p);
    end
endmodule

