///    1) Constraint with array size of 5 to 10 values & the array valuesshould be in ascending order

class packet;
rand bit[3:0] a[];
constraint size {a.size inside {[5:10]};}
constraint c1 {foreach(a[i])
if(i>0)
a[i]>a[i-1];}
function void display();
$display("size of a=%0d",a.size);
$display("a=%0p",a);
endfunction
endclass
module tb;
packet pkt;
initial
begin
pkt=new();
repeat(10)
begin
pkt.randomize();
pkt.display();
end
end
endmodule
