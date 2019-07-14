module ALU_2(mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
             mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
             biase,truncated_data,clk,pre_data,biase_ena);
input signed[15:0] mula1,mula2,mula3,mula4,mula5,mula6,mula7,mula8,mula9,mula10,mula11,mula12,mula13,mula14,mula15,mula16,
                   mulw1,mulw2,mulw3,mulw4,mulw5,mulw6,mulw7,mulw8,mulw9,mulw10,mulw11,mulw12,mulw13,mulw14,mulw15,mulw16,
                   biase,clk;
input signed[15:0] pre_data;
input biase_ena;
output signed[15:0] truncated_data;

wire biase_ena;
reg signed[31:0] original_data; 
reg signed[15:0] truncated_data;
wire signed[15:0] truncated_data1;
wire signed[15:0] pre_data;

truncate32_16 U1(.original_data(original_data), .truncated_data(truncated_data1));

always@(posedge clk)
begin
original_data=mula1*mulw1+mula2*mulw2+mula3*mulw3+mula4*mulw4+mula5*mulw5+mula6*mulw6+mula7*mulw7+mula8*mulw8+mula9*mulw9+mula10*mulw10+mula11*mulw11+mula12*mulw12+mula13*mulw13+mula14*mulw14+mula15*mulw15+mula16*mulw16;
if (biase_ena)
  begin
    truncated_data=truncated_data1+biase;
  end
else
  begin
    truncated_data=truncated_data1+pre_data;
  end
end

endmodule