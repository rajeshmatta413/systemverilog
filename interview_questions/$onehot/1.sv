//$onehot(expression)
//It checks that the expression is one-hot, which means that only one bit of the given expressioncan be high on a given clock edge.

//write a constraint to generate 32 bit number with 1 bit high using $onehot()

class packet;
rand bit [3:0] a;
constraint c1 {$onehot(a);}

function void display();
$display("a=%0b",a);
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

