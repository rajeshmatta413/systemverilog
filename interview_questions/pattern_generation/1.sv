///   1) Write a constraint to generate pattern below pattern 0101010101.......
class packet;
rand int a[];
constraint size {a.size==10;}
constraint c1 {foreach(a[i])
if(i%2==0)
a[i]==0;
else
a[i]==1;}
function void display();
$display("a=%0p",a);
endfunction
endclass

module tb;
packet pkt;
initial
begin
pkt=new();
repeat(20)
begin
pkt.randomize();
pkt.display();
end
end
endmodule
