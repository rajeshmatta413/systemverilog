///    SEQUENCE ASSERTION:-

module sv;
  bit clk;
  bit a,b;
  always #2 clk=~clk;
  initial
    begin
      #5 a=1;b=1;
      #5 a=0;b=1;
      
      #20 $finish;
    end
  
  sequence seq1;
    @(posedge clk) (a && b);
  endsequence : seq1

property prop_seq1;
    seq1;  // Reference the sequence in the property
endproperty : prop_seq1

c1: assert property (prop_seq1);
  
  
  sequence seq2;
    @(posedge clk) (a || b);
endsequence : seq2  // Need to add label for sequence end

property prop_seq2;
    seq2;  // Reference the sequence in the property
endproperty : prop_seq2

c2: assert property (prop_seq2);
  
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

