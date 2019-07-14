module top_entity(clk,
                  input_data1,input_data2,input_data3,input_data4,
                  input_data5,input_data6,input_data7,input_data8,
                  input_data9,input_data10,input_data11,input_data12,
                  input_data13,input_data14,input_data15,input_data16,
                  wren1,q1,addr_bw1,complete1,address_read_2,
						address_weight_2,addr_biase_2,biase_ena_2,wren2,q2);
parameter address_read=8'd60;
input[15:0] input_data1,input_data2,input_data3,input_data4,
            input_data5,input_data6,input_data7,input_data8,
            input_data9,input_data10,input_data11,input_data12,
            input_data13,input_data14,input_data15,input_data16;
input clk;
input wren1;
input wren2;
input biase_ena_2;
input[8:0] addr_bw1;
input[16:0]address_weight_2;
input[7:0]addr_biase_2;
input[8:0]address_read_2;
output[15:0] q1;	
output[15:0] q2;	
output complete1;

wire clk;
wire biase_ena_2;
wire wren1;
wire complete1;
wire [15:0] q2;	
wire unsigned [8:0]addr_w1;

wire [15:0]mulw1_1,mulw1_2,mulw1_3,mulw1_4,
           mulw1_5,mulw1_6,mulw1_7,mulw1_8,
           mulw1_9,mulw1_10,mulw1_11,mulw1_12,
           mulw1_13,mulw1_14,mulw1_15,mulw1_16,
           biase1,truncated_data1,q1;
			  
wire[15:0] d2_1;
wire[15:0] d2_2;
wire[15:0] d2_3;
wire[15:0] d2_4;
wire[15:0] d2_5;
wire[15:0] d2_6;
wire[15:0] d2_7;
wire[15:0] d2_8;
wire[15:0] d2_9;
wire[15:0] d2_10;
wire[15:0] d2_11;
wire[15:0] d2_12;
wire[15:0] d2_13;
wire[15:0] d2_14;
wire[15:0] d2_15;
wire[15:0] d2_16;

wire[15:0] mulw2_1;
wire[15:0] mulw2_2;
wire[15:0] mulw2_3;
wire[15:0] mulw2_4;
wire[15:0] mulw2_5;
wire[15:0] mulw2_6;
wire[15:0] mulw2_7;
wire[15:0] mulw2_8;
wire[15:0] mulw2_9;
wire[15:0] mulw2_10;
wire[15:0] mulw2_11;
wire[15:0] mulw2_12;
wire[15:0] mulw2_13;
wire[15:0] mulw2_14;
wire[15:0] mulw2_15;
wire[15:0] mulw2_16;

wire unsigned[7:0] addr_biase_2;
wire[15:0] biase2;
wire[15:0] truncated_data2;
wire unsigned[16:0] address_weight_2_1;
wire unsigned[16:0] address_weight_2_2;
wire unsigned[16:0] address_weight_2_3;
wire unsigned[16:0] address_weight_2_4;
wire unsigned[16:0] address_weight_2_5;
wire unsigned[16:0] address_weight_2_6;
wire unsigned[16:0] address_weight_2_7;
wire unsigned[16:0] address_weight_2_8;
wire unsigned[16:0] address_weight_2_9;
wire unsigned[16:0] address_weight_2_10;
wire unsigned[16:0] address_weight_2_11;
wire unsigned[16:0] address_weight_2_12;
wire unsigned[16:0] address_weight_2_13;
wire unsigned[16:0] address_weight_2_14;
wire unsigned[16:0] address_weight_2_15;
wire unsigned[16:0] address_weight_2_16;


assign complete1=!wren1;
assign addr_w1=addr_bw1-9'd2;
assign address_weight_2_1=address_weight_2;
assign address_weight_2_2=address_weight_2+17'd1;
assign address_weight_2_3=address_weight_2+17'd2;
assign address_weight_2_4=address_weight_2+17'd3;
assign address_weight_2_5=address_weight_2+17'd4;
assign address_weight_2_6=address_weight_2+17'd5;
assign address_weight_2_7=address_weight_2+17'd6;
assign address_weight_2_8=address_weight_2+17'd7;
assign address_weight_2_9=address_weight_2+17'd8;
assign address_weight_2_10=address_weight_2+17'd9;
assign address_weight_2_11=address_weight_2+17'd10;
assign address_weight_2_12=address_weight_2+17'd11;
assign address_weight_2_13=address_weight_2+17'd12;
assign address_weight_2_14=address_weight_2+17'd13;
assign address_weight_2_15=address_weight_2+17'd14;
assign address_weight_2_16=address_weight_2+17'd15;


