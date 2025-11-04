///     JOIN NONE:-

module sv;
  initial
    begin
      fork
        begin
          #10 $display($time,"im one");
        end
        begin
          #20 $display($time,"im two");
        end
      join_none
      begin
        #30 $display($time,"im outside");
      end
    end
endmodule
