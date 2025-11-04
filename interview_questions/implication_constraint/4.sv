///    4) constraint - divisible by 4
class packet;
rand bit[7:0] a;
constraint c1 {a%4 == 0;}
function void display();
$display("a=%0d",a);
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