rom_biase r_rom_biase (.address(addr_bw1),.clock(clk),.q(biase1));

rom_weight_1 r_rom_weight_1(.address(addr_bw1),.clock(clk),.q(mulw1_1));
rom_weight_2 r_rom_weight_2(.address(addr_bw1),.clock(clk),.q(mulw1_2));
rom_weight_3 r_rom_weight_3(.address(addr_bw1),.clock(clk),.q(mulw1_3));
rom_weight_4 r_rom_weight_4(.address(addr_bw1),.clock(clk),.q(mulw1_4));
rom_weight_5 r_rom_weight_5(.address(addr_bw1),.clock(clk),.q(mulw1_5));
rom_weight_6 r_rom_weight_6(.address(addr_bw1),.clock(clk),.q(mulw1_6));
rom_weight_7 r_rom_weight_7(.address(addr_bw1),.clock(clk),.q(mulw1_7));
rom_weight_8 r_rom_weight_8(.address(addr_bw1),.clock(clk),.q(mulw1_8));
rom_weight_9 r_rom_weight_9(.address(addr_bw1),.clock(clk),.q(mulw1_9));
rom_weight_10 r_rom_weight_10(.address(addr_bw1),.clock(clk),.q(mulw1_10));
rom_weight_11 r_rom_weight_11(.address(addr_bw1),.clock(clk),.q(mulw1_11));
rom_weight_12 r_rom_weight_12(.address(addr_bw1),.clock(clk),.q(mulw1_12));
rom_weight_12 r_rom_weight_13(.address(addr_bw1),.clock(clk),.q(mulw1_13));
rom_weight_12 r_rom_weight_14(.address(addr_bw1),.clock(clk),.q(mulw1_14));
rom_weight_12 r_rom_weight_15(.address(addr_bw1),.clock(clk),.q(mulw1_15));
rom_weight_12 r_rom_weight_16(.address(addr_bw1),.clock(clk),.q(mulw1_16));

ALU_1 r_ALU_1(.mula1(input_data1),.mula2(input_data2),.mula3(input_data3),.mula4(input_data4),
              .mula5(input_data5),.mula6(input_data6),.mula7(input_data7),.mula8(input_data8),
              .mula9(input_data9),.mula10(input_data10),.mula11(input_data11),.mula12(input_data12),
              .mula13(input_data13),.mula14(input_data14),.mula15(input_data15),.mula16(input_data16),
              .mulw1(mulw1_1),.mulw2(mulw1_2),.mulw3(mulw1_3),.mulw4(mulw1_4),
              .mulw5(mulw1_5),.mulw6(mulw1_6),.mulw7(mulw1_7),.mulw8(mulw1_8),
              .mulw9(mulw1_9),.mulw10(mulw1_10),.mulw11(mulw1_11),.mulw12(mulw1_12),
              .mulw13(mulw1_13),.mulw14(mulw1_14),.mulw15(mulw1_15),.mulw16(mulw1_16),
              .biase(biase1),.truncated_data(truncated_data1));
				  

ram_1_16 r_ram_1_16(
        //input:
        .clk(clk),
        .wren(wren1),
        .din(truncated_data1),
        .waddr(addr_w1),
//        .raddr(addr_bw1),
		  .raddr(address_read_2),
        //output:
        .dout1(d2_1),
		  .dout2(d2_2),
		  .dout3(d2_3),
		  .dout4(d2_4),
		  .dout5(d2_5),
		  .dout6(d2_6),
		  .dout7(d2_7),
		  .dout8(d2_8),
		  .dout9(d2_9),
		  .dout10(d2_10),
		  .dout11(d2_11),
		  .dout12(d2_12),
		  .dout13(d2_13),
		  .dout14(d2_14),
		  .dout15(d2_15),
		  .dout16(d2_16)
        );


