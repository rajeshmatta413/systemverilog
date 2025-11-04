///  5) write a constraint for 4 bit dynamic array.The size of the arrayshould be in between 15 to 20.There should be even number in odd locations and odd number in even location
class packet;
rand bit [3:0] a[];
int i;
constraint size { a.size() inside {[15:20]};}
constraint c1 {foreach(a[i])
{
if(i%2==0)
a[i]%2 == 1;
else
a[i]%2==0;}}
function void display();
$display("size of a=%0d",a.size());
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
