//$countones is used to count the number of 1s in a bit vector expression. An X and Z value of a bit isnot counted towards the number of ones.
//write a constraint using $countones
class packet;
rand bit [7:0] a;

constraint c1 {$countones(1);}
function void display();
$display("DECIMAL:a=%0d \t\t\t\t BINARY:a=%0b",a,a);
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

