module ALU_1_1(mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
             mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
             biase,truncated_data);
input signed[15:0] mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
                   mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
                   biase;
output signed[16:0] truncated_data;

wire signed[31:0] original_data; 
wire signed[16:0] truncated_data2;
wire signed [15:0] truncated_data1;

assign original_data=mula1*mulw1+mula2*mulw2+mula3*mulw3+mula4*mulw4+mula5*mulw5+mula6*mulw6+mula7*mulw7+mula8*mulw8+mula9*mulw9+mula10*mulw10+mula11*mulw11+mula12*mulw12+mula13*mulw13+mula14*mulw14+mula15*mulw15+mula16*mulw16;
truncate32_16 U1(.original_data(original_data), .truncated_data(truncated_data1));
assign truncated_data=truncated_data1+biase;
//assign truncated_data = {truncated_data1[16]}

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
//wire signed[15:0] truncated_data;
//wire signed[31:0] muls1,muls2,muls3,muls4,muls5,muls6,muls7,muls8,muls9,muls10,muls11,muls12,muls13,muls14,muls15,muls16,
//           mulr1,mulr2,mulr3,mulr4,mulr5,mulr6,mulr7,mulr8,mulr9,mulr10,mulr11,mulr12,mulr13,mulr14,mulr15,mulr16;
//
//original2complement a1(.original_data(muls1), .complement_data(mulr1));
//original2complement a2(.original_data(muls2), .complement_data(mulr2));
//original2complement a3(.original_data(muls3), .complement_data(mulr3));
//original2complement a4(.original_data(muls4), .complement_data(mulr4));
//original2complement a5(.original_data(muls5), .complement_data(mulr5));
//original2complement a6(.original_data(muls6), .complement_data(mulr6));
//original2complement a7(.original_data(muls7), .complement_data(mulr7));
//original2complement a8(.original_data(muls8), .complement_data(mulr8));
//original2complement a9(.original_data(muls9), .complement_data(mulr9));
//original2complement a10(.original_data(muls10), .complement_data(mulr10));
//original2complement a11(.original_data(muls11), .complement_data(mulr11));
//original2complement a12(.original_data(muls12), .complement_data(mulr12));
//original2complement a13(.original_data(muls13), .complement_data(mulr13));
//original2complement a14(.original_data(muls14), .complement_data(mulr14));
//original2complement a15(.original_data(muls15), .complement_data(mulr15));
//original2complement a16(.original_data(muls16), .complement_data(mulr16));
//
//assign muls1=mula1*mulw1;
//assign muls2=mula2*mulw2;
//assign muls3=mula3*mulw3;
//assign muls4=mula4*mulw4;
//assign muls5=mula5*mulw5;
//assign muls6=mula6*mulw6;
//assign muls7=mula7*mulw7;
//assign muls8=mula8*mulw8;
//assign muls9=mula9*mulw9;
//assign muls10=mula10*mulw10;
//assign muls11=mula11*mulw11;
//assign muls12=mula12*mulw12;
//assign muls13=mula13*mulw13;
//assign muls14=mula14*mulw14;
//assign muls15=mula15*mulw15;
//assign muls16=mula16*mulw16;
//assign original_data=mulr1+mulr2+mulr3+mulr4+mulr5+mulr6+mulr7+mulr8+mulr9+mulr10+mulr11+mulr12+mulr13+mulr14+mulr15+mulr16+biase;
//truncate32_16 U1(.original_data(original_data), .truncated_data(truncated_data));
//
//
//endmodule