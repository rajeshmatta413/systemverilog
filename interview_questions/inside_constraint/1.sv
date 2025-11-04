///  1) Write a single constraint to generate random values for bit[8:0] variable in thebelow range 1-34,127,129-156,192-202,257-260. code
class packet;
rand bit [8:0] a;
constraint c1 {a inside {[1:34],127,[129:156],[192:202],[257:260]};}
function void display();
$display("a=%0d",a);
endfunction
endclass
module tb();
packet pkt;
initial
begin
pkt=new();
pkt.randomize();
pkt.display();

end
endmodule
