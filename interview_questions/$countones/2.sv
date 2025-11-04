///write a constraints for two random variable such that one variable should not match with the other & the totalnumber of bits toggled in one variable should be 5 w.r.t the other

class packet;
rand bit[8:0] a;
rand bit [8:0] b;

constraint c1{a!=b;}
constraint c2 {$countones(a)==5;}

function void display();
$display("a=%0b b=%0b",a,b);
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
