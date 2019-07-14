module ctrl_1(clk,reset,wren1,
              input_data1,input_data2,input_data3,input_data4,
              input_data5,input_data6,input_data7,input_data8,
              input_data9,input_data10,input_data11,input_data12,
              input_data13,input_data14,input_data15,input_data16,
				  q1,complete1,complete2);
input clk,reset;
input[15:0] input_data1,input_data2,input_data3,input_data4,
            input_data5,input_data6,input_data7,input_data8,
            input_data9,input_data10,input_data11,input_data12,
            input_data13,input_data14,input_data15,input_data16;
output wren1;
output complete1;
output complete2;
output[15:0] q1;

reg wren1;
reg a1;
reg a2;
reg complete2;
reg biase_ena_2;
reg wren2;
reg unsigned [8:0] addr_bw1;
reg unsigned [8:0] address_read_2;
reg unsigned [7:0] addr_biase_2;
wire unsigned [16:0]address_weight_2;

top_entity r_top_entity(.clk(clk),
                        .input_data1(input_data1),.input_data2(input_data2),.input_data3(input_data3),.input_data4(input_data4),
                        .input_data5(input_data5),.input_data6(input_data6),.input_data7(input_data7),.input_data8(input_data8),
                        .input_data9(input_data9),.input_data10(input_data10),.input_data11(input_data11),.input_data12(input_data12),
                        .input_data13(input_data13),.input_data14(input_data14),.input_data15(input_data15),.input_data16(input_data16),
                        .wren1(wren1),.q1(q1),.addr_bw1(addr_bw1),.complete1(complete1),.address_read_2(address_read_2),
								.address_weight_2(address_weight_2),.addr_biase_2(addr_biase_2),.biase_ena_2(biase_ena_2),
								.wren2(wren2),.q2());

always@(posedge clk or posedge reset)
  begin
    if(reset)
        begin
          addr_bw1<=9'b000000000;
