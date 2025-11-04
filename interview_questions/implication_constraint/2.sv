///  2) constraint with array size of 5 to 10 values & the array values should be in descending order
class packet;
rand bit[3:0] a[];
constraint size {a.size inside {[5:10]};}
constraint c1 {foreach(a[i])
if(i>0)
a[i]<a[i-1];}
function void display();
$display("size of a=%0d",a.size);
$display("a=%0p",a);
foreach(a[i])
$display("a[%0d]=%0d",i,a[i]);
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
