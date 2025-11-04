///    WAIT FORK:-

module sv;
  initial
    begin
      fork
        begin
          #10 $display($time,"im in1");
        end
        begin
          #20 $display($time,"im in2");
        end
      join
      wait fork;
        #10 $display($time,"im out1");
       $finish;
        #20 $display($time,"im out2");
        end
        endmodule
