class packet;
  rand bit [5:0]data;
endclass
module sv;
  packet p=new();
  covergroup cg;
    option.per_instance=1;
    c1:coverpoint p.data{
      bins s=data with(item%2==0);
      //bins b[]={1,2,3,4,5};
    }
  endgroup
  initial
    begin
     cg cg_inst;
      cg_inst=new();
      repeat(90)
        begin
          //p.randomize();
          p.data=$random;
          cg_inst.sample();
          $display("data=%0d",p.data);
        end
    end
endmodule

      
      