rom_biase2 r_rom_biase2 (
	.address(addr_biase_2),
	.clock(clk),
	.q(biase2));
rom_weight2 r_rom_weight2_1 (.address(address_weight_2_1),.clock(clk),.q(mulw2_1));	
//rom_weight2 r_rom_weight2_1 (.address(address_read),.clock(clk),.q(mulw2_1));	
rom_weight2 r_rom_weight2_2 (.address(address_weight_2_2),.clock(clk),.q(mulw2_2));	
rom_weight2 r_rom_weight2_3 (.address(address_weight_2_3),.clock(clk),.q(mulw2_3));	
rom_weight2 r_rom_weight2_4 (.address(address_weight_2_4),.clock(clk),.q(mulw2_4));	
rom_weight2 r_rom_weight2_5 (.address(address_weight_2_5),.clock(clk),.q(mulw2_5));	
rom_weight2 r_rom_weight2_6 (.address(address_weight_2_6),.clock(clk),.q(mulw2_6));	
rom_weight2 r_rom_weight2_7 (.address(address_weight_2_7),.clock(clk),.q(mulw2_7));	
rom_weight2 r_rom_weight2_8 (.address(address_weight_2_8),.clock(clk),.q(mulw2_8));	
rom_weight2 r_rom_weight2_9 (.address(address_weight_2_9),.clock(clk),.q(mulw2_9));	
rom_weight2 r_rom_weight2_10 (.address(address_weight_2_10),.clock(clk),.q(mulw2_10));	
rom_weight2 r_rom_weight2_11 (.address(address_weight_2_11),.clock(clk),.q(mulw2_11));	
rom_weight2 r_rom_weight2_12 (.address(address_weight_2_12),.clock(clk),.q(mulw2_12));	
rom_weight2 r_rom_weight2_13 (.address(address_weight_2_13),.clock(clk),.q(mulw2_13));	
rom_weight2 r_rom_weight2_14 (.address(address_weight_2_14),.clock(clk),.q(mulw2_14));	
rom_weight2 r_rom_weight2_15 (.address(address_weight_2_15),.clock(clk),.q(mulw2_15));	
rom_weight2 r_rom_weight2_16 (.address(address_weight_2_16),.clock(clk),.q(mulw2_16));	

ALU_2 r_ALU_2(.mula1(d2_1),.mula2(d2_2),.mula3(d2_3),.mula4(d2_4),
              .mula5(d2_5),.mula6(d2_6),.mula7(d2_7),.mula8(d2_8),
              .mula9(d2_9),.mula10(d2_10),.mula11(d2_11),.mula12(d2_12),
              .mula13(d2_13),.mula14(d2_14),.mula15(d2_15),.mula16(d2_16),
				  .mulw1(mulw2_1),.mulw2(mulw2_2),.mulw3(mulw2_3),.mulw4(mulw2_4),
              .mulw5(mulw2_5),.mulw6(mulw2_6),.mulw7(mulw2_7),.mulw8(mulw2_8),
              .mulw9(mulw2_9),.mulw10(mulw2_10),.mulw11(mulw2_11),.mulw12(mulw2_12),
              .mulw13(mulw2_13),.mulw14(mulw2_14),.mulw15(mulw2_15),.mulw16(mulw2_16),
              .biase(biase2),.truncated_data(truncated_data2),.clk(clk),
				  .pre_data(truncated_data2),.biase_ena(biase_ena_2));
			  
ram_2_16 r_ram_2_16(
	  //input:
	  .clk(clk),
	  .wren(wren2),
	  .din(truncated_data2),
	  .waddr(addr_biase_2),
	  .raddr(address_read),
	  //output:
	  .dout1(q2),
	  .dout2(),
	  .dout3(),
	  .dout4(),
	  .dout5(),
	  .dout6(),
	  .dout7(),
	  .dout8(),
	  .dout9(),
	  .dout10(),
	  .dout11(),
	  .dout12(),
	  .dout13(),
	  .dout14(),
	  .dout15(),
	  .dout16()
	  );		  

endmodule