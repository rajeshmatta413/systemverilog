class packet;
  rand bit [5:0]data;
endclass
module sv;
  packet p=new();
  covergroup cg;
    option.per_instance=1;
    c1:coverpoint p.data{
      bins b[4]={1,2,3,4};
      bins c[]={9,6,7};
      bins d[]=(1=>2);
      bins y0={8};
      bins y1={5};
      bins p[]=default;
      wildcard bins a[5]={4'b1???};
      bins q[]={[20:$]};
      ignore_bins w[3]={32,33,34};
      illegal_bins e[2]={21,22};
      
    }
    endgroup
      initial
        begin
          cg cg_inst;
          cg_inst=new();
          repeat(20)
            begin
              p.randomize();
              cg_inst.sample();
              $display("data=%0d",p.data);
            end
        end
endmodule
      
