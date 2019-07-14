module ALU_1_2(mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
             mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
             biase,truncated_data);
input signed[15:0] mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
                   mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
                   biase;
output signed[15:0] truncated_data;

wire signed[15:0] truncated_data1;

wire signed[31:0] original_data;
wire signed[31:0] original_data1; 
wire signed[31:0] sign;
wire signed[31:0] mulr1;
wire signed[31:0] mulr2;
wire signed[31:0] mulr3;
wire signed[31:0] mulr4;
wire signed[31:0] mulr5;
wire signed[31:0] mulr6;
wire signed[31:0] mulr7;
wire signed[31:0] mulr8;
wire signed[31:0] mulr9;
wire signed[31:0] mulr10;
wire signed[31:0] mulr11;
wire signed[31:0] mulr12;
wire signed[31:0] mulr13;
wire signed[31:0] mulr14;
wire signed[31:0] mulr15;
wire signed[31:0] mulr16;

wire signed[31:0] muls1;
wire signed[31:0] muls2;
wire signed[31:0] muls3;
wire signed[31:0] muls4;
wire signed[31:0] muls5;
wire signed[31:0] muls6;
wire signed[31:0] muls7;
wire signed[31:0] muls8;
wire signed[31:0] muls9;
wire signed[31:0] muls10;
wire signed[31:0] muls11;
wire signed[31:0] muls12;
wire signed[31:0] muls13;
wire signed[31:0] muls14;


assign mulr1=mula1*mulw1;
assign mulr2=mula2*mulw2;
assign mulr3=mula3*mulw3;
assign mulr4=mula4*mulw4;
assign mulr5=mula5*mulw5;
assign mulr6=mula6*mulw6;
assign mulr7=mula7*mulw7;
assign mulr8=mula8*mulw8;
assign mulr9=mula9*mulw9;
assign mulr10=mula10*mulw10;
assign mulr11=mula11*mulw11;
assign mulr12=mula12*mulw12;
assign mulr13=mula13*mulw13;
assign mulr14=mula14*mulw14;
assign mulr15=mula15*mulw15;
assign mulr16=mula16*mulw16;

add32 add32_1(.dataa(mulr1),.datab(mulr2),.result(muls1));
add32 add32_2(.dataa(muls1),.datab(mulr3),.result(muls2));
add32 add32_3(.dataa(muls2),.datab(mulr4),.result(muls3));
add32 add32_4(.dataa(muls3),.datab(mulr5),.result(muls4));
add32 add32_5(.dataa(muls4),.datab(mulr6),.result(muls5));
add32 add32_6(.dataa(muls5),.datab(mulr7),.result(muls6));
add32 add32_7(.dataa(muls6),.datab(mulr8),.result(muls7));
add32 add32_8(.dataa(muls7),.datab(mulr9),.result(muls8));
add32 add32_9(.dataa(muls8),.datab(mulr10),.result(muls9));
add32 add32_10(.dataa(muls9),.datab(mulr11),.result(muls10));
add32 add32_11(.dataa(muls10),.datab(mulr12),.result(muls11));
add32 add32_12(.dataa(muls11),.datab(mulr13),.result(muls12));
add32 add32_13(.dataa(muls12),.datab(mulr14),.result(muls13));
add32 add32_14(.dataa(muls13),.datab(mulr15),.result(muls14));
add32 add32_15(.dataa(muls14),.datab(mulr16),.result(original_data));
assign original_data1=mula1*mulw1+mula2*mulw2+mula3*mulw3+mula4*mulw4+mula5*mulw5+mula6*mulw6+mula7*mulw7+mula8*mulw8+mula9*mulw9+mula10*mulw10+mula11*mulw11+mula12*mulw12+mula13*mulw13+mula14*mulw14+mula15*mulw15+mula16*mulw16;
assign sign=original_data1^original_data;
truncate32_16 U1(.original_data(original_data), .truncated_data(truncated_data1));
//assign truncated_data=truncated_data1+biase;
add16 add16_1(
   	   .dataa(truncated_data1),
	      .datab(biase),
	      .result(truncated_data)); 
endmodule

//module ALU_1(mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
//             mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
//             biase,truncated_data);
//input signed[15:0] mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
//                   mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
//                   biase;
//output signed[15:0] truncated_data;
//
//wire signed[31:0] original_data; 
//wire signed [15:0] truncated_data1;
//
//assign original_data=mula1*mulw1+mula2*mulw2+mula3*mulw3+mula4*mulw4+mula5*mulw5+mula6*mulw6+mula7*mulw7+mula8*mulw8+mula9*mulw9+mula10*mulw10+mula11*mulw11+mula12*mulw12+mula13*mulw13+mula14*mulw14+mula15*mulw15+mula16*mulw16;
//truncate32_16 U1(.original_data(original_data), .truncated_data(truncated_data1));
//add add1(
//   	   .dataa(truncated_data1),
//	      .datab(biase),
//	      .result(truncated_data)); 
//endmodule