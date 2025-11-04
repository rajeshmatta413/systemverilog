///      3) write a constraint to generate below pattern 5 -10 15 -20 25 -30

class packet ;
rand int a[];

constraint size{a.size==6;}
constraint c1 { foreach(a[i])
if(i%2==0)
a[i]==(i*5)+5;
else
a[i] == -5*(i+1);}
function void display();
$display("a=%0p",a);
endfunction
endclass

module top;
packet pkt;
initial
begin
pkt=new();
pkt.randomize();
pkt.display();
end
endmodule
