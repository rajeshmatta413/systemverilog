///     2) write a constraint to generate below pattern 9 19 29 39 49 59 69 79

class packet;
rand int a[];
constraint size {a.size==8;}
constraint c1 {foreach(a[i])
a[i]==(i*10)+9;}

function void display();
$display("a=%0p",a);
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
