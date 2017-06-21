 //Yigit Suoglu
//pure combinational 16bit multiplier
module multiplier_16bit(multiplicand, multiplier, product);
  input [15:0] multiplicand, multiplier;
  reg [31:0] mid[15:0];
  wire [31:0] multiplicand_ext;
  output reg [31:0] product;
  integer i;

  assign multiplicand_ext = {16'd0, multiplicand}; //not requared


  always@*
    begin
      mid[0] = multiplicand_ext & {32{multiplier[0]}};
      for(i = 1; i < 16; i = i + 1)
        begin
          mid[i] = (multiplicand_ext << i )& {32{multiplier[i]}};
        end
        product = mid[0] + mid[1] + mid[2] + mid[3] + mid[4] + mid[5]
                  + mid[6] + mid[7] + mid[8] + mid[9] + mid[10]
                  + mid[11] + mid[12] + mid[13] + mid[14] + mid[15];
    end



endmodule // multiplier_16bi
