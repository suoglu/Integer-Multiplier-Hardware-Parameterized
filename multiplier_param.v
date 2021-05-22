  //Yigit Suoglu
 //pure combinational parameterized multiplier
//Adjust parameter "bit" as bit size of inputs, product will be 2*bit
module multiplier_parameterized#(parameter bit = 16)(multiplicand, multiplier, product);
  input [(bit -1):0] multiplicand, multiplier;
  reg [((2*bit)-1):0] mid[(bit -1):0]; //holds shifted values
  wire [((2*bit)-1):0] multiplicand_ext; //multiplicand extended to 2 * bit
  output reg [((2*bit)-1):0] product;
  integer i;

  assign multiplicand_ext = {{bit{1'b0}}, multiplicand}; //not required


  always@*
    begin
      mid[0] = multiplicand_ext & {(2*bit){multiplier[0]}};
      //Shifting
      for(i = 1; i < bit; i = i + 1)
        begin
          mid[i] = (multiplicand_ext << i )& {(2*bit){multiplier[i]}};
        end
      
      //Adding shifted valuess
      product = mid[0];
      for(i = 1; i < bit; i = i + 1)
         begin
            product = product + mid[i];
         end         
    end
endmodule // multiplier_parameterized
