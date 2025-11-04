///  IMMIDIATE ASSERTION:-

module sv;
  bit clk;
  bit a,b;
  
  always #2 clk=~clk;
  
  initial
    begin
      #5 a=1;b=1;
      #5 a=1;b=0;
      
      
      c1:@(posedge clk) assert(a&&b)
        begin
        $display("pass1");
        end
      else
        begin
          $display("fail1");
        end
   
  
      c2:@(posedge clk) assert(a||b)
        begin
        $display("pass2");
        end
      else
        begin
          $display("fail2");
        end

      
      c3:@(posedge clk) assert(a^b)
        begin
        $display("pass3");
        end
      else
        begin
          $display("fail3");
        end
  
      #20 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

  
