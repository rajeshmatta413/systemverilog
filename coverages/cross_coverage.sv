class packet;
  rand bit [5:0]data;
  rand bit [5:0]addr;
  
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
    c2:coverpoint p.addr{
      bins r[4]={1,2,3,4};
      bins j[]={9,6,7};
      bins s[]=(1=>2);
      bins h0={8};
      bins h1={5};
      bins u[]=default;
      wildcard bins n[5]={4'b1???};
      bins z[]={[20:$]};
      ignore_bins g[3]={32,33,34};
      illegal_bins t[2]={21,22};
      
    }
    c1xc2:cross c1,c2;
    endgroup
      initial
        begin
          cg cg_inst=new();
          repeat(150)
            begin
              p.randomize();
              cg_inst.sample();
              $display("data=%0d,addr=%0d",p.data,p.addr);
            end
        end
endmodule
      




