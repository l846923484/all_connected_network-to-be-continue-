module truncate32_16(original_data, truncated_data);
input [31:0] original_data;
output [15:0] truncated_data;


wire[15:0] truncated_data;
reg[31:0] transfer_data1;
reg[14:0] transfer_data2;

always@(original_data)
 begin
   if(original_data[31])
     begin
	  
     transfer_data1=~(original_data-32'b1);
     transfer_data2= ~transfer_data1[23:9]+15'b1;
     
     end
   else
     transfer_data2=original_data[23:9];
 end
 assign truncated_data={original_data[31],transfer_data2};
 endmodule
