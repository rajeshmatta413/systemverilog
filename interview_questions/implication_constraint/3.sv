///    3) Derive odd numbers within the range of 10 to 30 using sv constraints.
class packet;
rand bit [3:0] a;
constraint c1 {a inside {[10:30]};
a%2==1;
}
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
