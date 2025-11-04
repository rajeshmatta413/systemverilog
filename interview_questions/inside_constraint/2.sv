///   2) Without inside operator generate random values for the range 34-43
//code
class packet;
rand logic [7:0] a;
constraint c1 { (a>34) && (a<43);} //without inside constraint
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
