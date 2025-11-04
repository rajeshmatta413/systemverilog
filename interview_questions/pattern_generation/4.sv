///   4) write a constraint to generate the pattern 0102030405

class packet;
rand int a[];
constraint size {a.size==10;};
constraint c1 {foreach(a[i])
if(i%2==0)
a[i]==0;
else
a[i]==(i+2)/2;}
function void display();
$display("a=%0p",a);
endfunction
endclass

module tb;
packet pkt;
initial
begin
pkt=new();
pkt.randomize();
pkt.display();
end
endmodule