//        wren1<=1;
			 a1<=1;
        end
    else
      begin
        if (addr_bw1==9'b111111111)
          begin
          //complete<=1;
			 a1<=0;
//        wren1<=0;
			 addr_bw1<=addr_bw1+9'b000000001;
          end
        else
          begin
          addr_bw1<=addr_bw1+9'b000000001;
          end
      end	
		a2<=a1;
		wren1<=a2;			
  end
always@(posedge clk or posedge reset)
  begin
    if(reset)
	   begin
		complete2<=0;
		wren2<=0;
		address_read_2<=9'b0;
		addr_biase_2<=17'b0;
		biase_ena_2<=1;
		end
	 else
	   begin
		if(complete1)
		  begin
			if(complete2)
			  begin
			  wren2<=0;
			  end
			else
			  begin
			  address_read_2<=address_read_2+9'd16;
			  if(address_read_2==0)
				 begin
				 biase_ena_2<=1;
				 end
			  else
				 begin
				 biase_ena_2<=0;
				 end
			  if(address_read_2==9'd496)
				 begin
				 wren2<=1;
				 addr_biase_2<=addr_biase_2+8'b1;
				 if(addr_biase_2==8'd255)
					begin
					complete2<=1;
					end
				 end
			  else
				 begin
				 wren2<=0;
				 end
			  end
			end
		end
  end
 
assign address_weight_2=addr_biase_2*512+address_read_2;  
		
		
    
endmodule


//module ctrl_1(clk,reset,
//              input_data1,input_data2,input_data3,input_data4,
//              input_data5,input_data6,input_data7,input_data8,
//              input_data9,input_data10,input_data11,input_data12,
//              input_data13,input_data14,input_data15,input_data16,
//              complete,q,addr_bw);
//input clk,reset;
//input[15:0] input_data1,input_data2,input_data3,input_data4,
//           input_data5,input_data6,input_data7,input_data8,
//           input_data9,input_data10,input_data11,input_data12,
//           input_data13,input_data14,input_data15,input_data16;
//output complete;
//output[15:0] q;
//output[8:0] addr_bw;
//
//
//wire wren;
//reg complete;
//reg complete_1;
//reg a1;
//reg a2;
//wire [15:0]mulw1,mulw2,mulw3,mulw4,
//           mulw5,mulw6,mulw7,mulw8,
//           mulw9,mulw10,mulw11,mulw12,
//           mulw13,mulw14,mulw15,mulw16,
//           biase,truncated_data,q;
//reg [8:0] addr_bw;
//reg[15:0] d2_1;
//reg[15:0] d2_2;
//reg[15:0] d2_3;
//reg[15:0] d2_4;
//reg[15:0] d2_5;
//reg[15:0] d2_6;
//reg[15:0] d2_7;
//reg[15:0] d2_8;
//reg[15:0] d2_9;
//reg[15:0] d2_10;
//reg[15:0] d2_11;
//reg[15:0] d2_12;
//reg[15:0] d2_13;
//reg[15:0] d2_14;
//reg[15:0] d2_15;
//reg[15:0] d2_16;
//
//reg[15:0] mulw2_1;
//reg[15:0] mulw2_2;
//reg[15:0] mulw2_3;
//reg[15:0] mulw2_4;
//reg[15:0] mulw2_5;
//reg[15:0] mulw2_6;
//reg[15:0] mulw2_7;
//reg[15:0] mulw2_8;
//reg[15:0] mulw2_9;
//reg[15:0] mulw2_10;
//reg[15:0] mulw2_11;
//reg[15:0] mulw2_12;
//reg[15:0] mulw2_13;
//reg[15:0] mulw2_14;
//reg[15:0] mulw2_15;
//reg[15:0] mulw2_16;
//
//
//assign wren=!complete_1;
//
//rom_biase r_rom_biase (.address(addr_bw),.clock(clk),.q(biase));
//
//rom_weight_1 r_rom_weight_1(.address(addr_bw),.clock(clk),.q(mulw1));
//rom_weight_2 r_rom_weight_2(.address(addr_bw),.clock(clk),.q(mulw2));
//rom_weight_3 r_rom_weight_3(.address(addr_bw),.clock(clk),.q(mulw3));
//rom_weight_4 r_rom_weight_4(.address(addr_bw),.clock(clk),.q(mulw4));
//rom_weight_5 r_rom_weight_5(.address(addr_bw),.clock(clk),.q(mulw5));
//rom_weight_6 r_rom_weight_6(.address(addr_bw),.clock(clk),.q(mulw6));
//rom_weight_7 r_rom_weight_7(.address(addr_bw),.clock(clk),.q(mulw7));
//rom_weight_8 r_rom_weight_8(.address(addr_bw),.clock(clk),.q(mulw8));
//rom_weight_9 r_rom_weight_9(.address(addr_bw),.clock(clk),.q(mulw9));
//rom_weight_10 r_rom_weight_10(.address(addr_bw),.clock(clk),.q(mulw10));
//rom_weight_11 r_rom_weight_11(.address(addr_bw),.clock(clk),.q(mulw11));
//rom_weight_12 r_rom_weight_12(.address(addr_bw),.clock(clk),.q(mulw12));
//rom_weight_12 r_rom_weight_13(.address(addr_bw),.clock(clk),.q(mulw13));
//rom_weight_12 r_rom_weight_14(.address(addr_bw),.clock(clk),.q(mulw14));
//rom_weight_12 r_rom_weight_15(.address(addr_bw),.clock(clk),.q(mulw15));
//rom_weight_12 r_rom_weight_16(.address(addr_bw),.clock(clk),.q(mulw16));
//
//ALU_1 r_ALU_1(.mula1(input_data1),.mula2(input_data2),.mula3(input_data3),.mula4(input_data4),
//              .mula5(input_data5),.mula6(input_data6),.mula7(input_data7),.mula8(input_data8),
//              .mula9(input_data9),.mula10(input_data10),.mula11(input_data11),.mula12(input_data12),
//              .mula13(input_data13),.mula14(input_data14),.mula15(input_data15),.mula16(input_data16),
//              .mulw1(mulw1),.mulw2(mulw2),.mulw3(mulw3),.mulw4(mulw4),
//              .mulw5(mulw5),.mulw6(mulw6),.mulw7(mulw7),.mulw8(mulw8),
//              .mulw9(mulw9),.mulw10(mulw10),.mulw11(mulw11),.mulw12(mulw12),
//              .mulw13(mulw13),.mulw14(mulw14),.mulw15(mulw15),.mulw16(mulw16),
//              .biase(biase),.truncated_data(truncated_data));
//				  
//ALU_1 r_ALU_2(.mula1(d2_1),.mula2(d2_2),.mula3(d2_3),.mula4(d2_4),
//              .mula5(d2_5),.mula6(d2_6),.mula7(d2_7),.mula8(d2_8),
//              .mula9(d2_9),.mula10(d2_10),.mula11(d2_11),.mula12(d2_12),
//              .mula13(d2_13),.mula14(d2_14),.mula15(d2_15),.mula16(d2_16),
//				  .mulw1(mulw2_1),.mulw2(mulw2_2),.mulw3(mulw2_3),.mulw4(mulw2_4),
//              .mulw5(mulw2_5),.mulw6(mulw2_6),.mulw7(mulw2_7),.mulw8(mulw2_8),
//              .mulw9(mulw2_9),.mulw10(mulw2_10),.mulw11(mulw2_11),.mulw12(mulw2_12),
//              .mulw13(mulw2_13),.mulw14(mulw2_14),.mulw15(mulw2_15),.mulw16(mulw2_16),
//              .biase(biase),.truncated_data(truncated_data));
//			  
//ram_1 r_ram_1(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_1));
//ram_1 r_ram_2(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_2));
//ram_1 r_ram_3(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_3));
//ram_1 r_ram_4(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_4));
//ram_1 r_ram_5(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_5));
//ram_1 r_ram_6(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_6));
//ram_1 r_ram_7(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_7));
//ram_1 r_ram_8(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_8));
//ram_1 r_ram_9(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_9));
//ram_1 r_ram_10(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_10));
//ram_1 r_ram_11(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_11));
//ram_1 r_ram_12(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_12));
//ram_1 r_ram_13(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_13));
//ram_1 r_ram_14(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_14));
//ram_1 r_ram_15(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_15));
//ram_1 r_ram_16(.address(addr_bw),.clock(clk),.data(truncated_data),.wren(wren),.q(d2_16));
//
//
//rom_weight2 r_rom_weight2_1 (.address(address_weight_2),.clock(clk),.q(mulw2_1));	
//rom_weight2 r_rom_weight2_2 (.address(address_weight_2),.clock(clk),.q(mulw2_2));	
//rom_weight2 r_rom_weight2_3 (.address(address_weight_2),.clock(clk),.q(mulw2_3));	
//rom_weight2 r_rom_weight2_4 (.address(address_weight_2),.clock(clk),.q(mulw2_4));	
//rom_weight2 r_rom_weight2_5 (.address(address_weight_2),.clock(clk),.q(mulw2_5));	
//rom_weight2 r_rom_weight2_6 (.address(address_weight_2),.clock(clk),.q(mulw2_6));	
//rom_weight2 r_rom_weight2_7 (.address(address_weight_2),.clock(clk),.q(mulw2_7));	
//rom_weight2 r_rom_weight2_8 (.address(address_weight_2),.clock(clk),.q(mulw2_8));	
//rom_weight2 r_rom_weight2_9 (.address(address_weight_2),.clock(clk),.q(mulw2_9));	
//rom_weight2 r_rom_weight2_10 (.address(address_weight_2),.clock(clk),.q(mulw2_10));	
//rom_weight2 r_rom_weight2_11 (.address(address_weight_2),.clock(clk),.q(mulw2_11));	
//rom_weight2 r_rom_weight2_12 (.address(address_weight_2),.clock(clk),.q(mulw2_12));	
//rom_weight2 r_rom_weight2_13 (.address(address_weight_2),.clock(clk),.q(mulw2_13));	
//rom_weight2 r_rom_weight2_14 (.address(address_weight_2),.clock(clk),.q(mulw2_14));	
//rom_weight2 r_rom_weight2_15 (.address(address_weight_2),.clock(clk),.q(mulw2_15));	
//rom_weight2 r_rom_weight2_16 (.address(address_weight_2),.clock(clk),.q(mulw2_16));	
//
//
//always@(posedge clk or posedge reset)
//  begin
//    if(reset)
//        begin
//          addr_bw<=9'b000000000;
//          //complete<=0;
//			 a1<=0;
//        end
//    else
//      begin
//        if (addr_bw==9'b111111111)
//          begin
//            //complete<=1;
//				a1<=1;
//            addr_bw<=addr_bw+9'b000000001;
//          end
//        else
//          begin
//            addr_bw<=addr_bw+9'b000000001;
//          end
//      end	
//		a2<=a1;
//		complete_1<=a2;			
//  end
//  
//  
//always@(posedge clk or posedge complete_1)	 
//  begin
//  if(complete_1)
//    
//endmodule