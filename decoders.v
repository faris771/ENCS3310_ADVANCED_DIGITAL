/*
    GROUP : Faris Abufarha 1200546
            Ayman Salama  1200488
*/


module DECODER2(x,y,e,d);
    input x,y,e;

    output [3:0] d;
    
    assign d[0]  = e & ~x & ~y;
    assign d[1]  = e & ~x & y;
    assign d[2]  = e & x & ~y;
    assign d[3]  = e & x & y;//end of decoder2



endmodule
module TSTDECODER;

    reg TA,TB,TE;
    wire [3:0] TD;
    
    DECODER2 dummy(TA,TB,TE,TD);


    initial begin
        {TA,TB,TE} = 3'b000;

        repeat(7)

        #10ns{TA,TB,TE} = {TA,TB,TE} + 3'b001;

    end
	   
endmodule



module DECODER3(b,c,a,d); //decoder3 

    input a,b,c;
    output [7:0] d;
    
    DECODER2 G1(b,c,a,d[7:4]); // a here works like enable for decoder2 
    DECODER2 G2(b,c,~a, d[3:0]); 






endmodule

module TSTDECODER3;
    reg TA,TB,TC;
    wire [7:0] TD;
    
    DECODER3 dummy(TB,TC,TA,TD);
    
    initial begin
        {TA,TB,TC} = 3'b000;
        repeat(7)
        #10ns{TA,TB,TC} = {TA,TB,TC} + 3'b001;
    end


endmodule




