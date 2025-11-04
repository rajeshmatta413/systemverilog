////    3) Derive odd numbers within the range of 10 to 40 using constraints
class packet;
rand bit [7:0] a;
constraint c1 { a inside {[10:40]};
a%2==1;}
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
